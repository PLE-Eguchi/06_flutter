import 'package:flutter/material.dart';
import 'package:p007/confirm.dart';
import 'package:p007/my_button.dart';
import 'validations.dart';

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

class MyInputBox extends StatelessWidget {
  final String labelTitle;
  final String hintText;
  final String msgText;

  const MyInputBox(
      {super.key,
      required this.labelTitle,
      required this.hintText,
      required this.msgText});

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
            ))
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
class MyText extends StatefulWidget {
  final String labelTitle;
  final String hintText;
  final String msgText;
  const MyText(
      {super.key,
      required this.labelTitle,
      required this.hintText,
      required this.msgText});
  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  // 1. FocusNode と TextEditingController を準備
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  String? _errorText; // エラーメッセージを保持する変数

  @override
  void initState() {
    super.initState();
    // 2. フォーカス状態の変化を監視するリスナーを登録
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // メモリリーク防止のため、使い終わったら破棄する
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  // 3. フォーカスが変化したときに呼ばれるメソッド
  void _onFocusChange() {
    // _focusNode.hasFocus が false になった ＝ フォーカスが離れた！
    if (!_focusNode.hasFocus) {
      _validate();
    }
  }

  // 入力チェック処理
  void _validate() {
    setState(() {
      // 共通化したロジックを呼び出す
      _errorText = Validations.required(widget.labelTitle, _controller.text);
      _errorText ??= Validations.characterCount(
          widget.labelTitle, _controller.text, 0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode, // 💡 FocusNodeをセット

      decoration: InputDecoration(
          // 通常時（非フォーカス）
          labelText: widget.hintText,
          errorText: _errorText, // 💡 エラー文字列が入ると自動的に赤枠＆赤文字表示になる！
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          // フォーカス時
          floatingLabelStyle: const TextStyle(color: Colors.blue),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          // エラー時の枠線デザイン（標準でも用意されていますがカスタムも可能）
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          )),
    );
  }
}
