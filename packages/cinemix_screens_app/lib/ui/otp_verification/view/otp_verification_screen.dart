import 'package:cinemix_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/animated_image_row/animated_image_row.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class OtpVerificationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
  }

  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final imageLists = [
    [
      AppAssets.imgGetStarted1,
      AppAssets.imgGetStarted2,
      AppAssets.imgGetStarted3,
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
    ],
    [
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
      AppAssets.imgGetStarted7,
      AppAssets.imgGetStarted8,
      AppAssets.imgGetStarted9,
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Positioned(
            top: -110.setHeight,
            left: -92.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(imageLists.length, (i) {
                return AnimatedImageRow(
                  images: imageLists[i],
                  reverse: i.isOdd,
                );
              }),
            ),
          ),
          Positioned(
            top: 50.setHeight,
            left: 20.setWidth,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 70.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.05),
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.8),
                    CustomAppColor.of(context).bgLinearShadow,
                    CustomAppColor.of(context).bgLinearShadow,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.2, 0.3, 0.9],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtOtpVerification,
                      textAlign: TextAlign.center,
                      fontSize: 32.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplayBold700,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtCodeHasBeenSendToSameEmail,
                      textAlign: TextAlign.center,
                      fontSize: 14.setFontSize,
                      fontFamily: Constant.fontFamilyClashGroteskMedium500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  SizedBox(height: 25.setHeight),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
                    child: OTPTextField(
                      context: context,
                      length: 4,
                      width: 0.screenWidth - 40.setWidth,
                      fieldWidth: 60.setWidth,
                      fieldHeight: 60.setHeight,
                      outlineBorderRadius: 16,
                      fieldStyle: FieldStyle.box,
                      style: TextStyle(
                        fontSize: 28.setFontSize,
                        color: CustomAppColor.of(context).txtPrimary,
                        fontFamily: Constant.fontFamilyClashDisplayBold700,
                        fontWeight: FontWeight.bold,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: CustomAppColor.of(context).bgTextFormFieldShadow,
                        borderColor: CustomAppColor.of(context).grey,
                        focusBorderColor: CustomAppColor.of(context).borderOtp,
                        enabledBorderColor: CustomAppColor.of(context).borderOtp,
                        disabledBorderColor: CustomAppColor.of(context).borderOtp,
                        errorBorderColor: CustomAppColor.of(context).txtRed,
                      ),
                      onChanged: (value) {},
                      onCompleted: (value) {},
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtResendCodeIn,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplayRegular400,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: "34 Seconds",
                        textColor: CustomAppColor.of(context).primary,
                        fontFamily: Constant.fontFamilyClashGroteskMedium500,
                      ),
                    ],
                  ),
                  SizedBox(height: 250.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtContinue.toUpperCase(),
                      buttonTextColor: CustomAppColor.of(context).white,
                      onTap: () => Navigator.push(context, ResetPasswordScreen.route()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
