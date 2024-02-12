import 'package:bloc/bloc.dart';

import 'drop_down_event.dart';
import 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(const DropDownState()) {
    on<DropDownChange>(_dropdownChanged);
  }
  void _dropdownChanged(DropDownChange event, Emitter<DropDownState> emit) {
    emit(state.copyWith(selected: event.selected));
  }
}
