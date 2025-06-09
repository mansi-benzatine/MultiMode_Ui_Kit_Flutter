import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/otp_verification/view/otp_verification_screen.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(63), horizontal: AppSizes.setWidth(21)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CommonText(
                  text: Languages.of(context).skip.toUpperCase(),
                  textAlign: TextAlign.end,
                  fontWeight: FontWeight.w800,
                  fontSize: AppSizes.setFontSize(18),
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.setHeight(65),
                  bottom: AppSizes.setHeight(25),
                ),
                child: CommonText(
                  text: Languages.of(context).signUp,
                  fontWeight: FontWeight.w800,
                  fontSize: AppSizes.setFontSize(35),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.setHeight(55), left: AppSizes.setWidth(10), right: AppSizes.setWidth(10)),
                child: CommonText(
                  text: Languages.of(context).pleaseEnterYourPhoneNumberWeWillSendYou4DigitCodeToVerifyYourAccount,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(15),
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CommonTextFormField(
                      isCountryLabelVisible: true,
                      isPhoneNumberField: true,
                      labelText: Languages.of(context).country,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(5)),
                  Expanded(
                    flex: 5,
                    child: CommonTextFormField(
                      labelText: Languages.of(context).phoneNumber,
                    ),
                  ),
                ],
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(35)),
                  child: CommonButton(
                    onTap: () => Navigator.push(context, OtpVerificationScreen.route()),
                    btnText: Languages.of(context).sendOtp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
