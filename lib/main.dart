import 'package:flutter/material.dart';
import 'handle_application_widget_by_07/demo3_future_builder/index.dart';

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
        appBar: AppBar(title: const Text("我是title")),
        body: const FutureBuilderDemo(),
      ),
    );
  }
}
