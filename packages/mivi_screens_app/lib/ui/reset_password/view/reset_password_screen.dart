import 'package:flutter/material.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/alert_dialog/reset_password_success_dialog.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';
import 'package:mivi_screens_app/widgets/text_field/text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final bool isShowSuccessAlert;

  static Route<void> route({bool isShowSuccessAlert = false}) {
    return MaterialPageRoute(
      builder: (_) => ResetPasswordScreen(isShowSuccessAlert: isShowSuccessAlert),
    );
  }

  const ResetPasswordScreen({super.key, this.isShowSuccessAlert = false});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isShowSuccessAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const ResetPasswordSuccessDialog(),
            );
          },
        );
      });
    }
  }

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
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtResetPassword,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ResetPasswordSuccessDialog();
                        },
                      );
                    },
                  ),
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
