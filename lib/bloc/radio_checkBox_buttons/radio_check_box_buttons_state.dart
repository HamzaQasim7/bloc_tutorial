import 'package:equatable/equatable.dart';

class RadioCheckBoxButtonsState extends Equatable {
  final bool radio;
  final bool checkBox;
  const RadioCheckBoxButtonsState({this.radio = false, this.checkBox = false});

  @override
  List<Object?> get props => [radio, checkBox];
  RadioCheckBoxButtonsState copyWith({bool? radio, bool? checkBox}) {
    return RadioCheckBoxButtonsState(
        radio: radio ?? this.radio, checkBox: checkBox ?? this.checkBox);
  }
}
