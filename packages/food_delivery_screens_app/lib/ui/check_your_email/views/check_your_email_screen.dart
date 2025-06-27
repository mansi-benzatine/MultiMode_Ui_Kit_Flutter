import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/email_verification_otp/views/email_verification_otp_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const CheckYourEmailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.setHeight, horizontal: 24.setWidth),
            child: Column(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        AppAssets.icBack,
                        width: 18.setWidth,
                        height: 15.setHeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.setHeight),
                Image.asset(
                  AppAssets.imgCheckEmail,
                  width: 235.setWidth,
                  height: 235.setHeight,
                ),
                CommonText(
                  text: Languages.of(context).txtCheckYourEmail,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.setFontSize,
                ),
                SizedBox(height: 11.setHeight),
                CommonText(
                  text: Languages.of(context).txtToConfirmYouEmailAddress,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.24,
                ),
                SizedBox(height: 62.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtOpenEmailApp.toUpperCase(),
                    onTap: () => Navigator.push(context, EmailVerificationOtpScreen.route()),
                  ),
                ),
                SizedBox(height: 36.setHeight),
                CommonText(
                  text: "00:22",
                  fontSize: 36.setFontSize,
                  textColor: CustomAppColor.of(context).grey,
                ),
                SizedBox(height: 90.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtResendLink,
                      fontSize: 15.setFontSize,
                      textColor: CustomAppColor.of(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonText(
                      text: Languages.of(context).txtManuallyEnterOTP,
                      fontSize: 15.setFontSize,
                      textColor: CustomAppColor.of(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
