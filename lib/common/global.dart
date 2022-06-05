import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterappdemo1/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'git_api.dart';
import 'net_cache.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static late SharedPreferences _prefs;
  static Profile profile = Profile();

  // todo 网络缓存对象
  static NetCache netCache = NetCache();

  // 可选主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为 release 版本
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  // 初始化全局信息
  static Future init() async {
    // todo?: 这是在干啥
    WidgetsFlutterBinding.ensureInitialized();

    // todo?: 这个库是干啥子的
    // 貌似是读取什么配置的
    _prefs = await SharedPreferences.getInstance();

    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
        debugPrint("_profile=$_profile", wrapWidth: 1024);
        debugPrint("profile=$profile", wrapWidth: 1024);
      } catch (e) {
        debugPrint("Profile read error = $e");
      }
    }

    // 使用缓存策略： 如果没有缓存，使用默认缓存策略？
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    // todo 初始化网络请求相关配置？
    Git.init();
  }

  // 持久化 profile 信息， 两种写法是等价的
  static saveProfile() => _prefs.setString("profile", jsonEncode(profile.toJson()));
  // static void saveProfile() {
  //   _prefs.setString("profile", jsonEncode(profile.toJson()));
  // }
}
