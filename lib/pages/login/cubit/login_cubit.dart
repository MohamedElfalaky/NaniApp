import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent_app/data/models/parent_user_model/parent_user_model.dart';
import 'package:parent_app/data/repository/login_repo.dart';
import 'package:parent_app/feature/settings/app_router.dart';
import 'package:parent_app/feature/settings/myApplication.dart';
import 'package:parent_app/util/validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo loginRepo = LoginRepo();

  String? validateEmail(value) {
    return Validator.validateEmail(value);
  }

  String? validatePasswordField(value) {
    return Validator.validatePasswordField(value);
  }

  Future<void> userLogin(
      {required String mail, required String password}) async {
    emit(LoginLoading());
    try {
      ParentUserModel userModel =
          await loginRepo.parentUserLogin(mail: mail, password: password);

      emit(LoginSuccess(userModel));
      MyApplication.showToastView(message: "You have logged in successfully");
      AppRouter.goRouter.goNamed(AppRoute.parenthome.name);
    } on DioException catch (error, stackTrace) {
      MyApplication.showToastView(message: error.message ?? "");

      log(error.toString(), name: 'parentLogin - msg');
      log(stackTrace.toString(), name: 'parentLogin - trace');
      emit(LoginError());
    } catch (error, stackTrace) {
      log(error.toString(), name: 'parentLogin - msg');
      log(stackTrace.toString(), name: 'parentLogin - trace');
      emit(LoginError());
    }
  }
}
