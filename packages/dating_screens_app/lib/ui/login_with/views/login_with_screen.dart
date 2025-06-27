import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/create_account/views/create_account_screen.dart';
import 'package:dating_screens_app_package/ui/login/views/login_screen.dart';
import 'package:dating_screens_app_package/ui/mobile_verification/views/mobile_verification_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/button/common_button.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class LoginWithScreen extends StatefulWidget {
  const LoginWithScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginWithScreen());
  }

  @override
  State<LoginWithScreen> createState() => _LoginWithScreenState();
}

class _LoginWithScreenState extends State<LoginWithScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.setHeight),
                Center(
                  child: Image.asset(
                    AppAssets.icLogoMeetMe,
                    width: 148.setWidth,
                    height: 180.setHeight,
                  ),
                ),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: Languages.of(context).txtLoginWithDesc,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtVelvet,
                ),
                SizedBox(height: 40.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    onTap: () => Navigator.push(context, CreateAccountScreen.route()),
                    text: Languages.of(context).txtSignUpWithEmail,
                    buttonTextColor: CustomAppColor.of(context).txtVelvetPink,
                    buttonColor: CustomAppColor.of(context).btnPink,
                    height: 52.setHeight,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    onTap: () => Navigator.push(context, MobileVerificationScreen.route()),
                    text: Languages.of(context).txtSignUpWithPhone,
                    buttonTextColor: CustomAppColor.of(context).txtVelvetPink,
                    buttonColor: CustomAppColor.of(context).btnPink,
                    height: 52.setHeight,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 40.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.setWidth,
                      height: 1.setHeight,
                      color: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: "OR",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(width: 5.setWidth),
                    Container(
                      width: 12.setWidth,
                      height: 1.setHeight,
                      color: CustomAppColor.of(context).txtGrey,
                    ),
                  ],
                ),
                SizedBox(height: 40.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17.setHeight, horizontal: 17.setWidth),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: CustomAppColor.of(context).textFormFieldBorder,
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.icGoogle,
                        width: 20.setWidth,
                        height: 20.setHeight,
                      ),
                    ),
                    SizedBox(width: 24.setWidth),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17.setHeight, horizontal: 17.setWidth),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: CustomAppColor.of(context).textFormFieldBorder,
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.icFacebook,
                        width: 20.setWidth,
                        height: 20.setHeight,
                      ),
                    ),
                    SizedBox(width: 24.setWidth),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17.setHeight, horizontal: 17.setWidth),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: CustomAppColor.of(context).textFormFieldBorder,
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.icApple,
                        width: 20.setWidth,
                        height: 20.setHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80.setHeight),
                CommonText(
                  text: Languages.of(context).txtAlreadyHaveAnAccount,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 2.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => Navigator.push(context, LoginScreen.route()),
                    child: CommonText(
                      text: Languages.of(context).txtLoginNow.toUpperCase(),
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtPink,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
