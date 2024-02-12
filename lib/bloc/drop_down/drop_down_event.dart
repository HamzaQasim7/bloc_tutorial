import 'package:equatable/equatable.dart';

abstract class DropDownEvent extends Equatable {
  const DropDownEvent();

  @override
  List<Object> get props => [];
}

class DropDownChange extends DropDownEvent {
  final String selected;
  const DropDownChange(this.selected);

  @override
  List<Object> get props => [selected];
}
