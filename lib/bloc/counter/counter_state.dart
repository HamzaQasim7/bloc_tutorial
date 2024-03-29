import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 0});
  @override
  List<Object?> get props => [counter];

  // we use copyWith method to change the value of the counter
  // basically the meaning of copyWith method to override or change the value.
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
