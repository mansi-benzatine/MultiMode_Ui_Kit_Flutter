import 'package:bitx_app/ui/login/view/login_screen.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/glass_container/glass_container.dart';
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
  const ResetPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
  }

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
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSignUpBackground),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.setHeight),
                      Padding(
                        padding: EdgeInsets.only(right: 120.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtResetPassword.toUpperCase(),
                          textAlign: TextAlign.start,
                          fontSize: 30.setFontSize,
                          fontWeight: FontWeight.w800,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Expanded(
                        child: SingleChildScrollView(
                          child: GlassContainer(
                            height: 50.screenHeight,
                            width: 350.setWidth,
                            child: Column(
                              children: [
                                SizedBox(height: 10.setHeight),
                                CommonText(
                                  text: Languages.of(context).txtEnterYourPassword,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.setFontSize,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                SizedBox(height: 25.setHeight),
                                ValueListenableBuilder(
                                  valueListenable: isShowPassword,
                                  builder: (context, value, child) {
                                    return CommonTextFormFieldWithPrefixAndSuffix(
                                      controller: passwordController,
                                      hintText: Languages.of(context).txtEnterNewPassword,
                                      prefixIcon: AppAssets.icPasswordKey,
                                      suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
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
                                      hintText: Languages.of(context).txtConfirmNewPassword,
                                      prefixIcon: AppAssets.icPasswordKey,
                                      suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                                      obscureText: !value,
                                      keyboardType: TextInputType.visiblePassword,
                                      onSuffixClick: () {
                                        isShowConfirmPassword.value = !isShowConfirmPassword.value;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 35.setHeight),
                                CommonButton(
                                  text: Languages.of(context).txtContinue,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
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
