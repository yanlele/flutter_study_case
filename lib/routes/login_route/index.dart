import 'package:flutter/material.dart';
import 'package:flutterappdemo1/common/global.dart';
import 'package:flutterappdemo1/generated/l10n.dart';

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
    );
  }
}
