import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'debug.dart';
import 'preference.dart';
import 'service_locator.dart';

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
      Debug.printLoge("applyStatusBarIconColor", "$isDark");
      if (isDark) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      }
    });
  }

  static bool isLightTheme() {
    return getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true);
  }

  static Future<dynamic> showBottomSheetDialog(
    BuildContext context, {
    required Widget widgets,
    Function()? onClose,
    Color? titleColor,
    Color? bgColor,
    bool? isDismissible,
    bool? isScrollControlled,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: true,
      backgroundColor: bgColor ?? CustomAppColor.of(context).transparent,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widgets,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension CustomColorOpacity on Color {
  Color withOpacityPercent(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }
}
