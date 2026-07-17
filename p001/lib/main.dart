import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // 画面右上のデバッグリボンを消す
      home: MyProfilePage(),
    );
  }
}

// ーーー ここからあなたが作った自己紹介画面 ーーー
class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // 画面全体の背景を薄いグレーに
      appBar: AppBar(
        title: const Text('マイプロフィール'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        // 【Column】ウィジェットを「縦」に並べるための枠
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 縦方向の真ん中に寄せる
          children: [
            // 【Container】色やサイズ、余白を持てる万能な「箱」
            Container(
              padding: const EdgeInsets.all(20), // 箱の内側の余白
              margin: const EdgeInsets.symmetric(horizontal: 20), // 箱の外側の余白
              decoration: BoxDecoration(
                color: Colors.white, // 箱の色を白にする
                borderRadius: BorderRadius.circular(15), // 角を丸くする
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(10, 20),
//                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
//                    blurRadius: 10,
                  ),
                ],
              ),

              // 箱の中身として、さらに縦並びのColumnを入れる（ネスト）
              child: Column(
                children: [
                  // アイコンっぽく見せるための丸型コンテナ
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle, // 丸型にする
                    ),
                    child: const Icon(Icons.assignment_ind,
                        size: 50, color: Colors.white),
//                        const Icon(Icons.person, size: 50, color: Colors.white),
                  ),

                  // 少し縦の隙間を空けるための透明な箱
                  const SizedBox(height: 20),

                  // 【Text】名前を表示
                  const Text(
                    'Test Name',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 【Text】自己紹介文を表示
                  const Text(
                    "現在、Android StudioやVSCodeを使ってDartとFlutterの基本を楽しく学習中！一歩ずつアプリ開発を身につけています。",
                    textAlign: TextAlign.center, // 文字を中央揃えに
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
