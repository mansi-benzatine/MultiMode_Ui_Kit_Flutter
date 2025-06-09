import 'package:flutter/material.dart';

import '../../../../../utils/sizer_utils.dart';
import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../login_to_your_account/view/login_to_your_account_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SingleChildScrollView(
        child: SizedBox(
          width: AppSizes.fullWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(50)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
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
                    text: Languages.of(context).createNewPassword,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.setHeight(20), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
                  child: CommonText(
                    text: Languages.of(context).enterNewPassword,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ),
                Image.asset(
                  AppAssets.imgNewPassword,
                  height: AppSizes.setHeight(195),
                  width: AppSizes.setWidth(275),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(32)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icPassword,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).password,
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icPassword,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).confirmNewPassword,
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(40), bottom: AppSizes.setHeight(30)),
                  child: CommonButton(
                    onTap: () {
                      dialogCongratulation(context);
                    },
                    btnText: Languages.of(context).updatePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogCongratulation(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
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
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushReplacement(context, LoginToYourAccountScreen.route());
      }
    });
  }
}
