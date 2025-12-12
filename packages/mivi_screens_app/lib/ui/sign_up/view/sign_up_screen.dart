import 'package:flutter/material.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/ui/sign_in/view/sign_in_screen.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';
import 'package:mivi_screens_app/widgets/text_field/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWhiteBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 92.setHeight),
                Image.asset(
                  AppAssets.icAppIcon,
                  height: 57.setHeight,
                  width: 65.setWidth,
                ),
                SizedBox(height: 40.setHeight),
                CommonText(
                  text: Languages.of(context).txtSignUp,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 30.setFontSize,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: nameController,
                  hintText: Languages.of(context).txtEnterYourName,
                  titleText: Languages.of(context).txtName,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: emailController,
                  hintText: Languages.of(context).txtEnterYourEmail,
                  titleText: Languages.of(context).txtEmail,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: passwordController,
                  hintText: Languages.of(context).txtEnterYourPassword,
                  titleText: Languages.of(context).txtPassword,
                ),
                SizedBox(height: 30.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtSignUp,
                    onTap: () {
                      Navigator.push(context, SignInScreen.route());
                    },
                  ),
                ),
                SizedBox(height: 20.setHeight),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: CustomAppColor.of(context).dividerColor,
                        height: 35.setHeight,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                      child: CommonText(
                        text: Languages.of(context).txtOrSignUpWith,
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: CustomAppColor.of(context).dividerColor,
                        height: 35.setHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CustomAppColor.of(context).border,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 30.setWidth),
                      child: Image.asset(
                        AppAssets.icGoogle,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                    ),
                    SizedBox(width: 24.setWidth),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CustomAppColor.of(context).border,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 30.setWidth),
                      child: Image.asset(
                        AppAssets.icFacebook,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                    ),
                    SizedBox(width: 24.setWidth),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CustomAppColor.of(context).border,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 30.setWidth),
                      child: Image.asset(
                        AppAssets.icApple,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 45.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtYouHaveAlreadyAnAccount,
                      fontSize: 12.setFontSize,
                    ),
                    SizedBox(width: 5.setWidth),
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, SignInScreen.route());
                        },
                        child: CommonText(
                          text: Languages.of(context).txtSignInNow,
                          textColor: CustomAppColor.of(context).secondary,
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilySemiBold600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.setHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
