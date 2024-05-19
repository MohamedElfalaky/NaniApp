import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sending_request_state.dart';

class SendingRequestCubit extends Cubit<SendingRequestState> {
  SendingRequestCubit() : super(SendingRequestInitial());
}
