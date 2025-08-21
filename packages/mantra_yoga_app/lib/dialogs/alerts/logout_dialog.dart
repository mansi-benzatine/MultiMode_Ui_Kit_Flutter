import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key, required this.onTap, required this.parentContext});

  final Function? onTap;
  final BuildContext parentContext;

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (_) => LogoutDialog(
        onTap: onTap,
        parentContext: context, // 👈 pass caller context
      ),
    );
  }

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    final parentContext = widget.parentContext;

    return AlertDialog(
      backgroundColor: CustomAppColor.of(parentContext).bgScreen,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: "${Languages.of(parentContext).txtLogout}!",
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(parentContext).txtBlack,
          ),
          Divider(
            color: CustomAppColor.of(parentContext).txtBlack.withValues(alpha: 0.1),
            height: 30.setHeight,
          ),
          Image.asset(
            AppAssets.imgLogout,
            width: 90.setHeight,
            height: 90.setHeight,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(parentContext).txtAreYouSureYouWantToLogout,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(parentContext).txtDarkGray,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: Languages.of(parentContext).txtCancel,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonColor: CustomAppColor.of(parentContext).bgScreen,
                  borderColor: CustomAppColor.of(parentContext).black.withValues(alpha: 0.1),
                  buttonTextColor: CustomAppColor.of(parentContext).txtBlack,
                  radius: 18,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonButton(
                  text: Languages.of(parentContext).txtLogout,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onTap?.call();
                  },
                  buttonColor: CustomAppColor.of(parentContext).txtRed.withValues(alpha: 0.1),
                  borderColor: CustomAppColor.of(parentContext).txtRed,
                  buttonTextColor: CustomAppColor.of(parentContext).txtRed,
                  radius: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
