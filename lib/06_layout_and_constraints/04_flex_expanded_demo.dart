import 'package:flutter/material.dart';

class YLFlexLayoutTestRoute extends StatelessWidget {
  const YLFlexLayoutTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal, // 水平方向
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical, // 垂直方向布局
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20,
                    color: Colors.red,
                  ),
                ),
                // Spacer 的功能是占用指定比例的空间
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
