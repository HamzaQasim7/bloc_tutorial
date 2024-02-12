import 'package:equatable/equatable.dart';

abstract class RadioCheckBoxButtonsEvent extends Equatable {
  const RadioCheckBoxButtonsEvent();

  @override
  List<Object?> get props => [];
}

class RadioButtonChange extends RadioCheckBoxButtonsEvent {}

class CheckBoxButtonChange extends RadioCheckBoxButtonsEvent {}
