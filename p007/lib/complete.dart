import 'package:flutter/material.dart';
import 'package:p007/main.dart';
import 'package:p007/my_button.dart';

class CompletePages extends StatelessWidget {
  const CompletePages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        // タイトル
        appBar: AppBar(
          leading: const Icon(Icons.church),
          title: const Text('完了フォーム'),
          backgroundColor: Colors.lightBlue[100],
          foregroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const Text('完了しました'),
              const SizedBox(height: 50),
              MyButton(
                buttonCaption: '戻る',
                onPressed: () {
                  null;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainApp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
