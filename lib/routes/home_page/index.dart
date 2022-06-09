import 'package:flutter/material.dart';
import 'package:flutterappdemo1/generated/l10n.dart';
import 'package:flutterappdemo1/routes/home_page/components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context).title),
      ),
      body: const HomePageBody(),
    );
  }
}
