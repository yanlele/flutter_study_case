import 'package:flutter/material.dart';

/// 父Widget管理子Widget的状态
class YLParentWidget extends StatefulWidget {
  const YLParentWidget({Key? key}) : super(key: key);

  @override
  State<YLParentWidget> createState() => _YLParentWidgetState();
}

class _YLParentWidgetState extends State<YLParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TapBoxB(
      active: _active,
      onChanged: _handleTapBoxChanged,
    );
  }
}

class _TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const _TapBoxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.green[600],
        ),
        child: Center(
          child: Text(
            active ? "Active" : "Inactive",
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
