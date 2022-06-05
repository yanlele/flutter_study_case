import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutterappdemo1/common/global.dart';

import 'cache_object.dart';

/// 网路缓存
class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 如果不允许缓存场景
    if (!Global.profile.cache!.enable) return handler.next(options);

    bool refresh = options.extra['refresh'] == true;
    if (refresh) {
      if (options.extra['list'] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        delete(options.uri.toString());
      }
      return handler.next(options);
    }

    if (options.extra['noCache'] != true && options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp)/1000 < Global.profile.cache!.maxAge) {
          handler.resolve(ob.response);
        } else {
          cache.remove(key);
        }
      }
    }

    handler.next(options);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Global.profile.cache!.enable) _saveCache(response);
    handler.next(response);
  }

  void _saveCache(Response object) {
    RequestOptions options = object.requestOptions;
    if (options.extra['noCache'] != true && options.method.toLowerCase() == 'get') {
      if (cache.length == Global.profile.cache!.maxCount) cache.remove(cache[cache.keys.first]);

      String key = options.extra['cacheKey'] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }

  void delete(String key) => cache.remove(key);
}
