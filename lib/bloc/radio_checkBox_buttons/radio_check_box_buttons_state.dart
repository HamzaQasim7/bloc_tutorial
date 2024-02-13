import 'package:equatable/equatable.dart';

class RadioCheckBoxButtonsState extends Equatable {
  final bool radio;
  final bool radio1;
  final bool checkBox;
  const RadioCheckBoxButtonsState(
      {this.radio = false, this.checkBox = false, this.radio1 = false});

  @override
  List<Object?> get props => [radio, checkBox, radio1];
  RadioCheckBoxButtonsState copyWith(
      {bool? radio, bool? checkBox, bool? radio1}) {
    return RadioCheckBoxButtonsState(
        radio: radio ?? this.radio,
        radio1: radio1 ?? this.radio1,
        checkBox: checkBox ?? this.checkBox);
  }
}
