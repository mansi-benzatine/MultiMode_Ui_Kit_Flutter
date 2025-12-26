import 'package:bitx_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/glass_container/glass_container.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../reset_password/view/reset_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final bool isFromSignIn;
  const VerifyOtpScreen({super.key, required this.isFromSignIn});

  static Route<void> route({required bool isFromSignIn}) {
    return MaterialPageRoute(builder: (context) => VerifyOtpScreen(isFromSignIn: isFromSignIn));
  }

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSignUpBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 70.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtOtpVerification.toUpperCase(),
                          textAlign: TextAlign.start,
                          fontSize: 30.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Expanded(
                        child: SingleChildScrollView(
                          child: GlassContainer(
                            height: 0.screenHeight,
                            width: 0.screenWidth,
                            child: Column(
                              children: [
                                SizedBox(height: 10.setHeight),
                                CommonText(
                                  text: Languages.of(context).txtEnterYourOtp,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.setFontSize,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                SizedBox(height: 25.setHeight),
                                OTPTextField(
                                  context: context,
                                  length: 4,
                                  width: 0.screenWidth - 40.setWidth,
                                  fieldWidth: 68.setWidth,
                                  fieldHeight: 50.setHeight,
                                  outlineBorderRadius: 12,
                                  fieldStyle: FieldStyle.box,
                                  style: TextStyle(
                                    fontSize: 24.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColor.of(context).primary,
                                    height: 1,
                                    package: "bitx_screens_app",
                                  ),
                                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                                  otpFieldStyle: OtpFieldStyle(
                                    backgroundColor: CustomAppColor.of(context).bgScreen,
                                    borderColor: CustomAppColor.of(context).primary,
                                    focusBorderColor: CustomAppColor.of(context).primary,
                                    enabledBorderColor: CustomAppColor.of(context).txtGray,
                                    disabledBorderColor: CustomAppColor.of(context).txtGray,
                                    errorBorderColor: CustomAppColor.of(context).txtRed,
                                    filledBorderColor: CustomAppColor.of(context).primary,
                                  ),
                                  onChanged: (value) {
                                    // _otpValue.value = value;
                                  },
                                  onCompleted: (value) {
                                    // _otpValue.value = value;
                                  },
                                ),
                                SizedBox(height: 30.setHeight),
                                InkWell(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: Languages.of(context).txtResendOtp,
                                            style: TextStyle(
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: CustomAppColor.of(context).txtBlack,
                                              fontFamily: Constant.fontFamily,
                                              package: "bitx_screens_app",
                                            ),
                                          ),
                                          WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                          TextSpan(
                                            text: "45 sec",
                                            style: TextStyle(
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: CustomAppColor.of(context).primary,
                                              fontFamily: Constant.fontFamily,
                                              package: "bitx_screens_app",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IgnorePointer(
                                  ignoring: true,
                                  child: CommonButton(
                                    text: Languages.of(context).txtContinue,
                                    mTop: 80.setHeight,
                                    mBottom: 30.setHeight,
                                    onTap: () {
                                      if (widget.isFromSignIn) {
                                        Navigator.push(context, ProfileSetupScreen.route());
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
              ),
            ],
          ),
        ),
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
