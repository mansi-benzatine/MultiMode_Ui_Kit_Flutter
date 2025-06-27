import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/login/views/login_screen.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';

class EmailVerificationOtpScreen extends StatefulWidget {
  const EmailVerificationOtpScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const EmailVerificationOtpScreen(),
    );
  }

  @override
  State<EmailVerificationOtpScreen> createState() => _EmailVerificationOtpScreenState();
}

class _EmailVerificationOtpScreenState extends State<EmailVerificationOtpScreen> {
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
                SizedBox(height: 50.setHeight),
                CommonText(
                  text: Languages.of(context).txtLoginWithOTP,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.setFontSize,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: Languages.of(context).txtToConfirmYouEmailAddressPleaseEnterTheOtp,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w600,
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
                SizedBox(height: 62.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtDidnotReceiveTheCode,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtResendOtp,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).primary,
                      textDecoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 47.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtLogin.toUpperCase(),
                    onTap: () => Navigator.push(context, LoginScreen.route()),
                  ),
                ),
                SizedBox(height: 45.setHeight),
                CommonText(
                  text: Languages.of(context).txtValidFor10Minutes,
                  fontSize: 15.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
