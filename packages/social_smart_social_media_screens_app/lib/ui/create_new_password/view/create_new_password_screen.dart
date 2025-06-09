import 'package:flutter/material.dart';

import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).transparent,
          title: CommonText(
            text: Languages.of(context).createNewPassword,
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.setWidth(24),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(60)),
                  child: Image.asset(AppAssets.imgNewPasswordBg),
                ),
                CommonText(
                  text: Languages.of(context).yourNewPasswordMustBeDiff,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(16),
                ),
                SizedBox(
                  height: AppSizes.setHeight(40),
                ),
                CommonTextFormField(
                  hintText: Languages.of(context).enterPassword,
                  isPasswordField: true,
                  leadingIcon: Image.asset(
                    AppAssets.icLock,
                    color: CustomAppColor.of(context).icBlack,
                    scale: 4.5,
                  ),
                ),
                const SizedBox(height: 16),
                CommonTextFormField(
                  hintText: Languages.of(context).enterPassword,
                  isPasswordField: true,
                  leadingIcon: Image.asset(
                    AppAssets.icLock,
                    color: CustomAppColor.of(context).icBlack,
                    scale: 4.5,
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(70)),
                CommonButton(
                  isShadowButton: true,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        Future.delayed(const Duration(seconds: 2), () {
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );*/
                        });
                        return CommonDialog(
                          titleText: CommonText(
                            text: Languages.of(context).congratulations,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.setFontSize(24),
                            textColor: CustomAppColor.of(context).txtPurple,
                          ),
                          descriptionText: CommonText(
                            text: Languages.of(context).yourAccountIsReadyToUse,
                            fontSize: AppSizes.setFontSize(14),
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          icon: Image.asset(
                            AppAssets.imgCongratulationDialogBg,
                            height: AppSizes.setHeight(180),
                          ),
                          showLoader: true,
                        );
                      },
                    );
                  },
                  useSimpleStyle: false,
                  btnText: Languages.of(context).continu,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
