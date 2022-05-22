import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          "第一个Flutter程序",
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

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // Scaffold 脚手架， 可以快速搭建页面
    home: Scaffold(
      // appBar: AppBar(), // 这个会跑错， 非常无语........
      appBar: Header(),
      body: center,
    ),
  ));
}

/// Widget:
///  有状态的 Widget: StateFulWidget 在运行时有一些状态是需要更改的
///  无状态的 Widget: StatelessWidget 在运行时，无状态更改
class YLHomePage extends StatelessWidget {
  const YLHomePage({Key? key}) : super(key: key);

  // 重写 build 方法
  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}
