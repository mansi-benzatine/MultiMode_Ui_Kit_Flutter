import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/alerts/congratulations_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart' show AppAssets;
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  final bool isForAlert;
  static Route<void> route({bool isForAlert = false}) {
    return MaterialPageRoute(builder: (_) => ResetPasswordScreen(isForAlert: isForAlert));
  }

  const ResetPasswordScreen({super.key, this.isForAlert = false});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  final ValueNotifier<bool> isShowConfirmPassword = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isForAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) => CongratulationsDialog(
            title: Languages.of(context).txtCongratulations,
            message: Languages.of(context).txtYourAccountIsReadyToUse,
            onComplete: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: "",
              isShowBack: true,
            ),
            SizedBox(height: 20.setHeight),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250.setHeight,
                      width: double.infinity,
                      child: Image.asset(AppAssets.imgVerifyOtp, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20.setHeight),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: Languages.of(context).txtResetPassword.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      labelText: Languages.of(context).txtEmail.toUpperCase(),
                    ),
                    SizedBox(height: 25.setHeight),
                    ValueListenableBuilder(
                      valueListenable: isShowPassword,
                      builder: (context, value, child) {
                        return CommonTextFormFieldWithSuffix(
                          controller: passwordController,
                          hintText: Languages.of(context).txtEnterYourPassword,
                          labelText: Languages.of(context).txtPassword.toUpperCase(),
                          suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                          suffixIconColor: CustomAppColor.of(context).txtBlack,
                          obscureText: !value,
                          keyboardType: TextInputType.visiblePassword,
                          onSuffixClick: () {
                            isShowPassword.value = !isShowPassword.value;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 25.setHeight),
                    ValueListenableBuilder(
                      valueListenable: isShowConfirmPassword,
                      builder: (context, value, child) {
                        return CommonTextFormFieldWithSuffix(
                          controller: confirmPasswordController,
                          hintText: Languages.of(context).txtEnterYourConfirmPassword,
                          labelText: Languages.of(context).txtConfirmPassword.toUpperCase(),
                          suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                          suffixIconColor: CustomAppColor.of(context).txtBlack,
                          obscureText: !value,
                          keyboardType: TextInputType.visiblePassword,
                          onSuffixClick: () {
                            isShowConfirmPassword.value = !isShowConfirmPassword.value;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 30.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtResetPassword,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) => CongratulationsDialog(
                              title: Languages.of(context).txtCongratulations,
                              message: Languages.of(context).txtYourAccountIsReadyToUse,
                              onComplete: () {
                                Navigator.pop(dialogContext);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
