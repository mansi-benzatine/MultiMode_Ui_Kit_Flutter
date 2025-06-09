import 'package:flutter/material.dart';

import '../../../../../../../../../ui/create_new_password/view/create_new_password_screen.dart';
import '../../../../../../../../../utils/string_constant.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_digit_textformfield.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const VerifyEmailScreen());
  }

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        title: CommonText(
          text: Languages.of(context).verifyYourEmail,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(60)),
              child: Column(
                children: [
                  CommonText(
                    text: Languages.of(context).pleaseEnterThe4DigitCode,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                  ),
                  CommonText(
                    text: AppStrings.johnDoeEmail,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(16),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: AppSizes.setWidth(75),
                  height: AppSizes.setHeight(60),
                  child: SingleDigitTextField(
                    controller: controllers[index],
                    currentFocus: focusNodes[index],
                    nextFocus: index < 3 ? focusNodes[index + 1] : null,
                  ),
                );
              }),
            ),
            SizedBox(height: AppSizes.setHeight(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(text: Languages.of(context).resendCode),
                const CommonText(
                  text: "55 ",
                  textColor: AppColor.txtPurple,
                ),
                CommonText(
                  text: "s ",
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: AppSizes.setHeight(70)),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
                  );
                },
                isShadowButton: true,
                useSimpleStyle: false,
                btnText: Languages.of(context).verify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
