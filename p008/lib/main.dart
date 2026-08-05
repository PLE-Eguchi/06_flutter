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
          child: MyDisp(),
        ),
      ),
    );
  }
}

class MyDisp extends StatefulWidget {
  const MyDisp({
    super.key,
  });

  @override
  State<MyDisp> createState() => _MyDispState();
}

class _MyDispState extends State<MyDisp> {
  final myController = TextEditingController();
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(padding: EdgeInsets.all(8.0)),
      MyText(myController: myController),
      const SizedBox(height: 30),
      MyLabel(inputValue: inputValue),
      const SizedBox(height: 30),
      MyButton(
        onPressed: () {
          setState(() {
            inputValue = myController.text;
          });
        },
      ),
    ]);
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white),
        child: const Text('Display'));
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.myController,
  });

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextField(controller: myController);
  }
}

class MyLabel extends StatelessWidget {
  const MyLabel({
    super.key,
    required this.inputValue,
  });

  final String inputValue;

  @override
  Widget build(BuildContext context) {
    return Text(inputValue);
  }
}
