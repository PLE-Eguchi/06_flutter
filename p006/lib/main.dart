import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SelectionArea(
          child: Center(
            child: MyDisp(),
          ),
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
  String testStatement = 'まだ1度も押されてません';
  int pressedCnt = 0;
  bool setOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(testStatement),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MySwitch(
            switchValue: setOn,
            onChanged: (bool newValue) {
              setState(() {
                setOn = newValue;
              });
            },
          ),
          const SizedBox(width: 30),
          MyButton(
            isEnable: setOn,
            onPressed: () {
              setState(() {
                pressedCnt++;
                testStatement = "$pressedCnt 回押されました";
              });
            },
          ),
        ],
      ),
      const SizedBox(height: 30),
      Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                onPressed: () {
                  pressedCnt = 0;
                  setState(() {
                    testStatement = "カウンタをリセットしました";
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen[100], // 背景色
                  foregroundColor: Colors.green, // 文字色
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 角丸
                  ),
                ),
                child: const Text('reset'),
              )))
    ]);
  }
}

// コマンドボタンのクラス定義
class MyButton extends StatelessWidget {
  final bool isEnable;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.isEnable, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isEnable ? onPressed : null,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.lightBlue,
            disabledForegroundColor: Colors.blueGrey,
            foregroundColor: Colors.white),
        child: const Text('Push !'));
  }
}

// スイッチボタンのクラス定義
class MySwitch extends StatelessWidget {
  final bool switchValue;
  final ValueChanged<bool> onChanged;

  const MySwitch(
      {super.key, required this.switchValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      // 現在の状態（trueならON、falseならOFF）
      value: switchValue,
      onChanged: onChanged,
      // 状態に合わせてアイコンを切り替え
      thumbIcon:
          WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
        return states.contains(WidgetState.selected)
            ? const Icon(Icons.check)
            : const Icon(Icons.close);
      }),
      // アクティブ（ON）の時の色
      activeColor: Colors.orange,
    );
  }
}
