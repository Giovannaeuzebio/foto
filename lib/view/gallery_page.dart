import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galeria')),
      body: FutureBuilder<List<File>>(
        future: _getImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar imagens.'));
          }

          final images = snapshot.data!;

          return ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.file(images[index], width: 50, height: 50),
                title: Text(images[index].path.split('/').last),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<File>> _getImages() async {
    final directory = await getApplicationDocumentsDirectory();
    final dir = Directory(directory.path);
    return dir.listSync().whereType<File>().toList();
  }
}
