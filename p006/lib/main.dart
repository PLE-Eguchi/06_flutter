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
  String testStatement = 'まだ1度も押されてません';
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hello World !'),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              cnt++;
              setState(() {
                testStatement = '押されたのは $cnt 回目です';
              });
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white),
            child: const Text('Push !')),
        const SizedBox(height: 20),
        Text(testStatement),
      ],
    );
  }
}
