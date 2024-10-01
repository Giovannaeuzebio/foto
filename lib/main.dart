import 'package:flutter/material.dart';
import 'view/photo_picker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PhotoPickerPage(),
    );
  }
}
