import 'package:flutter/material.dart';

class YLCenterDemo extends StatelessWidget {
  const YLCenterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(child: Text('xxx')),
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text('xxx'),
          ),
        ),
      ],
    );
  }
}
