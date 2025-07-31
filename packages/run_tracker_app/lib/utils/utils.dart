import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:run_tracker_app/utils/service_locator.dart';

import '../widgets/text/common_text.dart';
import 'app_color.dart';
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

  static bool isLightTheme() {
    return getIt.get<LocalStorageService>().getBool(
      LocalStorageService.isLightTheme,
      optionalValue: true,
    );
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
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                        text: title,
                        textColor:
                            titleColor ?? CustomAppColor.of(context).txtBlack,
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
