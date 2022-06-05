import 'package:flutter/material.dart';
import 'package:flutterappdemo1/common/global.dart';
import 'package:flutterappdemo1/models/index.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  // 这里重写了notifyListeners方法，并且后面的Model都集成了本类
  // 主要目的是在其他Model类调用了notifyListeners()后能保存Profile变更
  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

class UserModel extends ProfileChangeNotifier {
  User? get user => _profile.user;

  bool get isLogin => user != null;

  set user(User? user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

class ThemeModel extends ProfileChangeNotifier {
  MaterialColor get theme =>
      Global.themes.firstWhere((element) => element.value == (_profile.theme ?? 0), orElse: () => Colors.blue);

  set theme(MaterialColor color) {
    if (color != theme) {
      _profile.theme = color[500]?.value as num;
      notifyListeners();
    }
  }
}

class LocalModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (_profile.locale == null) return null;

    var t = _profile.locale?.split('_');
    return Locale(t![0], t[1]);
  }

  String? get locale => _profile.locale;

  set locale(String? locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
