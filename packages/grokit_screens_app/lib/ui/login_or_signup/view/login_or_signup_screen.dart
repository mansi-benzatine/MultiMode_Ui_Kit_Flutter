import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:grokit_screens_app/ui/signin/view/sign_in_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

class LoginOrSignupScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginOrSignupScreen());
  }

  const LoginOrSignupScreen({super.key});

  @override
  State<LoginOrSignupScreen> createState() => _LoginOrSignupScreenState();
}

class _LoginOrSignupScreenState extends State<LoginOrSignupScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              width: double.infinity,
              height: 200.setHeight,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.setHeight, left: 20.setWidth),
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
                  SizedBox(height: 18.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLoginOrSignUp,
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
                        controller: phoneController,
                        hintText: Languages.of(context).txtEnterYourPhoneNumber,
                        prefixIcon: AppAssets.icCall,
                        titleText: Languages.of(context).txtPhoneNumber,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtContinue,
                          onTap: () => Navigator.push(context, EnterOtpScreen.route(isFromLoginOrSignupScreen: true)),
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomAppColor.of(context).dividerColor,
                                ),
                              ),
                              padding: const EdgeInsets.all(9),
                              child: Image.asset(
                                AppAssets.icSimpleGoogle,
                                height: 22.setHeight,
                                width: 22.setWidth,
                              ),
                            ),
                            SizedBox(width: 19.setWidth),
                            IgnorePointer(
                              ignoring: true,
                              child: GestureDetector(
                                onTap: () => Navigator.push(context, SignInScreen.route()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: CustomAppColor.of(context).dividerColor,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    AppAssets.icEmail,
                                    color: CustomAppColor.of(context).txtBlack,
                                    height: 22.setHeight,
                                    width: 20.setWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
