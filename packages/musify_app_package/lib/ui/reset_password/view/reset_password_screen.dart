import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/login/view/login_screen.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';

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
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(text: "123456");
  final TextEditingController confirmPasswordController = TextEditingController(text: "123456");

  final ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  final ValueNotifier<bool> isShowConfirmPassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: Languages.of(context).txtResetPassword.toUpperCase(),
                          textAlign: TextAlign.start,
                          fontSize: 28.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        maxLines: 2,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 20.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isShowPassword,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterYourPassword,
                            titleText: Languages.of(context).txtNewPassword,
                            prefixIcon: AppAssets.icPasswordKey,
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
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: confirmPasswordController,
                            hintText: Languages.of(context).txtEnterYourConfirmPassword,
                            titleText: Languages.of(context).txtConfirmPassword,
                            prefixIcon: AppAssets.icPasswordKey,
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
                      CommonButton(
                        text: Languages.of(context).txtResetPassword,
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
                            builder: (context) => CongratulationsDialog(
                              title: Languages.of(context).txtCongratulations,
                              message: Languages.of(context).txtLoremIpsumShort,
                              onComplete: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
