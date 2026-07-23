import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SelectionArea(
          child: Center(
            child: MyDisp(),
          ),
        ),
      ),
    );
  }
}

class MyDisp extends StatefulWidget {
  const MyDisp({super.key});

  @override
  State<MyDisp> createState() => _MyDispState();
}

class _MyDispState extends State<MyDisp> {
  String testStatement = '';
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hello World !'),
        Text(testStatement),
        ElevatedButton(
            onPressed: () {
              cnt++;
              setState(() {
                testStatement = '押されたのは $cnt 回目です';
              });
            },
            child: const Text('ButtonTest')),
      ],
    );
  }
}
