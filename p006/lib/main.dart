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

class _MyDispState extends State<MyDisp> {
  String testStatement = 'まだ1度も押されてません';
  int pressedCnt = 0;
  bool setOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hello World !'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: !setOn
                  ? null
                  : () {
                      setState(() {
                        pressedCnt++;
                        testStatement = "$pressedCnt 回押されました";
                      });
                    },
            ),
            const SizedBox(width: 50),
            MySwitch(
              switchValue: setOn,
              onChanged: (bool newValue) {
                setState(() {
                  setOn = newValue;
                });
              },
            )
          ],
        ),
        const SizedBox(height: 20),
        Text(testStatement),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
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

// 1. Switchを使うためにStatefulWidgetを作成
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
