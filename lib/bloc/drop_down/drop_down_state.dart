import 'package:equatable/equatable.dart';

class DropDownState extends Equatable {
  final String selected;

  const DropDownState({this.selected = ''});

  @override
  List<Object?> get props => [selected];

  DropDownState copyWith({String? selected}) {
    return DropDownState(selected: selected ?? this.selected);
  }
}
