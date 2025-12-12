import 'package:flutter/material.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/alert_dialog/reset_password_success_dialog.dart';
import 'package:mivi_app/widgets/button/common_button.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/text_field/text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
  }

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWhiteBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 92.setHeight),
                Image.asset(
                  AppAssets.icAppIcon,
                  height: 57.setHeight,
                  width: 65.setWidth,
                ),
                SizedBox(height: 40.setHeight),
                CommonText(
                  text: Languages.of(context).txtResetPassword,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 30.setFontSize,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: newPasswordController,
                  hintText: Languages.of(context).txtEnterYourNewPassword,
                  titleText: Languages.of(context).txtNewPassword,
                ),
                SizedBox(height: 20.setHeight),
                CommonTextFormField(
                  controller: confirmPasswordController,
                  hintText: Languages.of(context).txtConfirmPassword,
                  titleText: Languages.of(context).txtConfirmNewPassword,
                ),
                SizedBox(height: 30.setHeight),
                CommonButton(
                  text: Languages.of(context).txtResetPassword,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return ResetPasswordSuccessDialog(parentContext: context);
                      },
                    );
                  },
                ),
                SizedBox(height: 15.setHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
