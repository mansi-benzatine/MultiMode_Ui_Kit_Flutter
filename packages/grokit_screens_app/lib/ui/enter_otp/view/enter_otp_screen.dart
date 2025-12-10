import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:grokit_screens_app/ui/your_location/view/your_location_screen.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';

class EnterOtpScreen extends StatefulWidget {
  final bool isFromLoginOrSignupScreen;
  static Route<void> route({bool isFromLoginOrSignupScreen = false}) {
    return MaterialPageRoute(
      builder: (_) => EnterOtpScreen(
        isFromLoginOrSignupScreen: isFromLoginOrSignupScreen,
      ),
    );
  }

  const EnterOtpScreen({super.key, this.isFromLoginOrSignupScreen = false});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.setHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.setHeight, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  CommonText(
                    text: Languages.of(context).txtOtpVerification,
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 0.setHeight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).cardBgBlackWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.07),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtPleaseEnterThe4DigitCodeSentToYourPhoneNumber,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 45.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.setWidth),
                        child: OTPTextField(
                          context: context,
                          length: 4,
                          width: 0.screenWidth - 40.setWidth,
                          fieldWidth: 55.setWidth,
                          fieldHeight: 55.setHeight,
                          outlineBorderRadius: 8,
                          fieldStyle: FieldStyle.box,
                          style: TextStyle(
                            fontSize: 24.setFontSize,
                            color: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamilyBlack900,
                            fontWeight: FontWeight.bold,
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceBetween,
                          otpFieldStyle: OtpFieldStyle(
                            backgroundColor: CustomAppColor.of(context).bgScreen,
                            borderColor: CustomAppColor.of(context).borderOtp,
                            focusBorderColor: CustomAppColor.of(context).txtBlack,
                            enabledBorderColor: CustomAppColor.of(context).txtGray,
                            disabledBorderColor: CustomAppColor.of(context).txtRed,
                            errorBorderColor: CustomAppColor.of(context).txtRed,
                          ),
                          onChanged: (value) {},
                          onCompleted: (value) {},
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtResendCodeIn,
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 14.setFontSize,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtGray,
                            ),
                            SizedBox(width: 5.setWidth),
                            CommonText(
                              text: "34 Seconds",
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 14.setFontSize,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtPrimary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtContinue,
                          onTap: () {
                            if (widget.isFromLoginOrSignupScreen) {
                              Navigator.push(context, YourLocationScreen.route());
                            } else {
                              Navigator.push(context, ResetPasswordScreen.route());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
