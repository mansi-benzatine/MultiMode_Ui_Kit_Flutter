import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../../../../utils/preference.dart';
import '../../../../../../../../../utils/service_locator.dart';

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

  static bool isDarkTheme() {
    return getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false);
  }
}

class ToastUtils {
  static void showToast(
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double fontSize = 14.0,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}

extension CustomColorOpacity on Color {
  Color withOpacityPercent(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }
}
