import 'package:flutter/material.dart';
import 'package:p007/validations.dart';

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
  final bool isEditable;

  const MyText(
      {super.key,
      required this.labelTitle,
      required this.hintText,
      required this.msgText,
      required this.isEditable});
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
//    _controller.text = 'test';
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
      enabled: widget.isEditable,
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

// コマンドボタン
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
