import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../verify_email/view/verify_email_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          title: CommonText(
            text: Languages.of(context).forgotPassword,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
          leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.setWidth(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.setWidth(36),
                    vertical: AppSizes.setHeight(100),
                  ),
                  child: Image.asset(
                    AppAssets.imgForgotPassword,
                    width: AppSizes.setWidth(220),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.setWidth(8)),
                  child: CommonText(
                    text: Languages.of(context).pleaseEnterYourEmail,
                    fontWeight: FontWeight.w500,
                    fontSize: AppSizes.setFontSize(16),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                  child: CommonTextFormField(
                    hintText: Languages.of(context).enterEmail,
                    leadingIcon: Image.asset(
                      AppAssets.icMsg,
                      color: CustomAppColor.of(context).icBlack,
                      scale: 4.5,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(90)),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    isShadowButton: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VerifyEmailScreen()),
                      );
                    },
                    useSimpleStyle: false,
                    btnText: Languages.of(context).continu,
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
