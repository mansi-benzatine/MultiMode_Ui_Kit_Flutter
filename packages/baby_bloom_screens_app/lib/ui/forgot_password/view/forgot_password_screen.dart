import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart' show CustomAppColor;
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgBackground,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
                appBarColor: CustomAppColor.of(context).transparent,
              ),
              SizedBox(height: 80.setHeight),
              _formFieldsView(),
            ],
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  Widget _formFieldsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtForgotPassword,
            fontSize: 30.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          SizedBox(height: 14.setHeight),
          CommonText(
            text: Languages.of(context).txtForgotPasswordDesc,
            fontSize: 14.setFontSize,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 40.setHeight),
          CommonTextFormFieldWithPrefix(
            titleText: Languages.of(context).txtEmail,
            controller: emailController,
            hintText: Languages.of(context).txtEnterYourEmail,
            prefixIcon: AppAssets.icMail,
          ),
          SizedBox(height: 24.setHeight),
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
    );
  }
}
