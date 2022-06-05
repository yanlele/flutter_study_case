import 'package:flutter/material.dart';

class YLCounterWidget extends StatefulWidget {
  final int initValue;

  const YLCounterWidget({Key? key, this.initValue = 0}) : super(key: key);

  @override
  State<YLCounterWidget> createState() => _YLCounterWidgetState();
}

class _YLCounterWidgetState extends State<YLCounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didUpdateWidget(YLCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print(deactivate);
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

