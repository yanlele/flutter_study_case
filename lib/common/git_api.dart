import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdemo1/common/global.dart';
import 'package:flutterappdemo1/models/index.dart';
import 'package:http_proxy/http_proxy.dart';

class Git {
  BuildContext context;
  late Options _options;

  Git(this.context) {
    _options = Options(extra: {'context': context});
  }

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com/',
      headers: {
        HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
            "application/vnd.github.symmetra-preview+json",
      },
    ),
  );

  static void init() {
    // 添加缓存拦截器插件
    dio.interceptors.add(Global.netCache);

    // 设置用户 token
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
  }

  // 使用http_proxy插件来获取系统的代理，然后进行全局设置，进而能够正常抓包。
  // 但这功能是否对线上造成影响，未知,故只在调试时开启
  static void addProxy1() async {
    if (!Global.isRelease) {
      HttpProxy httpProxy = await HttpProxy.createHttpProxy();
      HttpOverrides.global = httpProxy;
    }
  }

  static void addProxy(Dio dio) {
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        //设置代理抓包，调试用
        client.findProxy = (uri) {
          return 'PROXY 10.14.4.141:8888';
        };
        // 代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录接口请求
  Future<User> login(String login, String pwd) async {
    String basic = 'Basic ${base64.encode(utf8.encode('$login:$pwd'))}';
    log("basic=$basic");

    var res = await dio.get(
      '/user',
      options: _options.copyWith(
        headers: {
          HttpHeaders.authorizationHeader: basic,
        },
        extra: {
          "noCache": true, // 本地接口不适用缓存
        },
      ),
    );

    log(res.toString());

    // 登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;

    Global.netCache.cache.clear();

    Global.profile.token = basic;
    return User.fromJson(res.data);
  }

  Future<List<Repo>> getRepos({
    required Map<String, dynamic> query,
    refresh = false,
  }) async {
    if (refresh) _options.extra?.addAll({'refresh': true, 'list': true});
    var res = await dio.get<List>(
      'user/repos',
      queryParameters: query,
      options: _options,
    );

    return res.data!.map((item) => Repo.fromJson(item)).toList();
  }
}
