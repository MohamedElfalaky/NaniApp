part of 'nani_sending_request_cubit.dart';

sealed class NaniSendingRequestState extends Equatable {
  const NaniSendingRequestState();

  @override
  List<Object> get props => [];
}

final class NaniSendingRequestInitial extends NaniSendingRequestState {}
