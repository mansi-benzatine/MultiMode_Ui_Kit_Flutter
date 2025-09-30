import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';

import '../../../widgets/text/common_text.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.setWidth, horizontal: 22.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(context).txtLogout,
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).red,
            ),
            SizedBox(height: 15.setHeight),
            const Divider(),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Are you sure you want to logout?",
              fontFamily: Constant.fontFamilyMedium500,
              fontSize: 16.setFontSize,
            ),
            SizedBox(height: 24.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtCancel,
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).txtGray,
                      borderColor: CustomAppColor.of(context).dividerColor,
                      buttonColor: CustomAppColor.of(context).transparent,
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtLogout,
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).white,
                      borderColor: CustomAppColor.of(context).red,
                      buttonColor: CustomAppColor.of(context).red,
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
