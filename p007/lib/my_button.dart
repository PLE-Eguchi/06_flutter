import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonCaption;
  final VoidCallback onPressed;

  const MyButton(
      {super.key, required this.buttonCaption, required this.onPressed});

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
        child: Text(buttonCaption));
  }
}
