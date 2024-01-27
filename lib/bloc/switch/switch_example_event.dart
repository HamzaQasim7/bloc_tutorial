import 'package:equatable/equatable.dart';

abstract class SwitchExampleEvent extends Equatable {
  const SwitchExampleEvent();

  @override
  List<Object> get props => [];
}

class SwitchEnableOrDisable extends SwitchExampleEvent {}

class SliderEvent extends SwitchExampleEvent {
  final double slider;
  const SliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
