import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class CreateNewPinScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateNewPinScreen());
  }

  const CreateNewPinScreen({super.key});

  @override
  State<CreateNewPinScreen> createState() => _CreateNewPinScreenState();
}

class _CreateNewPinScreenState extends State<CreateNewPinScreen> implements TopBarClickListener {
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
            title: Languages.of(context).txtCreateNewPin,
            isShowBack: true,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 40.setHeight),
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
                SizedBox(height: 20.setHeight),
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
              child: CommonButton(
                  text: Languages.of(context).txtContinue,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.setWidth),
                          child: CommonDialog(
                            titleText: CommonText(
                              text: Languages.of(context).txtCongratulations,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            descriptionText: CommonText(
                              text: Languages.of(context).txtYourAccountHasBeenCreatedSuccessfullyPressContinueToStartUsingApp,
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGray,
                            ),
                            icon: Image.asset(
                              AppAssets.icGreyThumbUp,
                              height: 110.setHeight,
                            ),
                            button: GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                // Navigator.push(context, HomeScreen.route(isFromRideBooked: false));
                              },
                              child: Image.asset(
                                AppAssets.icGoToNext,
                                height: 60.setHeight,
                                width: 60.setHeight,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
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
