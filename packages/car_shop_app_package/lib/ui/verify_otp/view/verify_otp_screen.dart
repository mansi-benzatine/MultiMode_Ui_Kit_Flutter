import 'package:car_shop_app_package/utils/sizer_utils.dart';
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
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
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
                padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250.setHeight,
                      width: double.infinity,
                      child: Image.asset(AppAssets.imgResetPassword, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20.setHeight),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: Languages.of(context).txtEnterOtp.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsumShort,
                      textAlign: TextAlign.start,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 60.setHeight),
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
                          color: CustomAppColor.of(context).primary,
                          fontFamily: Constant.fontFamily,
                          height: 1,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceBetween,
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor: CustomAppColor.of(context).bgScreen,
                          borderColor: CustomAppColor.of(context).primary,
                          focusBorderColor: CustomAppColor.of(context).primary,
                          enabledBorderColor: CustomAppColor.of(context).txtGray,
                          disabledBorderColor: CustomAppColor.of(context).txtGray,
                          errorBorderColor: CustomAppColor.of(context).txtRed,
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
                    CommonButton(
                      text: Languages.of(context).txtVerify,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
                      },
                    ),
                    SizedBox(height: 60.setHeight),
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
                                  color: CustomAppColor.of(context).txtGray,
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
                                  color: CustomAppColor.of(context).txtSeeAll,
                                  letterSpacing: 0.5,
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
          ],
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
