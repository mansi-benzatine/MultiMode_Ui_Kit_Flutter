import 'package:baby_bloom_app/ui/login/view/login_screen.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../button/common_button.dart';

class ResetPasswordSuccessDialog extends StatelessWidget {
  const ResetPasswordSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 35.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 20.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icCongratulation,
              width: 130.setWidth,
              height: 130.setHeight,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Congratulations!",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 24.setFontSize,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            CommonButton(
              text: "Continue",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, LoginScreen.route());
              },
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
