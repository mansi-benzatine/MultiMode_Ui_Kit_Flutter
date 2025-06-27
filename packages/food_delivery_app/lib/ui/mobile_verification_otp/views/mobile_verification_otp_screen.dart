import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/email_sign_up/views/email_sign_up_screen.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';

import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';

class MobileVerificationOtpScreen extends StatefulWidget {
  const MobileVerificationOtpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MobileVerificationOtpScreen());
  }

  @override
  State<MobileVerificationOtpScreen> createState() => _MobileVerificationOtpScreenState();
}

class _MobileVerificationOtpScreenState extends State<MobileVerificationOtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 33.setHeight, horizontal: 24.setWidth),
              child: Column(
                children: [
                  Align(
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
                  SizedBox(height: 58.setHeight),
                  CommonText(
                    text: Languages.of(context).txtOtpVerification,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.setFontSize,
                  ),
                  SizedBox(height: 30.setHeight),
                  CommonText(
                    text: Languages.of(context).txtEnter4DigitCodeWeHaveSentToAt,
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 7.setHeight),
                  CommonText(
                    text: "+91 12345 67890",
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).primary,
                  ),
                  SizedBox(height: 58.setHeight),
                  OTPTextField(
                    context: context,
                    length: 4,
                    width: 0.screenWidth,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 56.setHeight,
                    fieldHeight: 56.setHeight,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: CustomAppColor.of(context).txtBlack.withValues(alpha: .3),
                      enabledBorderColor: CustomAppColor.of(context).txtBlack.withValues(alpha: .3),
                      disabledBorderColor: CustomAppColor.of(context).txtBlack.withValues(alpha: .3),
                      errorBorderColor: CustomAppColor.of(context).txtBlack.withValues(alpha: .3),
                      focusBorderColor: CustomAppColor.of(context).primary,
                      backgroundColor: CustomAppColor.of(context).transparent,
                      borderRadius: 0.0,
                    ),
                    style: TextStyle(
                      color: CustomAppColor.of(context).txtBlack,
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w800,
                      fontFamily: Constant.fontFamily,
                      height: 1,
                    ),
                    onChanged: (pin) {
                      Debug.printLog("onChanged Enter PIN ==>$pin");
                    },
                    onCompleted: (pin) {
                      Debug.printLog("onCompleted Enter PIN ==>$pin");
                    },
                  ),
                  SizedBox(height: 58.setHeight),
                  CommonText(
                    text: "00:22",
                    fontSize: 36.setFontSize,
                    textColor: CustomAppColor.of(context).grey,
                  ),
                  SizedBox(height: 47.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtDidnotReceiveTheCode,
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).grey,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 8.setWidth),
                      CommonText(
                        text: Languages.of(context).txtResendOtp,
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).primary,
                        textDecoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 47.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtProceed.toUpperCase(),
                    onTap: () => Navigator.push(context, EmailSignUpScreen.route()),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
