import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/preference.dart';
import '../utils/service_locator.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      brightness:
          getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? Brightness.light : Brightness.dark,
      fontFamily: Constant.fontFamily,
      useMaterial3: true,
    );
  }

  static ThemeData lightTheme = ThemeData(
    brightness: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false) ? Brightness.light : Brightness.dark,
    fontFamily: Constant.fontFamily,
    useMaterial3: true,
  );
}
