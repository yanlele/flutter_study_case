import 'package:flutter/material.dart';

/*
显式指定了Container的宽、高都为 120。
如果我们不显式指定宽高，而通过同时指定widthFactor和heightFactor 为 2 也是可以达到同样的效果：
因为FlutterLogo的宽高为 60，则Align的最终宽高都为2*60=120。

todo 这个 demo 为何会不生效呢？

Alignment Widget会以矩形的中心点作为坐标原点
FractionalOffset 的坐标原点为矩形的左侧顶点
* */
class YLAlignDemo1 extends StatelessWidget {
  const YLAlignDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue.shade50,
      child: const Align(
        widthFactor: null,
        heightFactor: null,
        alignment: Alignment(2,0.0),
        child: FlutterLogo(
          size: 60.0,
        ),
      ),
    );
  }
}
