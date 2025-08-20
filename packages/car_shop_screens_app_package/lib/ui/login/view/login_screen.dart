import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../forgot_password/view/forgot_password_screen.dart';
import '../../sign_up/view/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPassword = ValueNotifier(false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      child: Image.asset(
                        AppAssets.imgTopLogin,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoginwithExclamation.toUpperCase(),
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
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtLogin,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(selectedIndex: 0),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CommonText(
                            text: Languages.of(context).txtForgotPassword,
                            textAlign: TextAlign.end,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Languages.of(context).txtDontHaveAnAccount,
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
                                  text: Languages.of(context).txtSignUpNow,
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
