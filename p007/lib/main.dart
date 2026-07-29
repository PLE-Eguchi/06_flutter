import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        // タイトル
        appBar: AppBar(
          leading: const Icon(Icons.church),
          title: const Text('入力フォーム'),
          backgroundColor: Colors.lightBlue[100],
          foregroundColor: Colors.blue,
        ),
        body: const Center(
          child: MyDisp(),
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

// メインの表示内容設定
class _MyDispState extends State<MyDisp> {
  @override
  Widget build(BuildContext context) {
    return const Column(
//      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyInputBox(labelTitle: '姓', originalText: '例)山田'),
        MyInputBox(labelTitle: '名', originalText: '例)太郎'),
        MyInputBox(labelTitle: '学校', originalText: '例)〇〇高校'),
      ],
    );
  }
}

class MyInputBox extends StatelessWidget {
  final String labelTitle;
  final String originalText;

  const MyInputBox(
      {super.key, required this.labelTitle, required this.originalText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
        child: Row(
          children: [
            SizedBox(width: 30, child: MyLabel(labelTitle: labelTitle)),
            const SizedBox(width: 20),
            Expanded(child: MyText(originalText: originalText))
          ],
        ));
  }
}

// 項目ラベル
class MyLabel extends StatelessWidget {
  final String labelTitle;
  const MyLabel({super.key, required this.labelTitle});

  @override
  Widget build(BuildContext context) {
    return Text(labelTitle, textAlign: TextAlign.right);
  }
}

// 入力欄
class MyText extends StatelessWidget {
  final String originalText;
  const MyText({super.key, required this.originalText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          // 通常時（非フォーカス）
          labelText: originalText,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          // フォーカス時
          floatingLabelStyle: const TextStyle(color: Colors.blue),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          )),
      onChanged: (text) {
        debugPrint("Current text: $text");
      },
    );
  }
}
