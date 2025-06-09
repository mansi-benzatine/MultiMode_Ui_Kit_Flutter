import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/constant.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      fontFamily: Constant.fontFamilyUrbanist,
      useMaterial3: true,
      scaffoldBackgroundColor: isLightTheme ? AppColor.white : AppColor.bgScaffold,
      appBarTheme: AppBarTheme(
        backgroundColor: isLightTheme ? Colors.white : Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
