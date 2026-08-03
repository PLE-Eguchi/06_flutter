import 'package:flutter/material.dart';
import 'package:p007/pages/input_form_pages.dart';
//import 'validations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputFormPages(),
    );
  }
}
