import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_screens_app_package/ui/destination_location/view/destination_location_screen.dart';
import 'package:taxi_booking_driver_screens_app_package/ui/home/view/home_screen.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class RideOtpVerificationScreen extends StatefulWidget {
  final bool isFromCollectCashScreen;
  const RideOtpVerificationScreen({super.key, required this.isFromCollectCashScreen});

  static Route<void> route({required bool isFromCollectCashScreen}) {
    return MaterialPageRoute(builder: (context) => RideOtpVerificationScreen(isFromCollectCashScreen: isFromCollectCashScreen));
  }

  @override
  State<RideOtpVerificationScreen> createState() => _RideOtpVerificationScreenState();
}

class _RideOtpVerificationScreenState extends State<RideOtpVerificationScreen> implements TopBarClickListener {
  Timer? resendTimer;
  final ValueNotifier<String> _otpValue = ValueNotifier('');

  ValueNotifier<int> resendTime = ValueNotifier(36);

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
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
          child: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtOtpVerification,
            isShowBack: true,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
                  child: CommonText(
                    text: Languages.of(context).txtOtpVerificationDesc,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontSize: 13.setFontSize,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20.setHeight),
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
                      borderColor: CustomAppColor.of(context).borderTextFormField,
                      focusBorderColor: CustomAppColor.of(context).primary,
                      enabledBorderColor: CustomAppColor.of(context).dividerColor,
                      disabledBorderColor: CustomAppColor.of(context).dividerColor,
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
                SizedBox(height: 30.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtResendCodeIn,
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(width: 5.setWidth),
                    ValueListenableBuilder(
                      valueListenable: resendTime,
                      builder: (context, value, child) {
                        return value > 0
                            ? CommonText(
                                text: "$value ${Languages.of(context).txtSeconds}",
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtPrimary,
                              )
                            : InkWell(
                                onTap: () {
                                  _resendOtp();
                                },
                                child: CommonText(
                                  text: Languages.of(context).txtResendOtp,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtPrimary,
                                  textDecoration: TextDecoration.underline,
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: widget.isFromCollectCashScreen ? Languages.of(context).txtVerifyAndEndRide : Languages.of(context).txtVerifyAndStartRide,
                  onTap: () {
                    if (widget.isFromCollectCashScreen) {
                      Navigator.push(context, HomeScreen.route());
                    } else {
                      Navigator.push(context, DestinationLocationScreen.route());
                    }
                  },
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
