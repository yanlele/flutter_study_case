import 'package:flutter/material.dart';

class YLFormTestRoute extends StatefulWidget {
  const YLFormTestRoute({Key? key}) : super(key: key);

  @override
  State<YLFormTestRoute> createState() => _YLFormTestRouteState();
}

class _YLFormTestRouteState extends State<YLFormTestRoute> {
  // name
  final TextEditingController _unameController = TextEditingController();

  // pwd
  final TextEditingController _pwdController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // 表单验证是否开启
      // autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            controller: _unameController,
            decoration: const InputDecoration(
              labelText: "labelText",
              hintText: "请输入用户名",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              return value!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),

          // 登录按钮
          Padding(
            padding: const EdgeInsets.all(28),
            child: Row(
              children: [
                Expanded(
                  child: Builder(builder: (context) {
                    return ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("登录"),
                      ),
                      onPressed: () {
                        // GlobalKey 方式
                        FormState formState = _formKey.currentState as FormState;
                        if (formState.validate()) {
                          // 通过验证
                          print("通过验证");
                        }

                        // Form.of 方式
                        if ((Form.of(context) as FormState).validate()) {
                          // 通过验证
                          print("通过验证22");
                        }
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
