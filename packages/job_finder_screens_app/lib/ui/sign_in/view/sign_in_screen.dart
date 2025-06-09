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
import '../../forgot_password/view/forgot_password_screen.dart';
import '../../set_up_profile/view/set_up_profile_screen.dart';
import '../../sign_up/view/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignInScreen());
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPass = ValueNotifier<bool>(true);
  ValueNotifier<bool> isAgree = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              title: "",
              iconColor: CustomAppColor.of(context).bgDetailsCard,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 10.setHeight, bottom: 50.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _TitleAndDescriptionView(),
                  _InputFieldsView(isShowPass: isShowPass),
                  IgnorePointer(ignoring: true, child: _SignUpButtonAndSocialLoginView(isAgree: isAgree)),
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
              text: "${Languages.of(context).txtWelcome} ",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
            CommonText(
              text: "${Languages.of(context).txtBack}!",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        CommonText(
          text: Languages.of(context).txtLetsSignInApplyToJobs,
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

  const _InputFieldsView({required this.isShowPass});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYouFullName,
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
      ],
    );
  }
}

class _SignUpButtonAndSocialLoginView extends StatelessWidget {
  final ValueNotifier<bool> isAgree;

  const _SignUpButtonAndSocialLoginView({required this.isAgree});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: isAgree,
                builder: (context, value, widget) {
                  return InkWell(
                    onTap: () {
                      isAgree.value = !isAgree.value;
                    },
                    child: Image.asset(
                      value ? AppAssets.icCheckSelected : AppAssets.icCheckUnSelected,
                      height: 22.setHeight,
                      width: 22.setHeight,
                      color: value
                          ? null
                          : (Theme.of(context).brightness == Brightness.light)
                              ? null
                              : CustomAppColor.of(context).txtWhitePrimary,
                      gaplessPlayback: true,
                    ),
                  );
                },
              ),
              SizedBox(width: 8.setWidth),
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtRememberMe,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  textAlign: TextAlign.start,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, ForgotPasswordScreen.route());
                },
                child: CommonText(
                  text: "${Languages.of(context).txtForgotPassword}?",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.setFontSize,
                  textColor: CustomAppColor.of(context).txtSecondary,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.setHeight),
        CommonButton(
          text: Languages.of(context).txtSignIn,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, SetUpProfileScreen.route());
          },
        ),
        SizedBox(height: 40.setHeight),
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
        SizedBox(height: 20.setHeight),
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
        SizedBox(height: 20.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: "${Languages.of(context).txtDontHaveAnAccount}  ",
              fontWeight: FontWeight.w400,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SignUpScreen.route());
              },
              child: CommonText(
                text: Languages.of(context).txtSignUp,
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
