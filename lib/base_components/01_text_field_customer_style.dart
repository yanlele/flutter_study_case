import 'package:flutter/material.dart';

/// TextField 相关知识
class YLTextFieldCustomerStyle extends StatelessWidget {
  const YLTextFieldCustomerStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      // 这个地方可以复写全局样式
      // 比如说我有多个 TextField 的场景， 就可以用这个
      data: Theme.of(context).copyWith(
        hintColor: Colors.grey[200],
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              label: Text("用户名"),
              hintText: "请输入用户名",
              prefixIcon: Icon(Icons.person),
              // 未获得焦点时候下划线颜色
              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.grey),
              // ),
              // // 获得焦点时候下划线颜色
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              // ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              // border: InputBorder.none,
              prefixIcon: Icon(Icons.lock),
              labelText: "密码",
              hintText: "请输入密码",
              // 这个地方的样式， 会覆盖上面 Theme 的样式
              hintStyle: TextStyle(color: Color(0xFF90CAF9), fontSize: 13),
              labelStyle: TextStyle(color: Color(0xFF90CAF9)),
            ),
            obscureText: true,
          )
        ],
      ),
    );
  }
}
