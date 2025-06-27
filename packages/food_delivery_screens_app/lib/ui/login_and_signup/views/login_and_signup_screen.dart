import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/email_sign_up/views/email_sign_up_screen.dart';
import 'package:food_delivery_screens_app_package/ui/mobile_verification_otp/views/mobile_verification_otp_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../utils/app_assets.dart';

class LoginAndSignupScreen extends StatefulWidget {
  const LoginAndSignupScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginAndSignupScreen());
  }

  @override
  State<LoginAndSignupScreen> createState() => _LoginAndSignupScreenState();
}

class _LoginAndSignupScreenState extends State<LoginAndSignupScreen> {
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.setWidth, vertical: 20.setHeight),
                  child: Image.asset(AppAssets.imgAppNameLogo),
                ),
                SizedBox(height: 50.setHeight),
                CommonText(
                  text: Languages.of(context).txtQuickLoginOrSignUp,
                  fontWeight: FontWeight.w600,
                  fontSize: 28.setFontSize,
                ),
                SizedBox(height: 65.setHeight),
                CommonTextFormField(
                  titleText: Languages.of(context).txtTenDigitMobileNumber,
                  controller: mobileNumberController,
                  hintText: Languages.of(context).txtAddMobileNumber,
                ),
                SizedBox(height: 25.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtGetOtp,
                    onTap: () => Navigator.push(context, MobileVerificationOtpScreen.route()),
                  ),
                ),
                SizedBox(height: 55.setHeight),
                CommonText(
                  text: Languages.of(context).txtOrContinueWith,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).grey,
                ),
                SizedBox(height: 22.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => Navigator.push(context, EmailSignUpScreen.route()),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.setHeight),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomAppColor.of(context).primary,
                          width: 2.setWidth,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
                            child: Image.asset(
                              AppAssets.icEmail,
                              height: 24.setHeight,
                              width: 24.setWidth,
                            ),
                          ),
                          CommonText(
                            text: Languages.of(context).txtContinueWithEmail,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.setFontSize,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginView(iconString: AppAssets.icFacebook),
                    SizedBox(width: 20.setWidth),
                    SocialLoginView(iconString: AppAssets.icGoogle),
                    SizedBox(width: 20.setWidth),
                    SocialLoginView(iconString: AppAssets.icApple),
                  ],
                ),
                SizedBox(height: 50.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtTermAndConditions,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.underline,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: Languages.of(context).txtAnd,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: Languages.of(context).txtPrivacyPolicy,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.underline,
                    ),
                  ],
                ),
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginView extends StatelessWidget {
  final String iconString;
  const SocialLoginView({super.key, required this.iconString});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomAppColor.of(context).border,
        ),
      ),
      child: Image.asset(
        iconString,
        height: 25.setHeight,
        width: 25.setWidth,
      ),
    );
  }
}
