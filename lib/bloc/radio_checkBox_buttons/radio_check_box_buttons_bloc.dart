import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_event.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_state.dart';

class RadioCheckBoxButtonsBloc
    extends Bloc<RadioCheckBoxButtonsEvent, RadioCheckBoxButtonsState> {
  RadioCheckBoxButtonsBloc() : super(const RadioCheckBoxButtonsState()) {
    on<RadioButtonChange>(radioChange);
  }
  void radioChange(
      RadioButtonChange event, Emitter<RadioCheckBoxButtonsState> emit) {
    emit(state.copyWith(radio: !state.radio, checkBox: !state.checkBox));
  }
}
