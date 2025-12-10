import 'package:flutter/material.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../../widgets/text/common_text.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../button/common_button.dart';

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
              text: "Logout",
              fontFamily: Constant.fontFamilySemiBold600,
              fontSize: 20.setFontSize,
              textColor: CustomAppColor.of(context).red,
            ),
            SizedBox(height: 10.setHeight),
            const Divider(),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Are you sure you want to logout?",
              fontFamily: Constant.fontFamilyMedium500,
              fontSize: 14.setFontSize,
            ),
            SizedBox(height: 24.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      height: 40.setHeight,
                      text: "Cancel",
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).txtGray,
                      borderColor: CustomAppColor.of(context).dividerColor,
                      buttonColor: CustomAppColor.of(context).transparent,
                      buttonTextSize: 14.setFontSize,
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      height: 40.setHeight,
                      text: "Logout",
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).white,
                      borderColor: CustomAppColor.of(context).red,
                      buttonColor: CustomAppColor.of(context).red,
                      buttonTextSize: 14.setFontSize,
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
