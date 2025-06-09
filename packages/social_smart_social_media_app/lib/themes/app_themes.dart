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
        scaffoldBackgroundColor: isLightTheme ? Colors.white : Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: isLightTheme ? CustomAppColor.of(context).white : CustomAppColor.of(context).black,
          surfaceTintColor: Colors.transparent,
        ),
        bottomSheetTheme: const BottomSheetThemeData(dragHandleColor: Color(0xFFE0E0E0)));
  }
}
