import 'dart:io';

import 'package:dating_screens_app_package/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/text/common_text.dart';
import 'app_color.dart';
import 'debug.dart';
import 'preference.dart';
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
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: bgColor ?? CustomAppColor.of(context).transparent,
      isDismissible: isDismissible ?? true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20.setWidth,
                    right: 20.setWidth,
                    top: 20.setHeight,
                    bottom: 30.setHeight,
                  ),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).black,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                        text: title,
                        textColor: titleColor ?? CustomAppColor.of(context).txtWhite,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        fontSize: 26.setFontSize,
                      ),
                      Divider(
                        color: CustomAppColor.of(context).white,
                        height: 35.setHeight,
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
}
