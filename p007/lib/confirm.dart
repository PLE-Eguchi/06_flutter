import 'package:flutter/material.dart';
import 'package:p007/complete.dart';
import 'package:p007/my_objects.dart';

class ConfirmPages extends StatelessWidget {
  const ConfirmPages({super.key});

  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
    //     home: Scaffold(
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      // タイトル
      appBar: AppBar(
        leading: const Icon(Icons.edit_note),
        title: const Text('確認フォーム'),
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.blue,
      ),
      body: const Center(
        child: MyConfirm(),
      ),
    );
//      ),
//    );
  }
}

class MyConfirm extends StatelessWidget {
  const MyConfirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ],
    );
  }
}
