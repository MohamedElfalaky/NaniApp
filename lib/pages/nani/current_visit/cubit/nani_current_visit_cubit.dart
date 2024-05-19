import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nani_current_visit_state.dart';

class NaniCurrentVisitCubit extends Cubit<NaniCurrentVisitState> {
  NaniCurrentVisitCubit() : super(NaniCurrentVisitInitial());
}
