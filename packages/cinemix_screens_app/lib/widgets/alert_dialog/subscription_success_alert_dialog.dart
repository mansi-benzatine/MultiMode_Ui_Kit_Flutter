import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class SubscriptionSuccessAlertDialog extends StatelessWidget {
  const SubscriptionSuccessAlertDialog({super.key});

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
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 24.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icCrown,
              width: 70.setWidth,
              height: 70.setHeight,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Congratulations!",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 22.setFontSize,
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 13.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "Done!",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  height: 45.setHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
