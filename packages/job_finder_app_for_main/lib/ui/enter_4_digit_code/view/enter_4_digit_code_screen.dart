import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/debug.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';
import '../../reset_password/view/reset_password_screen.dart';

class Enter4DigitCodeScreen extends StatefulWidget {
  const Enter4DigitCodeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Enter4DigitCodeScreen());
  }

  @override
  State<Enter4DigitCodeScreen> createState() => _Enter4DigitCodeScreenState();
}

class _Enter4DigitCodeScreenState extends State<Enter4DigitCodeScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(this, title: ""),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 10.setHeight, bottom: 50.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _TitleAndDescriptionView(),
                  SizedBox(height: 60.setHeight),
                  const _InputFieldView(),
                ],
              ),
            ),
          ),
          const _SendCodeButtonView(),
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

class _TitleAndDescriptionView extends StatelessWidget {
  const _TitleAndDescriptionView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: "${Languages.of(context).txtEnter4Digits} ",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
            CommonText(
              text: Languages.of(context).txtCode,
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtEnter4DigitsCodeDesc,
          fontWeight: FontWeight.w500,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _InputFieldView extends StatelessWidget {
  const _InputFieldView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgPlaceHolderEnterOtp,
          height: 180.setHeight,
          width: 180.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 50.setHeight),
        OTPTextField(
          context: context,
          length: 4,
          fieldStyle: FieldStyle.box,
          width: 0.screenWidth,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldWidth: 52.setHeight,
          fieldHeight: 52.setHeight,
          outlineBorderRadius: 12,
          otpFieldStyle: OtpFieldStyle(
            borderColor: CustomAppColor.of(context).black.withOpacityPercent(.08),
            enabledBorderColor: CustomAppColor.of(context).black.withOpacityPercent(.08),
            disabledBorderColor: CustomAppColor.of(context).black.withOpacityPercent(.08),
            errorBorderColor: CustomAppColor.of(context).black.withOpacityPercent(.08),
            focusBorderColor: CustomAppColor.of(context).black.withOpacityPercent(.08),
            backgroundColor: CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
          ),
          style: TextStyle(
            color: CustomAppColor.of(context).primary,
            fontSize: 25.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          onChanged: (pin) {
            Debug.printLog("onChanged Enter PIN ==>$pin");
          },
          onCompleted: (pin) {
            Debug.printLog("onCompleted Enter PIN ==>$pin");
          },
        ),
        SizedBox(height: 17.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtIfYouDidntReceiveACode,
              fontWeight: FontWeight.w400,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
              textAlign: TextAlign.end,
            ),
            CommonText(
              text: " ${Languages.of(context).txtResend}",
              fontWeight: FontWeight.w800,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimary,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}

class _SendCodeButtonView extends StatelessWidget {
  const _SendCodeButtonView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          text: Languages.of(context).txtResetNow,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, ResetPasswordScreen.route());
          },
        ),
      ),
    );
  }
}
