part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

final class RegistrationError extends RegistrationState {}

final class GetLocationLoading extends RegistrationState {}

final class GetLocationSuccess extends RegistrationState {
  final List locationList;
  GetLocationSuccess(this.locationList);
}

final class GetLocationError extends RegistrationState {
  final error;
  GetLocationError({this.error});
}
