import 'package:flutter/material.dart';
import 'package:mivi_app/ui/sign_in/view/sign_in_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class ResetPasswordSuccessDialog extends StatelessWidget {
  final BuildContext parentContext;

  const ResetPasswordSuccessDialog({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: CustomAppColor.of(context).secondary,
          width: 0.5,
        ),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 24.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icResetSuccessfully,
              width: 80.setWidth,
              height: 80.setHeight,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "You're All Set!",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 22.setFontSize,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 10.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            CommonButton(
              text: "Continue",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(parentContext, SignInScreen.route());
              },
              height: 45.setHeight,
            ),
          ],
        ),
      ),
    );
  }
}
