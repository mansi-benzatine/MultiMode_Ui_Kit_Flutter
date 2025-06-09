import 'package:flutter/material.dart';

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
import '../../set_up_profile/view/set_up_profile_screen.dart';
import '../../sign_in/view/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPass = ValueNotifier<bool>(true);
  ValueNotifier<bool> isShowConfirmPass = ValueNotifier<bool>(true);

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
                  _InputFieldsView(isShowPass: isShowPass, isShowConfirmPass: isShowConfirmPass),
                  const _SignUpButtonAndSocialLoginView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.push(context, SignInScreen.route());
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
              text: "${Languages.of(context).txtCreateAn} ",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
              textAlign: TextAlign.start,
            ),
            CommonText(
              text: Languages.of(context).txtAccount,
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        CommonText(
          text: Languages.of(context).txtLetsSignUpApplyToJobs,
          fontWeight: FontWeight.w500,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _InputFieldsView extends StatelessWidget {
  final ValueNotifier<bool> isShowPass;
  final ValueNotifier<bool> isShowConfirmPass;

  const _InputFieldsView({
    required this.isShowPass,
    required this.isShowConfirmPass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYouFullName,
          prefixIcon: AppAssets.icUser,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourEmail,
          prefixIcon: AppAssets.icEmail,
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isShowPass,
          builder: (context, value, widget) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: TextEditingController(),
              hintText: Languages.of(context).txtEnterYouPassword,
              prefixIcon: AppAssets.icPass,
              obscureText: value,
              suffixIcon: value ? AppAssets.icShowPass : AppAssets.icHidePass,
              onSuffixClick: () {
                isShowPass.value = !isShowPass.value;
              },
            );
          },
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isShowConfirmPass,
          builder: (context, value, widget) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: TextEditingController(),
              hintText: Languages.of(context).txtEnterYouConfirmPassword,
              prefixIcon: AppAssets.icPass,
              obscureText: value,
              suffixIcon: value ? AppAssets.icHidePass : AppAssets.icShowPass,
              onSuffixClick: () {
                isShowConfirmPass.value = !isShowConfirmPass.value;
              },
            );
          },
        ),
        SizedBox(height: 25.setHeight),
      ],
    );
  }
}

class _SignUpButtonAndSocialLoginView extends StatelessWidget {
  const _SignUpButtonAndSocialLoginView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton(
          text: Languages.of(context).txtSignUp,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, SetUpProfileScreen.route());
          },
        ),
        SizedBox(height: 30.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: CustomAppColor.of(context).grey,
                thickness: 0.5.setHeight,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.setWidth),
              child: CommonText(
                text: Languages.of(context).txtOrContinueWith,
                fontWeight: FontWeight.w500,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Divider(
                color: CustomAppColor.of(context).grey,
                thickness: 0.5.setHeight,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.icGoogle,
              height: 100.setHeight,
              width: 100.setHeight,
              gaplessPlayback: true,
            ),
            Image.asset(
              AppAssets.icFacebook,
              height: 100.setHeight,
              width: 100.setHeight,
              gaplessPlayback: true,
            ),
            Image.asset(
              AppAssets.icApple,
              height: 100.setHeight,
              width: 100.setHeight,
              gaplessPlayback: true,
            ),
          ],
        ),
        SizedBox(height: 15.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: "${Languages.of(context).txtAlreadyHaveAnAccount}  ",
              fontWeight: FontWeight.w400,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SignInScreen.route());
              },
              child: CommonText(
                text: Languages.of(context).txtSignIn,
                fontWeight: FontWeight.w500,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtSecondary,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
