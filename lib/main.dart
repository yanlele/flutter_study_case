import 'package:flutter/material.dart';

import 'code/Widget/01_StatelessWidget参数传递.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 重写 build 方法
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "沙雕",
      debugShowCheckedModeBanner: false,
      // Scaffold 脚手架， 可以快速搭建页面
      home: Scaffold(
        appBar: AppBar(title: const Text("title")),
        body: const Echo(text: "angle"),
      ),
    );
  }
}
