import 'package:flutter/material.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:grokit_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:grokit_app/ui/your_location/view/your_location_screen.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/utils/utils.dart';
import 'package:grokit_app/widgets/button/common_button.dart';
import 'package:grokit_app/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';

class SignInScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignInScreen());
  }

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.setHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 55.setHeight, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                  SizedBox(height: 45.setHeight),
                  CommonText(
                    text: Languages.of(context).txtSignIn,
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 0.setHeight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).cardBgBlackWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.07),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtAccessYourAccountToContinueWhereYouLeftOff,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 35.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: emailController,
                        hintText: Languages.of(context).txtEnterEmailAddress,
                        prefixIcon: AppAssets.icEmail,
                        titleText: Languages.of(context).txtEmailAddress,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: passwordController,
                        hintText: Languages.of(context).txtEnterPassword,
                        prefixIcon: AppAssets.icPassword,
                        titleText: Languages.of(context).txtPassword,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            fillColor: const WidgetStatePropertyAll(Colors.green),
                          ),
                          CommonText(
                            text: Languages.of(context).txtRememberMe,
                            fontFamily: Constant.fontFamilyMedium500,
                            fontSize: 13.setFontSize,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                      CommonButton(
                        text: Languages.of(context).txtSignIn,
                        onTap: () => Navigator.push(context, YourLocationScreen.route()),
                      ),
                      SizedBox(height: 20.setHeight),
                      GestureDetector(
                        onTap: () => Navigator.push(context, ForgotPasswordScreen.route()),
                        child: CommonText(
                          text: Languages.of(context).txtForgotPassword,
                          fontSize: 13.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 40.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1.setHeight,
                              color: CustomAppColor.of(context).dividerColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                            child: CommonText(
                              text: Languages.of(context).txtOrSignInWith,
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 12.setFontSize,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtGray,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1.setHeight,
                              color: CustomAppColor.of(context).dividerColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.setHeight),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomAppColor.of(context).borderPrimary,
                            width: 1.5,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.setHeight),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.icCall,
                              width: 20.setWidth,
                              height: 20.setHeight,
                              color: CustomAppColor.of(context).txtPrimary,
                            ),
                            SizedBox(width: 8.setWidth),
                            CommonText(
                              text: Languages.of(context).txtPhoneNumber,
                              fontFamily: Constant.fontFamilySemiBold600,
                              fontSize: 16.setFontSize,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtPrimary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtDontHaveAnAccount,
                            fontFamily: Constant.fontFamilyMedium500,
                            fontSize: 14.setFontSize,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          SizedBox(width: 5.setWidth),
                          GestureDetector(
                            onTap: () => Navigator.push(context, SignUpScreen.route()),
                            child: CommonText(
                              text: Languages.of(context).txtCreateAnAccount,
                              fontFamily: Constant.fontFamilySemiBold600,
                              fontSize: 14.setFontSize,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
