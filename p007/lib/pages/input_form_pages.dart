import 'package:flutter/material.dart';
import 'package:p007/components/custom_buttons.dart';
import 'package:p007/components/custom_fields.dart';
import 'package:p007/pages/confirm.dart';

class InputFormPages extends StatelessWidget {
  const InputFormPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      // タイトル
      appBar: AppBar(
        leading: const Icon(Icons.edit_note),
        title: const Text('入力フォーム'),
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.blue,
      ),
      body: const Center(
        child: MyDisp(),
      ),
    );
  }
}

class MyDisp extends StatefulWidget {
  const MyDisp({super.key});

  @override
  State<MyDisp> createState() => _MyDispState();
}

// メインの表示内容設定
class _MyDispState extends State<MyDisp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyInputBox(
          labelTitle: '姓',
          hintText: '例)山田',
          msgText: '',
        ),
        const MyInputBox(
          labelTitle: '名',
          hintText: '例)太郎',
          msgText: '',
        ),
        const MyInputBox(
          labelTitle: '学校',
          hintText: '例)〇〇高校',
          msgText: '',
        ),
        const SizedBox(height: 50),
        MyButton(
          buttonCaption: '確認画面へ',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ConfirmPages()));
          },
        ),
      ],
    );
  }
}
