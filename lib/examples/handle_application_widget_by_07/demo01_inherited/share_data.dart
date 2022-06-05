import 'package:flutter/material.dart';

class YLShareDataWidget extends InheritedWidget {
  const YLShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data;

  static YLShareDataWidget of(BuildContext context) {
    final YLShareDataWidget? result = context.dependOnInheritedWidgetOfExactType<YLShareDataWidget>();
    assert(result != null, 'No YLShareDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(YLShareDataWidget old) {
    return old.data != data;
  }
}
