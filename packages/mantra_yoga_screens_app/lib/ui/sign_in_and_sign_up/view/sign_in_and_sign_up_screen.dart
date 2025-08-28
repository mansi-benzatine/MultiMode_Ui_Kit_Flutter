import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../dialogs/alerts/congratulation_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/forgot_password/view/forgot_password_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../profile_setup/view/profile_setup_screen.dart';

class SignInAndSignUpScreen extends StatefulWidget {
  final int currentIndex;
  const SignInAndSignUpScreen({super.key, required this.isSignIn, this.currentIndex = 0});

  final bool isSignIn;

  static Route<void> route(bool isSignIn, int currentIndex) {
    return MaterialPageRoute(
        builder: (context) => SignInAndSignUpScreen(
              isSignIn: isSignIn,
              currentIndex: currentIndex,
            ));
  }

  @override
  State<SignInAndSignUpScreen> createState() => _SignInAndSignUpScreenState();
}

class _SignInAndSignUpScreenState extends State<SignInAndSignUpScreen> implements TopBarClickListener {
  ValueNotifier<bool> isSignIn = ValueNotifier(false);
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    isSignIn.value = widget.isSignIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: "",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.imgLogoOutline,
                    height: 100.setHeight,
                    width: 100.setHeight,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isSignIn,
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: IgnorePointer(
                              ignoring: true,
                              child: CommonButton(
                                text: Languages.of(context).txtSignIn,
                                onTap: () {
                                  isSignIn.value = true;
                                },
                                buttonColor: value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                                borderColor: value ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                                borderWidth: value ? 3 : 2,
                                height: 45.setHeight,
                                radius: 18,
                                buttonTextColor: value ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                                buttonTextWeight: value ? FontWeight.w700 : FontWeight.w500,
                                buttonFontFamily: value ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.setWidth),
                          Expanded(
                            child: IgnorePointer(
                              ignoring: true,
                              child: CommonButton(
                                text: Languages.of(context).txtSignUp,
                                onTap: () {
                                  isSignIn.value = false;
                                },
                                buttonColor: value ? CustomAppColor.of(context).bgScreen : CustomAppColor.of(context).primary,
                                borderColor: value ? CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2) : CustomAppColor.of(context).borderColor,
                                borderWidth: value ? 2 : 3,
                                height: 45.setHeight,
                                radius: 18,
                                buttonTextColor: value ? CustomAppColor.of(context).txtDarkGray : CustomAppColor.of(context).txtWhite,
                                buttonTextWeight: value ? FontWeight.w500 : FontWeight.w700,
                                buttonFontFamily: Constant.fontFamilyMedium500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 35.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isSignIn,
                    builder: (context, value, child) {
                      return value ? _signInView() : _signUpView();
                    },
                  ),
                  SizedBox(height: 60.setHeight),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                          thickness: 1,
                          endIndent: 10.setWidth,
                          indent: 20.setWidth,
                        ),
                      ),
                      CommonText(
                        text: Languages.of(context).txtOrConnectWith,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                      ),
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                          thickness: 1,
                          indent: 10.setWidth,
                          endIndent: 20.setWidth,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icFacebook,
                        height: 48.setHeight,
                        width: 48.setHeight,
                      ),
                      SizedBox(width: 15.setWidth),
                      Image.asset(
                        AppAssets.icGoogle,
                        height: 48.setHeight,
                        width: 48.setHeight,
                      ),
                      SizedBox(width: 15.setWidth),
                      Image.asset(
                        AppAssets.icApple,
                        height: 48.setHeight,
                        width: 48.setHeight,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _signInView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEmail,
          prefixIcon: AppAssets.icEmail,
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: TextEditingController(),
              hintText: Languages.of(context).txtPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icPassEnable : AppAssets.icPassDisable,
              onSuffixClick: () {
                isPasswordVisible.value = !isPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 25.setHeight),
        IgnorePointer(
          ignoring: true,
          child: CommonButton(
            text: Languages.of(context).txtSignIn,
            onTap: () {
              CongratulationDialog.show(context, onTap: () {
                Navigator.push(context, ProfileSetupScreen.route());
              });
            },
            buttonColor: CustomAppColor.of(context).primary,
            borderColor: CustomAppColor.of(context).borderColor,
            borderWidth: 3,
            height: 45.setHeight,
            radius: 18,
            buttonTextColor: CustomAppColor.of(context).txtWhite,
            buttonTextWeight: FontWeight.w700,
            buttonFontFamily: Constant.fontFamilyBold700,
          ),
        ),
        SizedBox(height: 10.setHeight),
        IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.push(context, ForgotPasswordScreen.route());
            },
            child: CommonText(
              text: Languages.of(context).txtForgotPassword,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamilyRegular400,
              textColor: CustomAppColor.of(context).txtDarkGray,
            ),
          ),
        ),
      ],
    );
  }

  _signUpView() {
    return Column(
      children: [
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtUsername,
          prefixIcon: AppAssets.icUsername,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEmail,
          prefixIcon: AppAssets.icEmail,
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: TextEditingController(),
              hintText: Languages.of(context).txtPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icPassEnable : AppAssets.icPassDisable,
              onSuffixClick: () {
                isPasswordVisible.value = !isPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 25.setHeight),
        IgnorePointer(
          ignoring: true,
          child: CommonButton(
            text: Languages.of(context).txtSignUp,
            onTap: () {
              CongratulationDialog.show(context, onTap: () {
                Navigator.push(context, ProfileSetupScreen.route());
              });
            },
            buttonColor: CustomAppColor.of(context).primary,
            borderColor: CustomAppColor.of(context).borderColor,
            borderWidth: 3,
            height: 45.setHeight,
            radius: 18,
            buttonTextColor: CustomAppColor.of(context).txtWhite,
            buttonTextWeight: FontWeight.w700,
            buttonFontFamily: Constant.fontFamilyBold700,
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
