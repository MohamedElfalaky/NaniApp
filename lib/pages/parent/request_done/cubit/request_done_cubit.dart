import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_done_state.dart';

class RequestDoneCubit extends Cubit<RequestDoneState> {
  RequestDoneCubit() : super(RequestDoneInitial());
}
