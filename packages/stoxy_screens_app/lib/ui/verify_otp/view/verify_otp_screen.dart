import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';

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

  static Route<void> route({required bool isFromSignIn}) {
    return MaterialPageRoute(builder: (_) => VerifyOtpScreen(isFromSignIn: isFromSignIn));
  }

  const VerifyOtpScreen({super.key, required this.isFromSignIn});

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
              SizedBox(height: 40.setHeight),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: Languages.of(context).txtEnterOtp,
                          textAlign: TextAlign.start,
                          fontSize: 30.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDescriptionGray,
                      ),
                      SizedBox(height: 40.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
                        child: OTPTextField(
                          context: context,
                          length: 4,
                          width: 0.screenWidth - 40.setWidth,
                          fieldWidth: 60.setWidth,
                          fieldHeight: 60.setHeight,
                          outlineBorderRadius: 1000,
                          fieldStyle: FieldStyle.box,
                          style: TextStyle(
                            fontSize: 24.setFontSize,
                            fontWeight: FontWeight.w600,
                            color: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            height: 1,
                            package: "stoxy_screens_app_package",
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
                      ),
                      SizedBox(height: 40.setHeight),
                      InkWell(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Languages.of(context).txtDidntReceiveOtp,
                                  style: TextStyle(
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColor.of(context).txtBlack,
                                    letterSpacing: 0.5,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtResendOtp,
                                  style: TextStyle(
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: CustomAppColor.of(context).primary,
                                    letterSpacing: 0.5,
                                    fontFamily: Constant.fontFamily,
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
                          text: Languages.of(context).txtVerify,
                          mTop: 50.setHeight,
                          mBottom: 30.setHeight,
                          mLeft: 20.setWidth,
                          mRight: 20.setWidth,
                          gradient: CustomAppColor.of(context).primaryGradient,
                          onTap: () {
                            if (widget.isFromSignIn) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupScreen()));
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
                            }
                          },
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
