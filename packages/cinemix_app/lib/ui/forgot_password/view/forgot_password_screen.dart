import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/otp_verification/view/otp_verification_screen.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/animated_image_row/animated_image_row.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
  }

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtForgotPassword,
                      textAlign: TextAlign.center,
                      fontSize: 32.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplayBold700,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtSelectWhichContactDetailsWeUseToResetYourPassword,
                      textAlign: TextAlign.center,
                      fontSize: 14.setFontSize,
                      fontFamily: Constant.fontFamilyClashGroteskMedium500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  SizedBox(height: 25.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: emailController,
                    hintText: Languages.of(context).txtEnterYourEmail,
                    prefixIcon: AppAssets.icMail,
                    titleText: Languages.of(context).txtEmail,
                  ),
                  SizedBox(height: 280.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtContinue.toUpperCase(),
                    buttonTextColor: CustomAppColor.of(context).white,
                    onTap: () => Navigator.push(context, OtpVerificationScreen.route()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
