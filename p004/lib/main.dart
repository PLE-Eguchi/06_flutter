import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // タブ表示
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String tappedNum = ""; // タップされた番号

  @override
  Widget build(BuildContext context) {
    List<Color> myBackColor = [
      Colors.purple[100]!,
      Colors.blue[100]!,
      Colors.green[100]!,
    ];
    List<Color> myFontColor = [
      Colors.purpleAccent,
      Colors.blueAccent,
      Colors.green,
    ];
    List<Color> myBorderColor = [
      Colors.purple,
      Colors.blue,
      Colors.green,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int j = 0; j < 3; j++) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) ...[
                    Builder(
                      builder: (context) {
                        final int remainNum = ((j + 1) * 10 + i + 1) % 3;
                        String selectedNum = '${j + 1}${i + 1}'; // 番号編集
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              tappedNum = selectedNum;
                            });
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.all(40), // 枠線と文字の間の「内側の余白」
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: myBorderColor[remainNum],
                                  width: 2), // 青い枠線を太さ2で引く
                              borderRadius:
                                  BorderRadius.circular(30), // 枠線の角をちょっと丸くする
                              color: myBackColor[remainNum],
                            ),
                            child: Text(
                              selectedNum,
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                color: myFontColor[remainNum],
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                  ],
                ],
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 30),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: tappedNum,
                  style: TextStyle(
                      color: tappedNum == ""
                          ? Colors.blueGrey
                          : myFontColor[int.parse(tappedNum) % 3],
                      fontSize: 25),
                ),
                TextSpan(
                  text: tappedNum == "" ? "" : " がタップされました",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
