import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_event.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_state.dart';

class RadioCheckBoxButtonsBloc
    extends Bloc<RadioCheckBoxButtonsEvent, RadioCheckBoxButtonsState> {
  RadioCheckBoxButtonsBloc() : super(const RadioCheckBoxButtonsState()) {
    on<RadioButtonChange>(radioChange);
    on<CheckBoxButtonChange>(checkBoxChange);
  }
  void radioChange(
      RadioButtonChange event, Emitter<RadioCheckBoxButtonsState> emit) {
    emit(state.copyWith(radio: !state.radio, radio1: !state.radio1));
  }

  void checkBoxChange(
      CheckBoxButtonChange event, Emitter<RadioCheckBoxButtonsState> emit) {
    emit(state.copyWith(checkBox: !state.checkBox));
  }
}
