import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PhotoPickerPage extends StatefulWidget {
  @override
  _PhotoPickerPageState createState() => _PhotoPickerPageState();
}

class _PhotoPickerPageState extends State<PhotoPickerPage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao capturar imagem: $e')),
      );
    }
  }

  void _saveImage() async {
    if (_image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      await _image!.copy(newPath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagem salva em: $newPath')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera App')),
      body: Center(
        child: _image == null
            ? ElevatedButton(
                onPressed: _pickImage,
                child: Text('Tirar Foto'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(_image!, height: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text('Tirar Outra Foto'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _saveImage,
                        child: Text('Salvar Foto'),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
