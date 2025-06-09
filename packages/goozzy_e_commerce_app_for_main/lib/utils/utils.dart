import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goozzy_e_commerce_app_package/utils/service_locator.dart';

import '../../../../../utils/preference.dart';

class Utils {
  static dismissKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    FocusScope.of(context).unfocus();
  }

  static copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
  }

  static applyStatusBarIconColor(bool isDark) {
    Future.delayed(Duration(milliseconds: (Platform.isIOS) ? 50 : 120), () {
      if (isDark) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      }
    });
  }

  static String getCurrentDate() {
    final now = DateTime.now();
    return "${now.month} ${now.day}, ${now.year}";
  }

  static bool isLightTheme() {
    return getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true);
  }
}

extension CustomColorOpacity on Color {
  Color withOpacityPercent(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }
}
