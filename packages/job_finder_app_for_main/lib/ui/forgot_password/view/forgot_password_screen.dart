import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../enter_4_digit_code/view/enter_4_digit_code_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements TopBarClickListener {
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
              text: "${Languages.of(context).txtForgot} ",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
            CommonText(
              text: "${Languages.of(context).txtPassword}?",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtForgotPasswordDesc,
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
          AppAssets.imgPlaceHolderForgotPass,
          height: 180.setHeight,
          width: 180.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 50.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourEmail,
          prefixIcon: AppAssets.icEmail,
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
          text: Languages.of(context).txtSendCode,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, Enter4DigitCodeScreen.route());
          },
        ),
      ),
    );
  }
}
