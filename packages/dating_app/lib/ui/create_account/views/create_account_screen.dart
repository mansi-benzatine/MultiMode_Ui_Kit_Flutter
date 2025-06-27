import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/ui/login/views/login_screen.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/constant.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/button/common_button.dart';
import 'package:dating_app_package/widgets/text_field/text_form_field.dart';
import 'package:dating_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
  }

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: "",
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 61.setHeight),
                      CommonText(
                        text: Languages.of(context).txtCreateAccount,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      SizedBox(height: 2.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtPleaseEnterYourCredentialsInTheFormBelow,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w300,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 47.setHeight),
                      const TextFormFieldsView(),
                      SizedBox(height: 47.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtSignUp.toUpperCase(),
                        onTap: () => Navigator.push(context, LoginScreen.route()),
                      ),
                      SizedBox(height: 100.setHeight),
                      CommonText(
                        text: Languages.of(context).txtAlreadyHaveAnAccount,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(height: 10.setHeight),
                      InkWell(
                        onTap: () => Navigator.push(context, LoginScreen.route()),
                        child: CommonText(
                          text: Languages.of(context).txtLoginNow.toUpperCase(),
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

class TextFormFieldsView extends StatefulWidget {
  const TextFormFieldsView({super.key});

  @override
  State<TextFormFieldsView> createState() => _TextFormFieldsViewState();
}

class _TextFormFieldsViewState extends State<TextFormFieldsView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmController = TextEditingController();

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
          isPasswordField: true,
          controller: _passwordController,
          hintText: Languages.of(context).txtEnterPassword,
          prefixIcon: AppAssets.icLock,
        ),
        SizedBox(height: 17.setHeight),
        CommonTextFormFieldWithPrefixAndSuffix(
          isPasswordField: true,
          controller: _confirmController,
          hintText: Languages.of(context).txtReEnterPassword,
          prefixIcon: AppAssets.icLock,
        ),
      ],
    );
  }
}
