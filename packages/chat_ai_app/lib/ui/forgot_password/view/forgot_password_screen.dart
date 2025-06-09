import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../forgot_password_otp/view/forgot_password_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset(
                      AppAssets.icBack,
                      width: 24.setHeight,
                      height: 24.setHeight,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                  child: _ForgotPasswordView(
                    emailController: _emailController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  final TextEditingController emailController;

  const _ForgotPasswordView({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.icAiText,
          width: 60.setHeight,
          height: 47.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 50.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).txtForgotPassword,
              fontWeight: FontWeight.w800,
              fontSize: 35.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              fontWeight: FontWeight.w500,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtBlackAndGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 25.setHeight),
            CommonTextFormFieldWithPrefix(
              controller: emailController,
              titleText: Languages.of(context).txtEmail,
              hintText: Languages.of(context).txtEnterYourEmail,
              prefixIcon: AppAssets.icEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 50.setHeight),
            CommonButton(
              text: Languages.of(context).txtContinue,
              onTap: () {
                Navigator.push(context, ForgotPasswordOtpScreen.route());
              },
            ),
          ],
        ),
      ],
    );
  }
}
