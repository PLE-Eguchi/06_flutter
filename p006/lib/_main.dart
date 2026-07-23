import 'package:flutter/material.dart';

// 1. アプリのスタート地点（必須！）
void main() {
  runApp(const MyApp());
}

// 2. アプリ全体の初期設定を行う Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MySampleWidget(), // 下で定義した Widget を呼び出す
        ),
      ),
    );
  }
}

// 3. 実際に画面に表示する Widget（前回紹介したコード）
class MySampleWidget extends StatefulWidget {
  const MySampleWidget({super.key});

  @override
  State<MySampleWidget> createState() => _MySampleWidgetState();
}

class _MySampleWidgetState extends State<MySampleWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final items = ['りんご', 'みかん', 'バナナ'];
        for (var item in items) {
          debugPrint('処理中のアイテム: $item');
        }
      },
      child: const Text('デバッグ出力テスト'),
    );
  }
}
