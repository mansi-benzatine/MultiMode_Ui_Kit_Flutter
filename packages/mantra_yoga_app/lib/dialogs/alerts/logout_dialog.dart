import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key, required this.onTap});

  final Function? onTap;

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (context) => LogoutDialog(onTap: onTap),
    );
  }

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: "${Languages.of(context).txtLogout}!",
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          Divider(
            color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
            height: 30.setHeight,
          ),
          Image.asset(
            AppAssets.imgLogout,
            width: 90.setHeight,
            height: 90.setHeight,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(context).txtAreYouSureYouWantToLogout,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: Languages.of(context).txtCancel,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonColor: CustomAppColor.of(context).bgScreen,
                  borderColor: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  radius: 18,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonButton(
                  text: Languages.of(context).txtLogout,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onTap?.call();
                  },
                  buttonColor: CustomAppColor.of(context).txtRed.withValues(alpha: 0.1),
                  borderColor: CustomAppColor.of(context).txtRed,
                  buttonTextColor: CustomAppColor.of(context).txtRed,
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
