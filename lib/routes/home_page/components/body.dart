import 'package:flutter/material.dart';
import 'package:flutterappdemo1/common/git_api.dart';
import 'package:flutterappdemo1/generated/l10n.dart';
import 'package:flutterappdemo1/models/index.dart';
import 'package:flutterappdemo1/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  static const String loadingTag = "##loading##";

  List<Repo> items = <Repo>[Repo()..name = loadingTag];

  bool hasMore = true;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    // 获取 model
    UserModel userModel = Provider.of<UserModel>(context);

    // 没有登录场景
    Widget notLoginWidget = Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, "login"),
        child: Text(GmLocalizations.of(context).login),
      ),
    );

    // 登录了的场景， 展示列表
    Widget loginWidget = ListView.separated(
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );

    if (!userModel.isLogin) return notLoginWidget;

    return Container(
      child: const Center(
        child: Text('home body content'),
      ),
    );
  }

  IndexedWidgetBuilder indexedWidgetBuilder(BuildContext context) => (context, index) {
        // 说明是最后一个元素
        if (items[index].name == loadingTag) {
          debugPrint("items[index].name == loadingTag");
          if (hasMore) {
            _retrieveData(context);
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 24,
              height: 24,
              child: const CircularProgressIndicator(strokeWidth: 2),
            );
          }
          // 已经加载了 100 条， 没有更多数据场景。

        }
      };

  // 请求获取新的列表数据
  Future<void> _retrieveData(BuildContext context) async {
    var data = await Git(context).getRepos(query: {"page": page, "page_size": 20});
    hasMore = data.isNotEmpty && data.length % 20 == 0;
    items.insertAll(items.length-1, data);
    page++;
  }
}
