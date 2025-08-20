import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../login/view/login_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';

class SignUpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  final ValueNotifier<bool> isShowConfirmPassword = ValueNotifier(false);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.setHeight,
                      width: double.infinity,
                      child: Image.asset(AppAssets.imgTopSignUp, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtSignUpwithExclamation.toUpperCase(),
                      textAlign: TextAlign.start,
                      fontSize: 30.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      labelText: Languages.of(context).txtEmail.toUpperCase(),
                    ),
                    SizedBox(height: 20.setHeight),
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
                    SizedBox(height: 20.setHeight),
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
                    SizedBox(height: 20.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtSignUp,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const YourFavBrandScreen()));
                        },
                      ),
                    ),
                    SizedBox(height: 40.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Languages.of(context).txtAlreadyHaveAnAccount,
                                  style: TextStyle(
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColor.of(context).txtGray,
                                    letterSpacing: 0.5,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtSignInNow,
                                  style: TextStyle(
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: CustomAppColor.of(context).txtSeeAll,
                                    letterSpacing: 0.5,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                ),
                              ],
                            ),
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
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
