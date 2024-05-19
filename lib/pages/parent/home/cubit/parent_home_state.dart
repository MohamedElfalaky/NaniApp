part of 'parent_home_cubit.dart';

sealed class ParentHomeState {}

final class ParentHomeInitial extends ParentHomeState {}

final class ChildrenSelected extends ParentHomeState {}

final class CheckBoxState extends ParentHomeState {}

final class AdditionalChildrenChanged extends ParentHomeState {
  final int additionalChildren;

  AdditionalChildrenChanged({
    required this.additionalChildren,
  });
}

final class GetChildrenPriceLoading extends ParentHomeState {}

final class GetChildrenPriceSuccess extends ParentHomeState {
  final int price;

  GetChildrenPriceSuccess({
    required this.price,
  });
}

final class GetChildrenPriceError extends ParentHomeState {}

final class RequestNaniLoading extends ParentHomeState {}

final class RequestNaniSuccess extends ParentHomeState {
  final NaniRequestModel naniRequestModel;

  RequestNaniSuccess({
    required this.naniRequestModel,
  });
}

final class RequestNaniError extends ParentHomeState {}

