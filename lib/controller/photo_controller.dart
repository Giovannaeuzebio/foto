// controller/photo_controller.dart
import 'package:flutter/material.dart';
import '../model/photo_model.dart';

class PhotoController {
  final PhotoModel model;

  PhotoController(this.model);

  Future<void> pickImage(BuildContext context) async {
    await model.pickImage();
    if (model.image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao capturar imagem')),
      );
    }
  }

  Future<void> saveImage(BuildContext context) async {
    final path = await model.saveImage();
    if (path != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagem salva em: $path')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nenhuma imagem para salvar')),
      );
    }
  }
}
