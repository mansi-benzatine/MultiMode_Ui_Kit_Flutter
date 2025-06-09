import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class CreateNewPinScreen extends StatefulWidget {
  const CreateNewPinScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateNewPinScreen());
  }

  @override
  State<CreateNewPinScreen> createState() => _CreateNewPinScreenState();
}

class _CreateNewPinScreenState extends State<CreateNewPinScreen> {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                  child: IgnorePointer(
                    ignoring: true,
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
                  child: const _CreateNewPinViewView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateNewPinViewView extends StatefulWidget {
  const _CreateNewPinViewView();

  @override
  State<_CreateNewPinViewView> createState() => _CreateNewPinViewViewState();
}

class _CreateNewPinViewViewState extends State<_CreateNewPinViewView> {
  String currentPin = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtCreateNewPin,
          fontWeight: FontWeight.w800,
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
            borderColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
            enabledBorderColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
            disabledBorderColor: CustomAppColor.of(context).primary,
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
            setState(() {
              currentPin = pin;
            });
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
        SizedBox(height: 100.setHeight),
        IgnorePointer(
          ignoring: true,
          child: CommonButton(
            text: Languages.of(context).txtContinue,
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  Future.delayed(const Duration(seconds: 2), () {
                    if (context.mounted) {
                      Navigator.pop(context);
                      // Navigator.push(context, ChatAiDashboardScreen.route());
                    }
                  });
                  return CommonDialog(
                    titleText: CommonText(
                      text: Languages.of(context).txtCongratulations,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.setFontSize,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    descriptionText: CommonText(
                      text: Languages.of(context).txtLoremIpsumDesc,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    icon: Image.asset(
                      AppAssets.icCongratulation,
                      height: 110.setHeight,
                    ),
                    showLoader: true,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
