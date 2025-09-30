import 'package:flutter/material.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';

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
  const ForgotPasswordScreen({super.key});

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
              SizedBox(height: 40.setHeight),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 16.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtForgotPassword,
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDescriptionGray,
                      ),
                      SizedBox(height: 30.setHeight),
                      CommonTextFormField(
                        controller: emailController,
                        hintText: Languages.of(context).txtEnterYourEmail,
                        titleText: Languages.of(context).txtEmail,
                        prefixIcon: AppAssets.icEmail,
                      ),
                      SizedBox(height: 30.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtContinue,
                        gradient: CustomAppColor.of(context).primaryGradient,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyOtpScreen(isFromSignIn: false)));
                        },
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
