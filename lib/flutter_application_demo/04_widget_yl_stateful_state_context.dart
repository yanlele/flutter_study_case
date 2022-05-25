import 'package:flutter/material.dart';

class YLGetStateObjectRoute extends StatefulWidget {
  const YLGetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<YLGetStateObjectRoute> createState() => _YLGetStateObjectRouteState();
}

/// 在 Flutter 开发中便有了一个默认的约定：
///   如果 StatefulWidget 的状态是希望暴露出的，应当在 StatefulWidget 中提供一个of 静态方法来获取其 State 对象，
///   开发者便可直接通过该方法来获取；
///   如果 State不希望暴露，则不提供of方法。
///
/// 疑问： 如何界定 state 是否希望对外暴露？
class _YLGetStateObjectRouteState extends State<YLGetStateObjectRoute> {
  // todo 想法失败， 研究一下为什么这样不行呢？
  // WidgetBuilder elevatedButtonBuilder(BuildContext context) {
  //   void onPressed() {
  //     ScaffoldState state = context.findAncestorStateOfType() as ScaffoldState;
  //     state.openDrawer();
  //   }
  //
  //   return ElevatedButton(onPressed: onPressed, child: const Text("打开抽屉"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("子树中获取State对象")),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldState _state =
                      context.findAncestorStateOfType<ScaffoldState>()!;
                  _state.openDrawer();
                },
                child: const Text("打开抽屉菜单1"),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldState state = Scaffold.of(context);
                  state.openDrawer();
                },
                child: const Text("打开抽屉菜单2"),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("我是 snack bar")));
                },
                child: const Text("显示 snack bar"),
              );
            })
          ],
        ),
      ),
    );
  }
}
