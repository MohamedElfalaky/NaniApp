import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nani_sending_request_state.dart';

class NaniSendingRequestCubit extends Cubit<NaniSendingRequestState> {
  NaniSendingRequestCubit() : super(NaniSendingRequestInitial());
}
