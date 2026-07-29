import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyText(originalText: '初期値'),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String originalText;
  const MyText({super.key, required this.originalText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: originalText,
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) {
        debugPrint("Current text: $text");
      },
    );
  }

  decoration(InputDecoration inputDecoration) {}
}
