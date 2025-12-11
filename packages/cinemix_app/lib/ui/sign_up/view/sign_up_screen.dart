import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/login/view/login_screen.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/animated_image_row/animated_image_row.dart';
import '../../../widgets/button/common_button.dart';

class SignUpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
  final TextEditingController fullNameController = TextEditingController();
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
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.keyboard_backspace_rounded,
                color: Colors.white,
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
                  CommonText(
                    text: Languages.of(context).txtCreateYourAccount,
                    textAlign: TextAlign.center,
                    fontSize: 32.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplayBold700,
                    letterSpacing: 1.1,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtEnterYourPersonalInformation,
                    textAlign: TextAlign.center,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskMedium500,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: fullNameController,
                    hintText: Languages.of(context).txtEnterYourFullName,
                    prefixIcon: AppAssets.icProfile,
                    titleText: Languages.of(context).txtFullName,
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
                  SizedBox(height: 30.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtSignUp.toUpperCase(),
                    buttonTextColor: CustomAppColor.of(context).white,
                    onTap: () => Navigator.push(context, LoginScreen.route()),
                  ),
                  SizedBox(height: 80.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtYouHaveAlreadyAnAccount,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplayRegular400,
                      ),
                      SizedBox(width: 5.setWidth),
                      GestureDetector(
                        onTap: () => Navigator.push(context, LoginScreen.route()),
                        child: CommonText(
                          text: Languages.of(context).txtLogin,
                          textColor: CustomAppColor.of(context).primary,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
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
