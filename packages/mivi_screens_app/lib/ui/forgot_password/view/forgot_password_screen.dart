import 'package:flutter/material.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';
import 'package:mivi_screens_app/widgets/text_field/text_form_field.dart';

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
                  text: Languages.of(context).txtForgotPassword,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 30.setFontSize,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: emailController,
                  hintText: Languages.of(context).txtEnterYourEmail,
                  titleText: Languages.of(context).txtEmail,
                ),
                SizedBox(height: 20.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtContinue,
                    onTap: () {
                      Navigator.push(context, EnterOtpScreen.route());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
