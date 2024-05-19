import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parent_app/data/models/child_model.dart';
import 'package:parent_app/data/models/parent_model.dart';
import 'package:parent_app/feature/settings/LocationService.dart';
import 'package:parent_app/feature/settings/myApplication.dart';
import 'package:parent_app/network/network_constants.dart';
import 'package:parent_app/network/network_manager_clone.dart';
import 'package:parent_app/util/validators.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  PageController registrationPageController = PageController(
    initialPage: 0,
  );
// Nani //
  List ageGroupPreference = ["Infants", "Toddlers", "Children"];
  List selectedAgeGroupPreference = [];
  List preferredActivities = [
    "Arts & crafts",
    "Storytelling",
    "Music",
    "Board-games",
    "Montessori"
  ];
  List selectedPreferredActivities = [];

  List regularAvailability = [
    "Sun. to Thurs.",
    "Friday",
    "Saturday",
  ];
  List selectedregularAvailability = [];

  List workingHours = [
    "8 a.m. ~ 12 p.m.",
    "12 p.m. ~ 4 p.m.",
    "4 p.m. ~ 8 p.m.",
    "8 p.m. ~ 12 a.m."
  ];
  List selectedWorkingHours = [];

  ////////////
  ////////////
  // Parent //
  ////////////
  ////////////

  ParentInfo? parentRegistrationModel = ParentInfo(
      parent: Parent(parentAddresses: [ParentAddress()], children: null));
  Future<void> registerParent() async {
    emit(RegistrationLoading());
    try {
      final response = await NetworkManagerClone().post(
          endPointRegisterNewParent,
          body: parentRegistrationModel?.toJson());

      emit(RegistrationSuccess());
    } on DioException catch (error, stackTrace) {
      MyApplication.showToastView(message: error.message ?? "");

      log(error.toString(), name: 'registerParent - msg');
      // log(error, name: 'registerParent - exception');
      log('${stackTrace}', name: 'registerParent - trace');
      emit(RegistrationError());
    } catch (error, stackTrace) {
      // if (dioError.type == DioExceptionType.badResponse) {
      //   String? backendErrorMessage = dioError.message;
      //   // Emit a failure state with the backend error message
      // } else {
      //   // Handle other types of DioError, if needed
      // }
      log(error.toString(), name: 'registerParent - msg');
      // log(error, name: 'registerParent - exception');
      log('${stackTrace}', name: 'registerParent - trace');
      emit(RegistrationError());
    }
  }

  List<ChildModel> childrenList = [];

  List mainPrefList = [
    {"name": "Arts & crafts", "isSelected": false},
    {"name": "Storytelling", "isSelected": false},
    {"name": "Music", "isSelected": false},
    {"name": "Football", "isSelected": false},
  ];

  addChild() {
    childrenList.add(ChildModel(id: DateTime.now()));
    emit(RegistrationInitial());
  }

  deleteChild(id) {
    childrenList.removeWhere(
      (element) {
        return element.id == id;
      },
    );

    emit(RegistrationInitial());
  }

// previousPage
  previousPage() {
    registrationPageController.previousPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  nextPage() {
    registrationPageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

// get location
  getLocation() async {
    emit(GetLocationLoading());

    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(RegistrationInitial());
        MyApplication.showToastView(
            message:
                'Location services are disabled, please enable location services.');
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(RegistrationInitial());
          MyApplication.showToastView(
              message:
                  'Location services are denied, please give location permission.');
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.

        emit(RegistrationInitial());
        MyApplication.showToastView(
            message:
                'Location permissions are permanently denied, we cannot request permissions.');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition();
      List? places = await LocationServices().getAddressFromLatLng(position);

      if (places != null && places.every((element) => element != "")) {
        emit(GetLocationSuccess(places));
        emit(RegistrationInitial());
      } else {
        MyApplication.showToastView(
            message:
                'Cannot get your current district and street, please insert them manually');

        emit(RegistrationInitial());
      }
    } catch (e) {
      MyApplication.showToastView(
          message: 'Something went wrong, please try later');
      emit(RegistrationInitial());
    }
  }

// validations
  String? validateNotEmptyField(value, errorMsg) {
    return Validator.validateNotEmptyField(value, errorMsg);
  }

  String? validateEmail(value) {
    return Validator.validateEmail(value);
  }

  String? validatePhoneNumber(value) {
    return Validator.validatePhoneNumber(value);
  }

  String? validatePasswordField(value) {
    return Validator.validatePasswordField(value);
  }

  String? validateReEnterPasswordField(value, firstPass) {
    return Validator.validateReEnterPasswordField(value, firstPass);
  }

  String? validateCardNumber(value) {
    return Validator.validateCardNumber(value);
  }
}
