import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:cinemix_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:cinemix_screens_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/animated_image_row/animated_image_row.dart';
import '../../../widgets/button/common_button.dart';

class LoginScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final imageLists = [
    [
      AppAssets.imgGetStarted1,
      AppAssets.imgGetStarted2,
      AppAssets.imgGetStarted3,
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
    ],
    [
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
      AppAssets.imgGetStarted7,
      AppAssets.imgGetStarted8,
      AppAssets.imgGetStarted9,
    ],
  ];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Positioned(
            top: -110.setHeight,
            left: -92.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(imageLists.length, (i) {
                return AnimatedImageRow(
                  images: imageLists[i],
                  reverse: i.isOdd,
                );
              }),
            ),
          ),
          Positioned(
            top: 50.setHeight,
            left: 20.setWidth,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 70.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.05),
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.8),
                    CustomAppColor.of(context).bgLinearShadow,
                    CustomAppColor.of(context).bgLinearShadow,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.2, 0.3, 0.9],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 70.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLoginToYourAccount,
                    textAlign: TextAlign.center,
                    fontSize: 32.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplayBold700,
                    letterSpacing: 1.1,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtEnterYourLoginInformation,
                    textAlign: TextAlign.center,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskMedium500,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: emailController,
                    hintText: Languages.of(context).txtEnterYourEmail,
                    prefixIcon: AppAssets.icMail,
                    titleText: Languages.of(context).txtEmail,
                  ),
                  SizedBox(height: 15.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isPasswordVisible,
                    builder: (context, value, child) {
                      return CommonTextFormFieldWithPrefixAndSuffix(
                        controller: passwordController,
                        hintText: Languages.of(context).txtEnterYourPassword,
                        titleText: Languages.of(context).txtPassword,
                        prefixIcon: AppAssets.icKey,
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
                  SizedBox(height: 50.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtLogin.toUpperCase(),
                      buttonTextColor: CustomAppColor.of(context).white,
                      onTap: () => Navigator.push(context, ProfileSetupScreen.route()),
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, ForgotPasswordScreen.route()),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CommonText(
                          text: Languages.of(context).txtForgotPassword,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtDontHaveAnAccount,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplayRegular400,
                      ),
                      SizedBox(width: 5.setWidth),
                      IgnorePointer(
                        ignoring: true,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, SignUpScreen.route()),
                          child: CommonText(
                            text: Languages.of(context).txtCreateAnAccount,
                            textColor: CustomAppColor.of(context).primary,
                            fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
