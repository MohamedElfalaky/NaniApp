part of 'sending_request_cubit.dart';

sealed class SendingRequestState extends Equatable {
  const SendingRequestState();

  @override
  List<Object> get props => [];
}

final class SendingRequestInitial extends SendingRequestState {}
