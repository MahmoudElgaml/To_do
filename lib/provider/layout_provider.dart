import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  int index = 0;

  currentIcndex(int value) {
    index = value;
    notifyListeners();
  }
}
