import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

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
        side: BorderSide(color: CustomAppColor.of(context).red, width: 0.5),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icRoundLogout,
              width: 60.setWidth,
              height: 60.setHeight,
            ),
            SizedBox(height: 14.setHeight),
            CommonText(
              text: "Logout",
              fontFamily: Constant.fontFamilySemiBold600,
              fontSize: 20.setFontSize,
            ),
            SizedBox(height: 14.setHeight),
            CommonText(
              text: "Are you sure you want to logout?",
              fontFamily: Constant.fontFamilyMedium500,
              fontSize: 13.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 20.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Column(
                children: [
                  CommonButton(
                    height: 40.setHeight,
                    text: "Logout",
                    onTap: () => Navigator.pop(context),
                    buttonTextColor: CustomAppColor.of(context).white,
                    borderColor: CustomAppColor.of(context).red,
                    buttonColor: CustomAppColor.of(context).red,
                    buttonTextSize: 14.setFontSize,
                  ),
                  SizedBox(height: 16.setHeight),
                  CommonButton(
                    height: 40.setHeight,
                    text: "Cancel",
                    onTap: () => Navigator.pop(context),
                    borderColor: CustomAppColor.of(context).btnGrey,
                    buttonColor: CustomAppColor.of(context).btnGrey,
                    buttonTextSize: 14.setFontSize,
                    buttonTextColor: CustomAppColor.of(context).txtBlack,
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
