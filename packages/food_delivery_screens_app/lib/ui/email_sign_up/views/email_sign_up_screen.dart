import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/check_your_email/views/check_your_email_screen.dart';
import 'package:food_delivery_screens_app_package/ui/login/views/login_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../utils/app_assets.dart';

class EmailSignUpScreen extends StatelessWidget {
  const EmailSignUpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const EmailSignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.setHeight, horizontal: 24.setWidth),
              child: Column(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          AppAssets.icBack,
                          width: 18.setWidth,
                          height: 15.setHeight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtSignUp,
                      fontSize: 30.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    child: CommonText(
                      text: "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                  SizedBox(height: 52.setHeight),
                  CommonTextFormField(
                    controller: userNameController,
                    hintText: Languages.of(context).txtEnterUserName,
                    titleText: Languages.of(context).txtUserName,
                  ),
                  SizedBox(height: 30.setHeight),
                  CommonTextFormField(
                    controller: emailController,
                    hintText: Languages.of(context).txtEnterYourEmail,
                    titleText: Languages.of(context).txtEmail,
                  ),
                  SizedBox(height: 30.setHeight),
                  CommonTextFormField(
                    controller: passwordController,
                    hintText: Languages.of(context).txtEnterPassword,
                    titleText: Languages.of(context).txtPassword,
                  ),
                  SizedBox(height: 53.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtContinue.toUpperCase(),
                      onTap: () => Navigator.push(context, CheckYourEmailScreen.route()),
                    ),
                  ),
                  SizedBox(height: 69.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtAlreadyHaveAnAccount,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 8.setWidth),
                      IgnorePointer(
                        ignoring: true,
                        child: InkWell(
                          onTap: () => Navigator.push(context, LoginScreen.route()),
                          child: CommonText(
                            text: Languages.of(context).txtLogin,
                            textColor: CustomAppColor.of(context).primary,
                            textDecoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
