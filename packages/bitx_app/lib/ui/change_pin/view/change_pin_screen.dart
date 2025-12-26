import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:bitx_app/widgets/otp_field/otp_field.dart';
import 'package:bitx_app/widgets/otp_field/otp_field_style.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ChangePinScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChangePinScreen());
  }

  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtChangePin,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtLoremIpsumShort,
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20.setHeight),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 25.setHeight),
                      child: OTPTextField(
                        context: context,
                        length: 4,
                        width: 0.screenWidth - 40.setWidth,
                        fieldWidth: 64.setWidth,
                        fieldHeight: 48.setHeight,
                        outlineBorderRadius: 12,
                        fieldStyle: FieldStyle.box,
                        style: TextStyle(
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColor.of(context).txtBlack,
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
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 55.setHeight,
            ),
            child: CommonButton(
              text: Languages.of(context).txtConfirm,
              onTap: () => Navigator.pop(context),
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
