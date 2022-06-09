import 'package:flutter/material.dart';
import 'package:flutterappdemo1/generated/l10n.dart';
import 'package:flutterappdemo1/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String loadingTag = "##loading##";
  bool hasMore = true;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    // 获取 model
    UserModel userModel = Provider.of<UserModel>(context);

    // 没有登录场景
    Widget notLogin = Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, "login"),
        child: Text(GmLocalizations.of(context).login),
      ),
    );
    if (!userModel.isLogin) return notLogin;

    return Container();
  }
}
