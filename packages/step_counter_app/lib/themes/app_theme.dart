import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/preference.dart';
import '../utils/service_locator.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    final isLightTheme = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false);

    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      fontFamily: Constant.fontFamily,
      useMaterial3: true,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static ThemeData lightTheme = ThemeData(
    brightness: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false) ? Brightness.light : Brightness.dark,
    fontFamily: Constant.fontFamily,
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
