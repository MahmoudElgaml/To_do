import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  changeMode(ThemeMode m) {
    mode = m;
    notifyListeners();
  }
}
