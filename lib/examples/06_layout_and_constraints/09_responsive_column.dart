import 'package:flutter/material.dart';

/// 实现一个响应式的 Column 组件 ResponsiveColumn，
/// 它的功能是当当前可用的宽度小于 200 时，将子组件显示为一列，否则显示为两列。
class YLResponsiveColumn extends StatelessWidget {
  final List<Widget> children;

  const YLResponsiveColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth < 200) {
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          var tempChildren = <Widget>[];

          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              tempChildren.add(Row(
                mainAxisSize: MainAxisSize.min,
                children: [children[i], children[i + 1]],
              ));
            } else {
              tempChildren.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: tempChildren);
        }
      },
    );
  }
}

/// 打印布局时的约束信息
class YLLayoutLogPrint<T> extends StatelessWidget {
  const YLLayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      assert(() {
        print("${tag ?? key ?? child} : $constraints");
        return true;
      }());
      return child;
    });
  }
}

class YLLayoutBuilderRoute extends StatelessWidget {
  const YLLayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = List.filled(6, const Text("A"));

    return Column(
      children: [
        SizedBox(width: 120, child: YLResponsiveColumn(children: children)),
        YLResponsiveColumn(children: children),
        const YLLayoutLogPrint(child: Text("xx")),
      ],
    );
  }
}
