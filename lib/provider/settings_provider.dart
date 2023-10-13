import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  changeMode(ThemeMode m) {
    mode = m;
    notifyListeners();
  }
  changLang(String lang,BuildContext context){
    context.setLocale(Locale(lang));
    notifyListeners();

  }
}
