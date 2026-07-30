import 'package:flutter/material.dart';
import 'package:p007/conplete.dart';
import 'package:p007/my_button.dart';

class ConfirmPages extends StatelessWidget {
  const ConfirmPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        // タイトル
        appBar: AppBar(
          leading: const Icon(Icons.church),
          title: const Text('確認フォーム'),
          backgroundColor: Colors.lightBlue[100],
          foregroundColor: Colors.blue,
        ),
        body: Center(
          child: Row(
            children: [
              MyButton(
                buttonCaption: '入力画面に戻る',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 50),
              MyButton(
                buttonCaption: '登録',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompletePages()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
