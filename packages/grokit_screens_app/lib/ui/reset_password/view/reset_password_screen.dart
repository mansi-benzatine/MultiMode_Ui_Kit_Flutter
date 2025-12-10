import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/alert_dialog/reset_password_success_dialog.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowSuccessAlert) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
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
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.setHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 55.setHeight, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtResetPassword.replaceAll(" ", "\n"),
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 0.setHeight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).cardBgBlackWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.07),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonText(
                        text: Languages.of(context).txtResetYourPasswordInAFewSimpleStepsToContinueUsingYourAccount,
                        fontFamily: Constant.fontFamilyMedium500,
                        fontSize: 14.setFontSize,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 20.setHeight),
                      Image.asset(
                        AppAssets.imgResetPassword,
                        width: 206.setWidth,
                      ),
                      SizedBox(height: 30.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isPasswordVisible,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterNewPassword,
                            titleText: Languages.of(context).txtNewPassword,
                            prefixIcon: AppAssets.icPassword,
                            obscureText: value,
                            suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
                            onSuffixClick: () {
                              isPasswordVisible.value = !isPasswordVisible.value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isConfirmPasswordVisible,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: confirmController,
                            hintText: Languages.of(context).txtEnterConfirmPassword,
                            titleText: Languages.of(context).txtConfirmNewPassword,
                            prefixIcon: AppAssets.icPassword,
                            obscureText: value,
                            suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
                            onSuffixClick: () {
                              isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 30.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                            text: Languages.of(context).txtResetPassword.replaceAll("Password", ""),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => const ResetPasswordSuccessDialog(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
