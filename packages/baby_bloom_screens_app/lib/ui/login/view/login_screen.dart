import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/about_you_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../sign_up/view/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgBackground,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
                appBarColor: CustomAppColor.of(context).transparent,
              ),
              SizedBox(height: 80.setHeight),
              _formFieldsView(),
            ],
          )
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

  Widget _formFieldsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtLogin,
            fontSize: 30.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 14.setHeight),
          CommonText(
            text: Languages.of(context).txtLoginDesc,
            fontSize: 14.setFontSize,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 40.setHeight),
          CommonTextFormFieldWithPrefix(
            titleText: Languages.of(context).txtEmail,
            controller: emailController,
            hintText: Languages.of(context).txtEnterYourEmail,
            prefixIcon: AppAssets.icMail,
          ),
          SizedBox(height: 24.setHeight),
          ValueListenableBuilder(
            valueListenable: isPasswordVisible,
            builder: (context, value, child) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: passwordController,
                hintText: Languages.of(context).txtEnterYourPassword,
                titleText: Languages.of(context).txtPassword,
                prefixIcon: AppAssets.icLock,
                prefixIconColor: CustomAppColor.of(context).icGray,
                suffixIconColor: CustomAppColor.of(context).icGray,
                obscureText: value,
                suffixIcon: value ? AppAssets.icEyeSlash : AppAssets.icEye,
                onSuffixClick: () {
                  isPasswordVisible.value = !isPasswordVisible.value;
                },
              );
            },
          ),
          SizedBox(height: 24.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtLogin,
              onTap: () {
                Navigator.push(context, AboutYouScreen.route());
              },
            ),
          ),
          SizedBox(height: 10.setHeight),
          Align(
            alignment: Alignment.bottomRight,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, ForgotPasswordScreen.route());
                },
                child: CommonText(
                  text: Languages.of(context).txtForgotPassword,
                  fontSize: 14.setFontSize,
                  fontFamily: Constant.fontFamilyRegular400,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.setHeight),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).dividerColor,
                  height: 35.setHeight,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: CommonText(
                  text: Languages.of(context).txtOrSignInWith,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).dividerColor,
                  height: 35.setHeight,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.icGoogle,
                height: 30.setHeight,
                width: 30.setWidth,
              ),
              SizedBox(width: 24.setWidth),
              Image.asset(
                AppAssets.icApple,
                height: 30.setHeight,
                width: 30.setWidth,
              ),
              SizedBox(width: 24.setWidth),
              Image.asset(
                AppAssets.icFacebook,
                height: 30.setHeight,
                width: 30.setWidth,
              )
            ],
          ),
          SizedBox(height: 30.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: Languages.of(context).txtDontHaveAnAccount,
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 14.setFontSize,
              ),
              SizedBox(width: 5.setWidth),
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignUpScreen.route());
                  },
                  child: CommonText(
                    text: Languages.of(context).txtSignUp,
                    textColor: CustomAppColor.of(context).secondary,
                    fontSize: 14.setFontSize,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
