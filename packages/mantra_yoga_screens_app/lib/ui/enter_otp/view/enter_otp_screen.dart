import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../reset_password/view/reset_password_screen.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const EnterOTPScreen());
  }

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: "",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtEnterOTP,
                    fontSize: 30.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLoremIpsum,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamilyRegular400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 50.setHeight),
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
                        fontSize: 24.setFontSize,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColor.of(context).txtBlack,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: CustomAppColor.of(context).bgScreen,
                        borderColor: CustomAppColor.of(context).primary,
                        focusBorderColor: CustomAppColor.of(context).primary,
                        enabledBorderColor: CustomAppColor.of(context).primary,
                        disabledBorderColor: CustomAppColor.of(context).primary,
                        errorBorderColor: CustomAppColor.of(context).txtRed,
                      ),
                      onChanged: (value) {},
                      onCompleted: (value) {},
                    ),
                  ),
                  SizedBox(height: 30.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtContinue,
                      onTap: () {
                        Navigator.push(context, ResetPasswordScreen.route());
                      },
                      buttonColor: CustomAppColor.of(context).primary,
                      borderColor: CustomAppColor.of(context).borderColor,
                      borderWidth: 3,
                      height: 45.setHeight,
                      radius: 18,
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
