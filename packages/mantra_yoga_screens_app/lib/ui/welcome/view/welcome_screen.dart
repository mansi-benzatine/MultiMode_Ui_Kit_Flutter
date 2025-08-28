import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../sign_in_and_sign_up/view/sign_in_and_sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const WelcomeScreen());
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Center(
        child: SingleChildScrollView(
          child: IgnorePointer(
            ignoring: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imgLogoOutline,
                  height: 100.setHeight,
                  width: 100.setHeight,
                  fit: BoxFit.contain,
                ),
                CommonText(
                  text: "${Languages.of(context).txtWelcome}!",
                  fontSize: 30.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 8.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: CommonText(
                    text: Languages.of(context).txtLoremIpsum,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamilyRegular400,
                    textAlign: TextAlign.center,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                SizedBox(height: 50.setHeight),
                Image.asset(
                  AppAssets.imgWelcome,
                  height: 220.setHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 60.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtSignIn,
                          onTap: () {
                            Navigator.push(context, SignInAndSignUpScreen.route(true, 0));
                          },
                          buttonColor: CustomAppColor.of(context).primary,
                          borderColor: CustomAppColor.of(context).borderColor,
                          borderWidth: 3,
                          height: 45.setHeight,
                          radius: 18,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtSignUp,
                          onTap: () {
                            Navigator.push(context, SignInAndSignUpScreen.route(false, 1));
                          },
                          buttonColor: CustomAppColor.of(context).bgScreen,
                          borderColor: CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                          borderWidth: 2,
                          height: 45.setHeight,
                          radius: 18,
                          buttonTextColor: CustomAppColor.of(context).txtDarkGray,
                          buttonTextWeight: FontWeight.w500,
                          buttonFontFamily: Constant.fontFamilyMedium500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.setHeight),
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
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
