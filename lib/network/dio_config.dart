import 'dart:developer';

import 'package:parent_app/data/models/parent_user_model/parent_user_model.dart';
import 'package:parent_app/feature/settings/cache_services.dart';
import 'package:parent_app/feature/settings/myApplication.dart';
import 'package:parent_app/network/network_constants.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import 'package:dio/dio.dart';
import '../config/connection_config.dart';
// import 'package:dio/adapter.dart';

class DioConfig {
  static Dio? _instance;

  // method for getting dio instance
  static Dio getInstance() {
    _instance ??= createDioInstance();
    return _instance!;
  }

  static Dio createDioInstance() {
    var dio = Dio();

    Map<String, dynamic> headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json'
    };

    dio.options = BaseOptions(baseUrl: baseUrlDev, headers: headers);

    // adding interceptor
    // dio.interceptors.clear();
    // if (alice != null) dio.interceptors.add(alice!.getDioInterceptor()); production debugg

    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );

    /// SSL Pinning in production mode
    ///
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   /// SSL Pinning in production mode
    //   if (AppConfig.appMode == AppMode.PROD) {
    //     final certBytes = base64Decode(Endpoints.CERTIFICATE);
    //     final SecurityContext context = SecurityContext();
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => false;
    //     context.setTrustedCertificatesBytes(certBytes);

    //     return HttpClient(context: context);
    //   } else {
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;

    //     return client;
    //   }
    // };

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      //// refresh token work

      log("::: Api Url : ${options.uri}");

// TODO when handle cache
      if (CacheServices.instance.getParentModel() != null) {
        ParentUserModel? userModel = CacheServices.instance.getParentModel();
        if (userModel != null) {
          log(userModel.token!, name: 'Authorization token');
          headers['Authorization'] = "Bearer ${userModel.token}";
        }
      }
      dio.options = BaseOptions(baseUrl: baseUrlDev, headers: headers);
      options.headers = headers;

      if (!ConnectionConfig.instance.isConnected.value) {
        MyApplication.showToastView(
            message: 'Unable to connect to the Internet');

        return handler.reject(DioException(
          requestOptions: options,
          error: 'Unable to connect to the Internet',
          message: 'Unable to connect to the Internet',
          type: DioExceptionType.connectionError,
          // stackTrace: options.sta
        ));
      }

      handler.next(options); // modify your request
    }, onResponse: (response, handler) {
      // If the call to handler.next(response) is not made, the response won't proceed to the next step.
      if (response.statusCode! < 300) {
        return handler.next(response); // Everything's good, continue as usual.
      } else {
        // DioError can be thrown with any custom message or the message from the backend
        String? errorMessage = response.data["message"] ??
            "Received invalid status code: ${response.statusCode}";

        handler.reject(DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: errorMessage,
          message: errorMessage,
          type: DioExceptionType.badResponse,
        ));
      }
// on success it is getting called here
    }, onError: (DioException e, handler) async {
      String? errorMessage = e.response?.data["message"] ?? e.message;

      handler.reject(DioException(
          requestOptions: e.response!.requestOptions,
          response: e.response,
          error: errorMessage,
          message: errorMessage,
          type: e.type,
          stackTrace: e.stackTrace));

      //TODO refresh token
      // if (e.response != null) {
      //   if (e.response!.statusCode == 401) {
      //     //// new refresh token work start

      //     // final newToken = await newRefreshToken();
      //     // if (newToken != null) {
      //     //   dio.options.headers["Authorization"] = "Bearer " + newToken;
      //     //   return handler.resolve(await dio.fetch(e.requestOptions));
      //     // }

      //     //new refresh token work end
      //   } else if (e.response!.statusCode == 400) {
      //     return handler.resolve(e.response!);
      //   }

      //   //TODO to many requests
      //   //  else if (e.response!.statusCode == 429) {
      //   //   _baseView != null
      //   //       ? _baseView?.showErrorMsg('Too Many Requests')
      //   //       : AppDefaultToast().showErrorMsg('Too Many Requests');
      //   //   return handler.next(e);
      //   // }

      //   else {
      //     return handler.next(e);
      //   }

      // }
    }));
    return dio;
  }

//TODO refresh token
  // static Future<String?> newRefreshToken() async {
  //   try {
  //     // Response response;
  //     UserModel? currentUserModel = AppCache.instance.getUserModel();

  //     var _dio = Dio();
  //     Map<String, dynamic> headers = {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //       'Authorization': "Bearer ${currentUserModel!.refreshToken}"
  //     };
  //     _dio.options = BaseOptions(headers: headers);

  //     final response = await _dio.post(Endpoints.REFRESH_TOKEN);

  //     if (response.statusCode == 200) {
  //       final newToken = response.data["data"]["accessToken"];
  //       final newRefreshToken = response.data["data"]["refreshToken"];

  //       currentUserModel.token = newToken;
  //       currentUserModel.refreshToken = newRefreshToken;
  //       AppCache.instance.setUserModel(currentUserModel);

  //       return newToken;
  //     } else {
  //       _baseView!.navigateToReplacement(LoginScreen());
  //       AppCache.instance.logout();
  //       _baseView!.showErrorMsg('You must relogin');

  //       return null;
  //     }
  //   } catch (e) {
  //     _baseView!.navigateToReplacement(LoginScreen());
  //     AppCache.instance.logout();
  //     _baseView!.showErrorMsg('You must relogin');
  //     return null;
  //   }
  // }
}
