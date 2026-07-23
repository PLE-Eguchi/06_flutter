import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // タブ表示
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ToDo メモアプリ'),
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
  // 1️⃣ ToDoを保存しておく「メモリ上の配列（リスト）」
  final List<String> _todoList = [];

  // 2️⃣ 入力欄をコントロールするための相棒
  final TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    // 使い終わったコントローラーは、メモリを解放するために片付けるのがFlutterの決まりです
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 画面全体の周りに少し余白をあける
        child: Column(
          children: [
            // ----------------------------------------------------
            // 💡 [入力エリア] 横並びにTextFieldとボタンを配置
            // ----------------------------------------------------
            Row(
              children: [
                Expanded(
                  // 👈 横幅いっぱいにTextFieldを広げるために必須
                  child: TextField(
                    controller: _todoController, // コントローラーをセット
                    decoration: const InputDecoration(
                      hintText: 'やることを入力してください', // 空のときの薄いガイド文字
                      border: OutlineInputBorder(), // 枠線を四角く囲む
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // 🖐️ ここが「登録ボタン」を押したときの処理
                    final text = _todoController.text; // 入力された文字を取得
                    debugPrint('入力されたのは $text');
                    if (text.isEmpty) return; // 空っぽなら何もしない（簡易バリデーション）

                    setState(() {
                      _todoList.add(text); // 配列にToDoを追加！
                      _todoController.clear(); // 登録したら入力欄をきれいにクリアする
                    });
                  },
                  child: const Text('登録'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ----------------------------------------------------
            // 💡 [表示エリア] 登録されたToDoを縦に並べる
            // ----------------------------------------------------
            Expanded(
              // 👈 画面の残りの高さをすべてこのエリアに割り当てる
              child: ListView(
                children: [
                  for (String todo in _todoList) ...[
                    Card(
                      // 枠線と影がついた、見栄えの良い四角いパネル
                      child: ListTile(
                        leading: const Icon(
                            Icons.check_box_outline_blank), // 左側のアイコン
                        title: Text(
                          todo,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
