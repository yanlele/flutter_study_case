import 'package:flutter/material.dart';
import 'package:flutterappdemo1/generated/l10n.dart';
import 'package:flutterappdemo1/routes/home_page/index.dart';
import 'package:flutterappdemo1/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'common/global.dart';

main() => Global.init().then((_) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<SingleChildWidget> get providers => [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocalModel()),
      ];

  GenerateAppTitle generateAppTitle(BuildContext ctx) => (ctx) => GmLocalizations.of(ctx).title;

  // 重写 build 方法
  @override
  Widget build(context) {
    return MultiProvider(
      providers: providers,
      child: Consumer2<ThemeModel, LocalModel>(
        builder: (context, themeModel, localModel, child) {
          return MaterialApp(
            // primaryColor是primarySwatch的一种[500]，设置primarySwatch会更好，覆盖的范围更大
            theme: ThemeData(primarySwatch: themeModel.theme),
            // 跟title差不多，但是onGenerateTitle可以做本地化
            onGenerateTitle: generateAppTitle(context),
            // 首页
            home: const HomePage(),
            // 设置语言
            locale: localModel.getLocale(),
            // 设置支持的语言，使用Intl插件工具后，直接使用就好
            supportedLocales: GmLocalizations.delegate.supportedLocales,

          );
        },
      ),
    );
  }
}
