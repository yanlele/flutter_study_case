import 'package:flutter/material.dart';

import 'flutter_application_demo/01_widget_yl_stateless_echo.dart';
import 'flutter_application_demo/04_widget_yl_stateful_state_context.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 重写 build 方法
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "沙雕",
      debugShowCheckedModeBanner: false,
      // Scaffold 脚手架， 可以快速搭建页面
      home: YLGetStateObjectRoute(),
    );
  }
}
