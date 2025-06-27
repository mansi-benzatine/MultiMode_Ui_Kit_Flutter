import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/ui/set_delivery_location/views/set_delivery_location_screen.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../login_and_signup/views/login_and_signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.setHeight, horizontal: 24.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 40.setHeight),
                  Align(
                    alignment: Alignment.center,
                    child: CommonText(
                      text: Languages.of(context).txtLogin,
                      fontSize: 30.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    child: Align(
                      alignment: Alignment.center,
                      child: CommonText(
                        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.setHeight),
                  CommonTextFormField(
                    controller: emailController,
                    hintText: Languages.of(context).txtEnterYourEmail,
                    titleText: Languages.of(context).txtEmail,
                  ),
                  SizedBox(height: 17.setHeight),
                  CommonTextFormField(
                    controller: passwordController,
                    hintText: Languages.of(context).txtEnterPassword,
                    titleText: Languages.of(context).txtPassword,
                  ),
                  SizedBox(height: 30.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtContinue.toUpperCase(),
                      onTap: () => Navigator.push(context, SetDeliveryLocationScreen.route()),
                    ),
                  ),
                  SizedBox(height: 40.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                    child: Align(
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtOrContinueWith,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginView(iconString: AppAssets.icFacebook),
                        SizedBox(width: 20.setWidth),
                        SocialLoginView(iconString: AppAssets.icGoogle),
                        SizedBox(width: 20.setWidth),
                        SocialLoginView(iconString: AppAssets.icApple),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtDontHaveAnAccount,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 8.setWidth),
                      IgnorePointer(
                        ignoring: true,
                        child: InkWell(
                          onTap: () => Navigator.push(context, LoginAndSignupScreen.route()),
                          child: CommonText(
                            text: Languages.of(context).txtSignUp,
                            textColor: CustomAppColor.of(context).primary,
                            textDecoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.setHeight),
                ],
              ),
            ),
          )),
    );
  }
}
