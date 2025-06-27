import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../login/views/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, isShowBack: true),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 61.setHeight),
                    CommonText(
                      text: Languages.of(context).txtForgotPassword,
                      fontSize: 30.setFontSize,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 2.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                      child: CommonText(
                        text: Languages.of(context).txtForgotPasswordDesc,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w300,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 47.setHeight),
                    TextFormFieldsView(),
                    SizedBox(height: 47.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtSubmit.toUpperCase(),
                        onTap: () => Navigator.push(context, LoginScreen.route()),
                      ),
                    ),
                  ],
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
      ],
    );
  }
}
