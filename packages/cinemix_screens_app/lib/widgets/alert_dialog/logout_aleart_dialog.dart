import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../button/common_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgTextFormFieldShadowLight,
              CustomAppColor.of(context).bgShadowDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 24.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: "Logout",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 20.setFontSize,
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).dividerColor),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Are you sure you want to logout?",
              fontFamily: Constant.fontFamilyClashGroteskMedium500,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 25.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      height: 40.setHeight,
                      text: "Cancel",
                      onTap: () => Navigator.pop(context),
                      borderColor: CustomAppColor.of(context).txtBlack,
                      buttonColor: CustomAppColor.of(context).transparent,
                      buttonTextSize: 14.setFontSize,
                      buttonTextColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      height: 40.setHeight,
                      text: "Logout",
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
