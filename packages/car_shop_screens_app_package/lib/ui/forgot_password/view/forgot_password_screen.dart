import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../verify_otp/view/verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
  }

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: "",
              isShowBack: true,
            ),
            SizedBox(height: 20.setHeight),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.setHeight,
                      width: double.infinity,
                      child: Image.asset(AppAssets.imgForgotPassword, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20.setHeight),
                    Padding(
                      padding: EdgeInsets.only(right: 100.setWidth),
                      child: CommonText(
                        text: Languages.of(context).txtForgotPassword.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsumShort,
                      textAlign: TextAlign.start,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 40.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      labelText: Languages.of(context).txtEmail.toUpperCase(),
                    ),
                    SizedBox(height: 30.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtContinue,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyOtpScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
