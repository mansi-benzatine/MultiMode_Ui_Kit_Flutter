import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/account_created/view/account_created_screen.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../widgets/common_richtext/common_richtext.dart';
import '../../../widgets/textfield/common_digit_textformfield.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const OtpVerificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(150)),
                child: CommonText(
                  text: Languages.of(context).otpVerification,
                  fontSize: AppSizes.setFontSize(35),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(25)),
                child: CommonText(
                  text: Languages.of(context).enter4DigitCodeWeHaveSentToAt,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(7)),
                child: CommonText(
                  text: AppStrings.phoneNumber,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(52)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppSizes.setWidth(58),
                      height: AppSizes.setHeight(60),
                      child: SingleDigitTextField(
                        controller: TextEditingController(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                      child: SizedBox(
                        width: AppSizes.setWidth(58),
                        height: AppSizes.setHeight(60),
                        child: SingleDigitTextField(
                          controller: TextEditingController(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                      child: SizedBox(
                        width: AppSizes.setWidth(58),
                        height: AppSizes.setHeight(60),
                        child: SingleDigitTextField(
                          controller: TextEditingController(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                      child: SizedBox(
                        width: AppSizes.setWidth(58),
                        height: AppSizes.setHeight(60),
                        child: SingleDigitTextField(
                          controller: TextEditingController(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(7)),
                child: CommonText(
                  text: Languages.of(context).didntReceiveTheCode,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(7)),
                child: CommonText(
                  text: Languages.of(context).resendOtp,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtPurple,
                  textDecoration: TextDecoration.underline,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(143)),
                child: CommonButton(
                  btnText: Languages.of(context).proceed,
                  onTap: () => Navigator.push(context, AccountCreatedScreen.route()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(39), left: AppSizes.setWidth(41), right: AppSizes.setWidth(30)),
                child: CommonText(
                  text: Languages.of(context).byContinuingYouAgreeToGoozzy,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              SizedBox(height: AppSizes.setHeight(5)),
              CommonRichText(
                firstText: Languages.of(context).termsAndCondition,
                middleText: Languages.of(context).and,
                lastText: Languages.of(context).privacyPolicy,
              )
            ],
          ),
        ),
      ),
    );
  }
}
