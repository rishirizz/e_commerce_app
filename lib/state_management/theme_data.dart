import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  toggleTheme() {
    _isDark = !isDark;
    notifyListeners();
  }
}
