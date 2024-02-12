import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_bloc.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_event.dart';
import 'package:bloc_tutorial/bloc/radio_checkBox_buttons/radio_check_box_buttons_state.dart';
import 'package:bloc_tutorial/bloc/switch/switch_example_bloc.dart';
import 'package:bloc_tutorial/bloc/switch/switch_example_event.dart';
import 'package:bloc_tutorial/bloc/switch/switch_example_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatelessWidget {
  const SwitchSliderScreen({super.key});
  static String routeName = '/switch-screen';
  @override
  Widget build(BuildContext context) {
    bool? iss = false;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<RadioCheckBoxButtonsBloc, RadioCheckBoxButtonsState>(
              builder: (context, state) {
            return Checkbox(
                value: state.checkBox,
                onChanged: (val) {
                  context
                      .read<RadioCheckBoxButtonsBloc>()
                      .add(CheckBoxButtonChange());
                });
          }),
          BlocBuilder<RadioCheckBoxButtonsBloc, RadioCheckBoxButtonsState>(
              builder: (context, state) {
            return Radio(
                value: state.radio,
                groupValue: state.radio,
                onChanged: (v) {
                  context
                      .read<RadioCheckBoxButtonsBloc>()
                      .add(RadioButtonChange());
                });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Notification'),
              BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch.adaptive(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchExampleBloc>()
                              .add(SwitchEnableOrDisable());
                        });
                  })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
              builder: (context, state) {
            return Container(
              width: 400,
              height: 150,
              color: Colors.lightBlue.withOpacity(state.slider),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
              // build only when need or interact
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchExampleBloc>()
                          .add(SliderEvent(slider: value));
                    });
              }),
        ],
      ),
    );
  }
}
