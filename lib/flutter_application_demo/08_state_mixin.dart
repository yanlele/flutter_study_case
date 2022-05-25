import 'package:flutter/material.dart';

//------------------------ ParentWidget ------------------------
/// StatefulWidget 是个 @immutable 类， 所以不可更改
/// 如果想具备状态， 必须要使用 state 作为状态管理
class YLParentWidgetC extends StatefulWidget {
  const YLParentWidgetC({Key? key}) : super(key: key);

  @override
  State<YLParentWidgetC> createState() => _YLParentWidgetCState();
}

/// 在 state 定义的状态和方法， 可以直接传递到子 StatefulWidget TapBoxC
class _YLParentWidgetCState extends State<YLParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      onChanged: _handleTapBoxChanged,
      active: _active,
    );
  }
}

//------------------------ TapBoxC ------------------------
/// 这个类的作用只是作为一个转接
/// 把 parent state 的属性和方法， 转接到自己的 state 里面去
/// 自己的 state 可以通过 widget 方法调用到 StatefulWidget 转接过来的属性和方法
class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxC({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TapBoxC> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    // 可以通过 widget 获取 StatefulWidget 属性
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(
                    color: const Color(0xFF4DB6AC),
                    width: 10,
                  )
                : null),
      ),
    );
  }
}
