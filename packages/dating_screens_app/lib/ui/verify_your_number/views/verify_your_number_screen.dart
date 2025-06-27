import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/ui/rules/views/rules_screen.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class VerifyYourNumberScreen extends StatefulWidget {
  const VerifyYourNumberScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const VerifyYourNumberScreen());
  }

  @override
  State<VerifyYourNumberScreen> createState() => _VerifyYourNumberScreenState();
}

class _VerifyYourNumberScreenState extends State<VerifyYourNumberScreen> implements TopBarClickListener {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, isShowBack: true),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 61.setHeight),
                      CommonText(
                        text: Languages.of(context).txtVerifyYourNumber,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtVerifyYourNumberDesc,
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 47.setHeight),
                      OTPTextField(
                        context: context,
                        length: 6,
                        width: 0.screenWidth,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 47.setHeight,
                        fieldHeight: 58.setHeight,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: CustomAppColor.of(context).textFormFieldBorder,
                          enabledBorderColor: CustomAppColor.of(context).textFormFieldBorder,
                          disabledBorderColor: CustomAppColor.of(context).textFormFieldBorder,
                          errorBorderColor: CustomAppColor.of(context).textFormFieldBorder,
                          focusBorderColor: CustomAppColor.of(context).textFormFieldBorder,
                          backgroundColor: CustomAppColor.of(context).bgTextFormField,
                          borderRadius: 100,
                        ),
                        style: TextStyle(
                          color: CustomAppColor.of(context).txtBlackPink,
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
                      SizedBox(height: 50.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtVerify.toUpperCase(),
                          onTap: () => Navigator.push(context, RulesScreen.route()),
                        ),
                      ),
                      SizedBox(height: 77.setHeight),
                      CommonText(
                        text: Languages.of(context).txtDontReceiveOTP,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(height: 2.setHeight),
                      CommonText(
                        text: Languages.of(context).txtResentOTP.toUpperCase(),
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtPink,
                      )
                    ],
                  ),
                ),
              ),
            )
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
