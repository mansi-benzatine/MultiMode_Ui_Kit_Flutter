import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:musify_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';

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

class VerifyOtpScreen extends StatefulWidget {
  final bool isFromSignIn;
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
            image: AssetImage(AppAssets.imgCommonBackground),
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
              SizedBox(height: 20.setHeight),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 16.setHeight),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: Languages.of(context).txtEnterOtp.toUpperCase(),
                          textAlign: TextAlign.start,
                          fontSize: 28.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        maxLines: 3,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 40.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
                        child: OTPTextField(
                          context: context,
                          length: 4,
                          width: 0.screenWidth - 40.setWidth,
                          fieldWidth: 55.setWidth,
                          fieldHeight: 55.setHeight,
                          outlineBorderRadius: 1000,
                          fieldStyle: FieldStyle.box,
                          style: TextStyle(
                            fontSize: 26.setFontSize,
                            fontWeight: FontWeight.w700,
                            color: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            height: 1,
                            package: "musify_app_package",
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceBetween,
                          otpFieldStyle: OtpFieldStyle(
                            backgroundColor: CustomAppColor.of(context).transparent,
                            borderColor: CustomAppColor.of(context).primary,
                            focusBorderColor: CustomAppColor.of(context).primary,
                            enabledBorderColor: CustomAppColor.of(context).txtGray,
                            disabledBorderColor: CustomAppColor.of(context).txtGray,
                            errorBorderColor: CustomAppColor.of(context).txtRed,
                            filledBorderColor: CustomAppColor.of(context).txtBlack,
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
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColor.of(context).txtGray,
                                    fontFamily: Constant.fontFamily,
                                    package: "musify_app_package",
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtResendOtp,
                                  style: TextStyle(
                                    fontSize: 13.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColor.of(context).txtSeeAll,
                                    package: "musify_app_package",
                                    fontFamily: Constant.fontFamily,
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
              CommonButton(
                text: Languages.of(context).txtVerify,
                mBottom: 30.setHeight,
                mLeft: 20.setWidth,
                mRight: 20.setWidth,
                onTap: () {
                  if (widget.isFromSignIn) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupScreen()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
                  }
                },
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
