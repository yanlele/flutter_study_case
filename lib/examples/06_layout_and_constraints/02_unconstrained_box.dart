import 'package:flutter/material.dart';

class YLUnconstrainedBox extends StatelessWidget {
  const YLUnconstrainedBox({Key? key}) : super(key: key);

  // 声明 redBox
  final Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 60, minHeight: 100),
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
          child: redBox,
        ),
      ),
    );
  }
}
