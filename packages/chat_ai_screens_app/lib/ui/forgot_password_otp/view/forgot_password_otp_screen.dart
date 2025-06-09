import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../reset_password/view/reset_password_screen.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ForgotPasswordOtpScreen());
  }

  @override
  State<ForgotPasswordOtpScreen> createState() => _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset(
                        AppAssets.icBack,
                        width: 24.setHeight,
                        height: 24.setHeight,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                  child: const _ForgotPasswordOtpView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordOtpView extends StatelessWidget {
  const _ForgotPasswordOtpView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.icAiText,
          width: 60.setHeight,
          height: 47.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 50.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).txtEnterOTP,
              fontWeight: FontWeight.w900,
              fontSize: 35.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              fontWeight: FontWeight.w500,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtBlackAndGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 25.setHeight),
            OTPTextField(
              context: context,
              length: 4,
              fieldStyle: FieldStyle.underline,
              width: 0.screenWidth,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 60.setHeight,
              fieldHeight: 52.setHeight,
              outlineBorderRadius: 0,
              otpFieldStyle: OtpFieldStyle(
                borderColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(.3),
                enabledBorderColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(.3),
                disabledBorderColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(.3),
                errorBorderColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(.3),
                focusBorderColor: CustomAppColor.of(context).primary,
                backgroundColor: CustomAppColor.of(context).transparent,
              ),
              style: TextStyle(
                  color: CustomAppColor.of(context).primary,
                  fontSize: 32.setFontSize,
                  fontWeight: FontWeight.w800,
                  fontFamily: Constant.fontFamily,
                  height: 1),
              onChanged: (pin) {
                Debug.printLog("onChanged Enter PIN ==>$pin");
              },
              onCompleted: (pin) {
                Debug.printLog("onCompleted Enter PIN ==>$pin");
              },
            ),
            SizedBox(height: 30.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "${Languages.of(context).txtResendCodeIn} ",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                  textAlign: TextAlign.start,
                ),
                InkWell(
                  onTap: () {},
                  child: CommonText(
                    text: "45 s",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.setFontSize,
                    textColor: CustomAppColor.of(context).primary,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  Navigator.push(context, ResetPasswordScreen.route());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
