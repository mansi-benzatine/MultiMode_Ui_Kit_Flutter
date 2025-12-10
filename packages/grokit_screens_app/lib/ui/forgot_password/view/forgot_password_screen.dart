import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';

import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
  }

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedContactMethod = "email";

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
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtForgotPassword.replaceAll(" ", "\n"),
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 165.setHeight,
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
                          text: Languages.of(context).txtSelectWhichContactDetailsWeUseToResetYourPassword,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 30.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContactMethod = 'email';
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomAppColor.of(context).border,
                                  width: 0.5,
                                ),
                                color: selectedContactMethod == 'email' ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).unselectedCard,
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 18.setWidth),
                              child: CommonText(
                                text: Languages.of(context).txtEmailAddress,
                                textColor: selectedContactMethod == 'email' ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.setWidth),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContactMethod = 'phone';
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomAppColor.of(context).border,
                                  width: 0.5,
                                ),
                                color: selectedContactMethod == 'phone' ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).unselectedCard,
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 18.setWidth),
                              child: CommonText(
                                text: Languages.of(context).txtPhoneNumber,
                                textColor: selectedContactMethod == 'phone' ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.setHeight),
                      Image.asset(
                        AppAssets.imgForgotPassword,
                        width: 206.setWidth,
                      ),
                      SizedBox(height: 30.setHeight),
                      if (selectedContactMethod == 'email') ...[
                        CommonTextFormFieldWithPrefix(
                          controller: emailController,
                          hintText: Languages.of(context).txtEnterEmailAddress,
                          prefixIcon: AppAssets.icEmail,
                          titleText: Languages.of(context).txtEmailAddress,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                      if (selectedContactMethod == 'phone') ...[
                        CommonTextFormFieldWithPrefix(
                          controller: phoneController,
                          hintText: Languages.of(context).txtEnterYourPhoneNumber,
                          prefixIcon: AppAssets.icCall,
                          titleText: Languages.of(context).txtPhoneNumber,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                      SizedBox(height: 30.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtContinue,
                          onTap: () {
                            Navigator.push(context, EnterOtpScreen.route(isFromLoginOrSignupScreen: false));
                          },
                        ),
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
