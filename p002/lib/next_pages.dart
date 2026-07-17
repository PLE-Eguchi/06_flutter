import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Transition -- Page 2'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
