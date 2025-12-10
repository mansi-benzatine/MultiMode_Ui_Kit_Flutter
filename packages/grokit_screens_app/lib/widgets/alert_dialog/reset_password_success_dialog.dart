import 'package:flutter/material.dart';
import 'package:grokit_screens_app/ui/signin/view/sign_in_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class ResetPasswordSuccessDialog extends StatelessWidget {
  const ResetPasswordSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 25.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 25.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.imgResetPasswordSuccess,
              width: 157.setWidth,
              height: 150.setHeight,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Congratulations!",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 24.setFontSize,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 12.setFontSize,
            ),
            SizedBox(height: 24.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: "Ok",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, SignInScreen.route());
                },
                borderColor: CustomAppColor.of(context).txtPrimary,
                buttonColor: CustomAppColor.of(context).txtPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
