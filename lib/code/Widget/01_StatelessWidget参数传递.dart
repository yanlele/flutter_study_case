import 'package:flutter/material.dart';

/*
参数传递的最基本用法
调用：

Widget build(BuildContext context) {
  return Echo(text: "hello world");
}
* */
class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({Key? key, required this.text, this.backgroundColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: backgroundColor,
      child: Text(
        text,
        style: const TextStyle(fontSize: 30),
      ),
    ));
  }
}
