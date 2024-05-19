import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nani_home_state.dart';

class NaniHomeCubit extends Cubit<NaniHomeState> {
  NaniHomeCubit() : super(NaniHomeInitial());
}
