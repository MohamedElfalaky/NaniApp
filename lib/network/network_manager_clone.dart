import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:parent_app/network/dio_config.dart';
import 'package:parent_app/network/parser_clone.dart';

class NetworkManagerClone {
  late Dio dio;

  NetworkManagerClone() {
    dio = DioConfig.getInstance();
  }

  Future<T> get<T>(String url, {Map<String, dynamic>? params}) async {
    try {
      if (params == null) params = {};
      print(params);
      Response response = await dio.get(url, queryParameters: params);

      return response.data;
      // return ParserClone.parseClone<T>(response.data);
    } catch (e, st) {
      rethrow;
    }
  }

  // Future<T> delete<T>(String url, {Map<String, dynamic>? params}) async {
  //   if (params == null) params = {};
  //   print(params);
  //   Response response = await dio.delete(url, queryParameters: params);
  //   return parseResponse<T>(response);
  // }

  // Future<BaseResponse<T>> getList<T>(String url,
  //     {Map<String, dynamic>? params}) async {
  //   if (params == null) params = {};
  //   Response response = await dio.get(url, queryParameters: params);

  //   return parseResponse<T>(response, isList: true);
  // }

  Future<T> post<T>(String url,
      {dynamic body = const {}, Map<String, dynamic>? headers}) async {
    try {
      if (body == null) body = {};
      print(body);

      var formData = (headers != null) ? body : json.encode(body);
      Response response = await dio.post(url,
          data: formData,
          options: (headers != null) ? Options(headers: headers) : null);

      return response.data;
    } catch (e, st) {
      rethrow;
    }
  }

//   Future<BaseResponse<T>> postString<T>(String url, {String? body}) async {
//     print(body);

//     // var formData = json.encode(body);
//     Response response = await dio.post(url, data: body);

//     return parseResponse<T>(response);
//   }

//   Future<BaseResponse<T>> postFile<T>(String url,
//       {Map<String, dynamic>? body}) async {
//     FormData formData = FormData.fromMap(body!);

//     Response response = await dio.post(url,
//         data: formData,
//         options: Options(headers: {"Content-Type": "multipart/form-data"}));
//     return parseResponse<T>(response);
//   }

//   Future<BaseResponse<T>> postQuery<T>(String url,
//       {Map<String, dynamic>? body = const {}}) async {
//     Response response = await dio.post(url, queryParameters: body);

//     return parseResponse<T>(response);
//   }

//   Future<BaseResponse<T>> postList<T>(String url,
//       {Map<String, dynamic>? body = const {}}) async {
//     if (body == null) body = {};
//     print(body);

//     var formData = json.encode(body);
//     Response response = await dio.post(url, data: formData);

//     return parseResponse<T>(response, isList: true);
//   }

//   Future<BaseResponse<T>> put<T>(String url, {dynamic body = const {}}) async {
//     var formData = json.encode(body);
//     Response response = await dio.put(url, data: formData);
//     return parseResponse<T>(response);
//   }

  // Future<BaseResponse<T>> parseResponse<T>(Response response,
  //     {bool isList = false}) async {
  //   // baseView?.hideProgress();
  //   if (response.statusCode != 200 && response.statusCode != 204) {
  //     if (response.data is String)
  //       throw (ErrorResponseModel.fromJson(response.statusCode!,
  //           data: response.statusMessage));
  //     else
  // throw (ErrorResponseModel.fromJson(response.statusCode!,
  //     json: response.data));
  //   }
  //   return BaseResponse<T>.fromJson(response.data, isList: isList);
  // }
}
