import 'package:flutter/material.dart';
import 'package:flutterappdemo1/common/global.dart';
import 'package:flutterappdemo1/generated/l10n.dart';
import 'package:flutterappdemo1/models/user.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  // 用户名和密码 Controller
  final TextEditingController unameController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  // 是否明文显示
  bool showPwd = false;

  final GlobalKey formKey = GlobalKey<FormState>();
  bool nameAutoFocus = true;

  @override
  void initState() {
    unameController.text = Global.profile.lastLogin ?? "";
    if (unameController.text.isNotEmpty) nameAutoFocus = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 国际化文案
    GmLocalizations i18n = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(i18n.login)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autofocus: nameAutoFocus,
                controller: unameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: i18n.userName,
                  labelText: i18n.userName,
                ),
                validator: (value) =>
                (value == null || value
                    .trim()
                    .isEmpty) ? i18n.userNameRequired : null,
              ),
              TextFormField(
                autofocus: !nameAutoFocus,
                controller: pwdController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: i18n.password,
                  labelText: i18n.password,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => showPwd != showPwd),
                    icon: Icon(showPwd ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: !showPwd,
                validator: (value) =>
                (value == null || value
                    .trim()
                    .isEmpty) ? i18n.userNameRequired : null,
              ),
              // 提交按钮
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 56),
                  child: ElevatedButton(
                    onPressed:,
                    child: Text(i18n.login),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onLogin() async {
    FormState form = formKey.currentState as FormState;
    if (!form.validate()) return;

    User? user;



  }
}
