part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  ParentUserModel parentUserModel;
  LoginSuccess(this.parentUserModel);
}

final class LoginError extends LoginState {}
