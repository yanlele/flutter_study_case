import 'package:dio/dio.dart';

class CacheObject {
  late Response response;

  // 缓存时间
  int timeStamp;

  CacheObject(this.response):
        timeStamp = DateTime.now().microsecondsSinceEpoch;

  @override
  int get hashCode {
    return response.realUri.hashCode;
  }

  // todo? 这个又是啥语法？
  @override
  bool operator ==(Object other) {
    return response.hashCode == other.hashCode;
  }
}
