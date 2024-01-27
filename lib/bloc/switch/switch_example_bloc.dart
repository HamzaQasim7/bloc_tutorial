import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/switch/switch_example_event.dart';
import 'package:bloc_tutorial/bloc/switch/switch_example_state.dart';

class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc() : super(const SwitchExampleState()) {
    on<SwitchEnableOrDisable>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }
  void _enableOrDisableNotification(
      SwitchEnableOrDisable events, Emitter<SwitchExampleState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchExampleState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
