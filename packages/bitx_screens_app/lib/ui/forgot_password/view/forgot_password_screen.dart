import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/glass_container/glass_container.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../verify_otp/view/verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController(text: "andrew15@yourdomain.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSignUpBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 10.setHeight),
                      Padding(
                        padding: EdgeInsets.only(right: 25.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtForgotPassword.toUpperCase(),
                          textAlign: TextAlign.start,
                          fontSize: 32.setFontSize,
                          fontWeight: FontWeight.w800,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 28.setHeight),
                      Expanded(
                        child: SingleChildScrollView(
                          child: GlassContainer(
                            height: 0.screenHeight,
                            width: 0.screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.setHeight),
                                CommonText(
                                  text: Languages.of(context).txtEnterYourEmail,
                                  textAlign: TextAlign.center,
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                SizedBox(height: 25.setHeight),
                                CommonTextFormField(
                                  controller: emailController,
                                  hintText: Languages.of(context).txtEnterYourEmail,
                                  prefixIcon: AppAssets.icEmail,
                                ),
                                SizedBox(height: 25.setHeight),
                                IgnorePointer(
                                  ignoring: true,
                                  child: CommonButton(
                                    text: Languages.of(context).txtContinue,
                                    onTap: () {
                                      Navigator.push(context, VerifyOtpScreen.route(isFromSignIn: false));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
