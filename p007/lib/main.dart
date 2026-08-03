import 'package:flutter/material.dart';
import 'package:p007/confirm.dart';
import 'package:p007/my_objects.dart';
//import 'validations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputFormPages(),
    );
  }
}

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
          isEditable: true,
        ),
        const MyInputBox(
          labelTitle: '名',
          hintText: '例)太郎',
          msgText: '',
          isEditable: true,
        ),
        const MyInputBox(
          labelTitle: '学校',
          hintText: '例)〇〇高校',
          msgText: '',
          isEditable: true,
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

// 入力欄(項目ラベル＋テキストボックス)
class MyInputBox extends StatelessWidget {
  final String labelTitle;
  final String hintText;
  final String msgText;
  final bool isEditable;

  const MyInputBox(
      {super.key,
      required this.labelTitle,
      required this.hintText,
      required this.msgText,
      required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
        child: Row(
          children: [
            SizedBox(width: 30, child: MyLabel(labelTitle: labelTitle)),
            const SizedBox(width: 20),
            Expanded(
                child: MyText(
              labelTitle: labelTitle,
              hintText: hintText,
              msgText: msgText,
              isEditable: isEditable,
            ))
          ],
        ));
  }
}
