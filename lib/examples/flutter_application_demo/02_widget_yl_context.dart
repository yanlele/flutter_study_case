import 'package:flutter/material.dart';

/*
StatelessWidget context 使用
* */
class YLContextRoute extends StatelessWidget {
  const YLContextRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Context 测试")),
      body: Builder(builder: (context) {
        // 在 widget 树中向上查找最近的父级`Scaffold`  widget
        Scaffold scaffold = context.findAncestorWidgetOfExactType() as Scaffold;
        // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
        return (scaffold.appBar as AppBar).title as Widget;
      }),
    );
  }
}
