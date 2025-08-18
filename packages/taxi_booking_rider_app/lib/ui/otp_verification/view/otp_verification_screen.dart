import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../account_created/view/account_created_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
        builder: (context) => const OtpVerificationScreen());
  }

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Timer? resendTimer;
  final ValueNotifier<String> _otpValue = ValueNotifier('');

  ValueNotifier<int> resendTime = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    resendTimer?.cancel();
    _otpValue.dispose();
    super.dispose();
  }

  _resendOtp() {
    if (resendTime.value > 0) {
      return;
    }

    resendTimer?.cancel();
    resendTime.value = 60;
    resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime.value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.screenHeight / 2,
                  width: 0.screenWidth,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).btnPrimary,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(80)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.setHeight),
                      Image.asset(
                        AppAssets.imgAppLogoWithName,
                        width: 120.setWidth,
                        height: 140.setHeight,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40.setHeight),
                      CommonText(
                        text: Languages.of(context).txtOtpVerification,
                        fontSize: 24.setFontSize,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).white,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 25.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: CommonText(
                          text: Languages.of(context)
                              .txtEnter4DigitCodeWeHaveSentToYourPhoneNumber,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ),
                      SizedBox(height: 9.setHeight),
                      CommonText(
                        text: "+1 12345 67890",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.setHeight),
                Container(
                  color: CustomAppColor.of(context).bgScreen,
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
                      fontWeight: FontWeight.w700,
                      color: CustomAppColor.of(context).txtBlack,
                      fontFamily: Constant.fontFamily,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: CustomAppColor.of(context).bgScreen,
                      borderColor:
                          CustomAppColor.of(context).borderTextFormField,
                      focusBorderColor: CustomAppColor.of(context).primary,
                      enabledBorderColor:
                          CustomAppColor.of(context).dividerColor,
                      disabledBorderColor:
                          CustomAppColor.of(context).dividerColor,
                      errorBorderColor: CustomAppColor.of(context).txtRed,
                    ),
                    onChanged: (value) {
                      _otpValue.value = value;
                    },
                    onCompleted: (value) {
                      _otpValue.value = value;
                    },
                  ),
                ),
                SizedBox(height: 15.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtDidntReceiveCode,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(width: 5.setWidth),
                    ValueListenableBuilder(
                      valueListenable: resendTime,
                      builder: (context, value, child) {
                        return value > 0
                            ? CommonText(
                                text:
                                    "$value ${Languages.of(context).txtSeconds}",
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor:
                                    CustomAppColor.of(context).txtPrimary,
                              )
                            : InkWell(
                                onTap: () {
                                  _resendOtp();
                                },
                                child: CommonText(
                                  text: Languages.of(context).txtResendOtp,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor:
                                      CustomAppColor.of(context).txtPrimary,
                                  textDecoration: TextDecoration.underline,
                                ),
                              );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40.setHeight),
                InkWell(
                  onTap: () {
                    Navigator.push(context, AccountCreatedScreen.route());
                  },
                  child: Image.asset(
                    AppAssets.icGoToNext,
                    width: 60.setHeight,
                    height: 60.setHeight,
                  ),
                ),
                SizedBox(height: 40.setHeight),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        height: 1.8,
                        color: CustomAppColor.of(context).txtGray,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "${Languages.of(context).txtByContinuingYouAgreeToOur} "),
                        TextSpan(
                          text: Languages.of(context).txtTermsOfService,
                          style: TextStyle(
                            color: CustomAppColor.of(context).txtPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                CustomAppColor.of(context).txtPrimary,
                            decorationThickness: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                        TextSpan(text: " ${Languages.of(context).txtAnd} "),
                        TextSpan(
                          text: "${Languages.of(context).txtPrivacyPolicy}.",
                          style: TextStyle(
                            color: CustomAppColor.of(context).txtPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                CustomAppColor.of(context).txtPrimary,
                            decorationThickness: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
