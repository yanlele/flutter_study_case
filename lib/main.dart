import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          "第一个Flutter程序",
          style: TextStyle(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

main() {
  // 1. 调用 runApp 函数, 启动一个程序
  const text = Text(
    "Hello World",
    // textDirection: TextDirection.ltr,
    style: TextStyle(fontSize: 30, color: Colors.orange),
  );
  const center = Center(child: text);

  final bar = runApp(const MaterialApp(
    // Scaffold 脚手架， 可以快速搭建页面
    home: Scaffold(
      // appBar: AppBar(),
      appBar: Header(),
      body: center,
    ),
  ));
}
