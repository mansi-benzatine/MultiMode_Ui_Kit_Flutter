import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/text/common_text.dart';
import 'app_color.dart';
import 'constant.dart';
import 'debug.dart';
import 'preference.dart';
import 'service_locator.dart';
import 'sizer_utils.dart';

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
    required String title,
    Function()? onClose,
    Color? titleColor,
    Color? bgColor,
    bool? isDismissible,
    bool? isScrollControlled,
    bool isShowSpace = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: bgColor ?? CustomAppColor.of(context).transparent,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.setHeight, bottom: isShowSpace ? 0.bottomPadding : 0),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgDialog,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).txtGray,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          width: 50.setWidth,
                          height: 4.setHeight,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                        child: CommonText(
                          text: title.toUpperCase(),
                          textColor: titleColor ?? CustomAppColor.of(context).txtBlack,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontSize: 20.setFontSize,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      Divider(
                        color: CustomAppColor.of(context).dividerColor,
                        height: 0.setHeight,
                      ),
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

  static showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CustomAppColor.of(context).red,
        content: CommonText(
          text: message,
          textColor: CustomAppColor.of(context).white,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          fontFamily: Constant.fontFamily,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

extension CustomColorOpacity on Color {
  Color withOpacityPercent(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }
}
