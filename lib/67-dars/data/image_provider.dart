import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loggy/67-dars/data/model/image_model.dart';

class ImagePickedProvider with ChangeNotifier {
  final List<ImageModel> _expenses = [];

  List<ImageModel> get expenses => _expenses;

  void addImage(ImageModel imageAdd) async {
    final imagePicker = ImagePicker();
    var image = imageAdd.image;
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    _expenses.addAll(image as Iterable<ImageModel>);
    notifyListeners();
  }
  void removeImage(ImageModel expanse) {
    _expenses.remove(expanse);
    notifyListeners();
  }
}

// Future<void> _onPickImage(CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
//   File? image;
//   final imagePicker = ImagePicker();
//   final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
//   if (pickedImage != null) {
//     image = File(pickedImage.path);
//     emit(state.copyWith(pickedImage: image));
//   }
// }
