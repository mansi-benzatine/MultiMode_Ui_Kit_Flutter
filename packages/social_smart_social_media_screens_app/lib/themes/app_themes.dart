import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/constant.dart';
import '../utils/preference.dart';
import '../utils/service_locator.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      brightness:
          getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? Brightness.light : Brightness.dark,
      fontFamily: Constant.fontFamilyUrbanist,
      useMaterial3: true,
      scaffoldBackgroundColor: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
          ? CustomAppColor.of(context).bgScaffold
          : const Color(0xff181A20),
      appBarTheme: AppBarTheme(
        backgroundColor: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
            ? CustomAppColor.of(context).white
            : CustomAppColor.of(context).black,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        dragHandleColor: Color(0xFFE0E0E0),
      ),
    );
  }
}
