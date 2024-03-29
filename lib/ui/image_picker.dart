import 'dart:io';

import 'package:bloc_tutorial/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_picker/image_picker_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  static String routeName = '/image-picker';
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(
                  child: Icon(Icons.camera),
                ),
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
