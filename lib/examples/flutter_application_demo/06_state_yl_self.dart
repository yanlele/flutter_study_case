import 'package:flutter/material.dart';

/// 状态自管理案例
class YLTapBoxA extends StatefulWidget {
  const YLTapBoxA({Key? key}) : super(key: key);

  @override
  State<YLTapBoxA> createState() => _YLTapBoxAState();
}

class _YLTapBoxAState extends State<YLTapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.green[600]),
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
