import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/ui/create_account/views/create_account_screen.dart';
import 'package:dating_app_package/ui/forgot_password/views/forgot_password_screen.dart';
import 'package:dating_app_package/ui/rules/views/rules_screen.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/constant.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:dating_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, isShowBack: true),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 61.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLogin,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(height: 2.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtPleaseEnterYourCredentialsInTheFormBelow,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w300,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 47.setHeight),
                      TextFormFieldsView(),
                      SizedBox(height: 47.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtLogin.toUpperCase(),
                        onTap: () => Navigator.push(context, RulesScreen.route()),
                      ),
                      SizedBox(height: 150.setHeight),
                      CommonText(
                        text: Languages.of(context).txtDontHaveAnAccount,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(height: 10.setHeight),
                      GestureDetector(
                        onTap: () => Navigator.push(context, CreateAccountScreen.route()),
                        child: CommonText(
                          text: Languages.of(context).txtSignUp.toUpperCase(),
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtPink,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class TextFormFieldsView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextFormFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormFieldWithPrefix(
          controller: _emailController,
          hintText: Languages.of(context).txtEnterYourEmailAddress,
          prefixIcon: AppAssets.icMail,
        ),
        SizedBox(height: 17.setHeight),
        CommonTextFormFieldWithPrefixAndSuffix(
          controller: _passwordController,
          hintText: Languages.of(context).txtEnterPassword,
          prefixIcon: AppAssets.icLock,
          isPasswordField: true,
        ),
        SizedBox(height: 14.setHeight),
        InkWell(
          onTap: () => Navigator.push(context, ForgotPasswordScreen.route()),
          child: Align(
            alignment: Alignment.bottomRight,
            child: CommonText(
              text: "${Languages.of(context).txtForgotPassword} ?",
              textColor: CustomAppColor.of(context).txtPink,
            ),
          ),
        )
      ],
    );
  }
}
