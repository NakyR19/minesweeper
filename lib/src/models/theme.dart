import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _isPirateTheme = false;

  bool get theme => _isPirateTheme;

  set theme(bool theme) {
    _isPirateTheme = theme;
    notifyListeners();
  }
}
