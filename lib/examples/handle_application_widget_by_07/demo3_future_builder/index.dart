import 'package:flutter/material.dart';

Future<String> mockNetWorkData() async {
  return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetWorkData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 如果请求结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else {
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求没有结束， 显示 loading
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
