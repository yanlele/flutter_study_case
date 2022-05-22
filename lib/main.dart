import 'package:flutter/material.dart';

main() {
  // 1. 调用 runApp 函数, 启动一个程序
  const text = Text(
    "Hello World",
    textDirection: TextDirection.ltr,
    style: TextStyle(
        fontSize: 60,
        color: Colors.orange
    ),
  );
  runApp(text);
}
