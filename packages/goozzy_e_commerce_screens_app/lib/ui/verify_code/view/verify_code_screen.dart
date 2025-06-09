import 'package:flutter/material.dart';

import '../../../../../widgets/button/common_button.dart';
import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_digit_textformfield.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const VerifyCodeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
        child: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(61)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    AppAssets.icLeftArrow,
                    width: AppSizes.setWidth(20),
                    height: AppSizes.setHeight(20),
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.imgAppLogo,
              width: AppSizes.setWidth(80),
              height: AppSizes.setHeight(80),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
              child: CommonText(
                text: Languages.of(context).verifyCode,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.setHeight(40), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
              child: CommonText(
                text: Languages.of(context).enterYourVerificationCode,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ),
            Image.asset(
              AppAssets.imgVerifyCode,
              height: AppSizes.setHeight(195),
              width: AppSizes.setWidth(200),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(29)),
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
                    padding: EdgeInsets.only(left: AppSizes.setWidth(20)),
                    child: SizedBox(
                      width: AppSizes.setWidth(58),
                      height: AppSizes.setHeight(60),
                      child: SingleDigitTextField(
                        controller: TextEditingController(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.setWidth(20)),
                    child: SizedBox(
                      width: AppSizes.setWidth(58),
                      height: AppSizes.setHeight(60),
                      child: SingleDigitTextField(
                        controller: TextEditingController(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.setWidth(20)),
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
              padding: EdgeInsets.only(bottom: AppSizes.setHeight(29), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
              child: CommonText(
                text: Languages.of(context).didntReceiveTheCode,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.setHeight(29), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
              child: CommonText(
                text: Languages.of(context).resendOtp,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(16),
                textColor: CustomAppColor.of(context).txtPurple,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
                child: CommonButton(
                  onTap: () async {
                    await dialogCongratulation(context);
                  },
                  btnText: Languages.of(context).verifyCode,
                )),
          ],
        ),
      ),
    );
  }

  Future dialogCongratulation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            Navigator.pop(context);
            // Navigator.push(context, LoginToYourAccountScreen.route());
          }
        });
        return CommonDialog(
          icon: Image.asset(
            AppAssets.imgCongratulation,
            width: AppSizes.setWidth(120),
            height: AppSizes.setHeight(120),
          ),
          titleText: CommonText(
            text: Languages.of(context).congratulation,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(24),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
          descriptionText: CommonText(
            text: Languages.of(context).yourAccountIsReady,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(14),
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          showLoader: true,
        );
      },
    );
  }
}
