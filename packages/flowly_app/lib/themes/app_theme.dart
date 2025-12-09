import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/preference.dart';
import '../utils/service_locator.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      fontFamily: Constant.fontFamilyMulishRegular400,
      useMaterial3: true,
    );
  }

  static ThemeData lightTheme = ThemeData(
    brightness: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false) ? Brightness.light : Brightness.dark,
    fontFamily: Constant.fontFamilyMulishRegular400,
    useMaterial3: true,
  );
}
