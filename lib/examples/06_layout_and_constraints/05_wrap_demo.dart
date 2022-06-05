import 'package:flutter/material.dart';

class YLWrapDemo extends StatelessWidget {
  const YLWrapDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // 主轴方向间距
      runSpacing: 4, // 纵轴方向间距
      alignment: WrapAlignment.center, //
      children: const [
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("M")),
          label: Text("Lafayette"),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("H")),
          label: Text("Mulligan"),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("J")),
          label: Text("Laurens"),
        ),
      ],
    );
  }
}
