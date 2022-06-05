import 'package:flutter/material.dart';

class YLConstrainedBox extends StatelessWidget {
  const YLConstrainedBox({Key? key}) : super(key: key);

  // 声明 redBox
  final Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: redBox,
    );
  }
}
