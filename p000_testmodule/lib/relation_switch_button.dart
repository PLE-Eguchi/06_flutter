import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// 1. 親Widget（スイッチの状態を管理して、両方に分け与える）
// --------------------------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ★スイッチのON/OFF状態（親で管理）
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // スイッチWidget
        CustomSwitch(
          value: _isSwitched,
          onChanged: (bool newValue) {
            setState(() {
              _isSwitched = newValue;
            });
          },
        ),
        const SizedBox(height: 20),

        // ボタンWidget（スイッチの状態を渡す）
        CustomButton(
          isEnabled: _isSwitched, // ★ここで bool を渡す！
        ),
      ],
    );
  }
}

// --------------------------------------------------
// 2. スイッチWidget（別Widget）
// --------------------------------------------------
class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value ? '利用規約に同意済み' : '利用規約に同意する'),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// --------------------------------------------------
// 3. ボタンWidget（別Widget）
// --------------------------------------------------
class CustomButton extends StatelessWidget {
  final bool isEnabled; // ★親から受け取る「使用可能かどうか」のフラグ

  const CustomButton({
    super.key,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ★ isEnabled が true なら処理を実行、false（OFF）なら null を渡して無効化する
      onPressed: isEnabled
          ? () {
              // スイッチがONの時だけ実行される処理
              // ignore: avoid_print
              print('ボタンが押されました！');
            }
          : null, // ★ nullにするとボタンが押せなくなります（グレーアウト）
      child: const Text('次へ進む'),
    );
  }
}
