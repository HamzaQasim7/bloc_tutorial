import 'package:equatable/equatable.dart';

class SwitchExampleState extends Equatable {
  final bool isSwitch;
  final double slider;
  const SwitchExampleState({this.isSwitch = false, this.slider = 1});
  @override
  List<Object?> get props => [isSwitch, slider];
  SwitchExampleState copyWith({bool? isSwitch, double? slider}) {
    return SwitchExampleState(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }
}
