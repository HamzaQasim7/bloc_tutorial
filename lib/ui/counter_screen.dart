import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/counter/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter/counter_state.dart';
import 'package:bloc_tutorial/bloc/drop_down/drop_down_bloc.dart';
import 'package:bloc_tutorial/bloc/drop_down/drop_down_event.dart';
import 'package:bloc_tutorial/bloc/drop_down/drop_down_state.dart';
import 'package:bloc_tutorial/ui/switch_slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_picker.dart';

class CounterScreen extends StatefulWidget {
  static String routeName = '/counter-screen';
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

void navigateScreen(BuildContext context) {
  // we can call this fun in any button
  Navigator.pushNamed(context, SwitchSliderScreen.routeName);
}

class _CounterScreenState extends State<CounterScreen> {
  List<String> itemsList = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 30),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                    Navigator.pushNamed(context, ImagePickerScreen.routeName);
                  },
                  child: const Text('Increment')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                    navigateScreen(context);
                  },
                  child: const Text('Decrement')),
            ],
          ),
          BlocBuilder<DropDownBloc, DropDownState>(builder: (context, state) {
            return Text('Value: ${state.selected}');
          }),
          BlocBuilder<DropDownBloc, DropDownState>(builder: (context, state) {
            return DropdownButton<String>(
              value: state.selected,
              onChanged: (String? newValue) {
                context.read<DropDownBloc>().add(DropDownChange(newValue!));
              },
              items: itemsList
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
