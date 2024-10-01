import 'package:flutter/material.dart';
import 'dart:io';

class ViewPhotoPage extends StatelessWidget {
  final File image;

  const ViewPhotoPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualizar Foto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(image, height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para salvar a imagem aqui
                  },
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
