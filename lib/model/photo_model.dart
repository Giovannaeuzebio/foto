
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PhotoModel {
  File? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  Future<String?> saveImage() async {
    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      await image!.copy(newPath);
      return newPath;
    }
    return null;
  }
}
