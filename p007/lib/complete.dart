import 'package:flutter/material.dart';
import 'package:p007/main.dart';
import 'package:p007/my_objects.dart';

class CompletePages extends StatelessWidget {
  const CompletePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      // タイトル
      appBar: AppBar(
        leading: const Icon(Icons.check),
        title: const Text('完了フォーム'),
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text('完了しました'),
            const SizedBox(height: 50),
            MyButton(
              buttonCaption: '入力画面に戻る',
              onPressed: () {
                null;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainApp()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
