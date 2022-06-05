import 'package:flutter/material.dart';

import 'share_data.dart';
import 'test_widget.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  const InheritedWidgetTestRoute({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetTestRoute> createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YLShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TestWidget(),
            ),
            ElevatedButton(
              child: Text("Increment: $count"),
              onPressed: () => setState(() => count = count + 1),
            )
          ],
        ),
      ),
    );
  }
}
