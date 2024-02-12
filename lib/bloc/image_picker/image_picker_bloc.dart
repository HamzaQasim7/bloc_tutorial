import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraPicker);
    on<GalleryImagePicker>(galleryPicker);
  }

  void cameraPicker(
      CameraCapture event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryPicker(
      GalleryImagePicker event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.imageFromGallery();
    emit(state.copyWith(file: file));
  }
}
