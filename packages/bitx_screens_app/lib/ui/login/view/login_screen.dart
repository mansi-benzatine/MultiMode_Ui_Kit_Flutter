import 'package:bitx_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/glass_container/glass_container.dart';
import 'package:bitx_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../forgot_password/view/forgot_password_screen.dart';
import '../../sign_up/view/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  ValueNotifier<bool> isRememberMeEnable = ValueNotifier(false);

  TextEditingController emailController = TextEditingController(text: "andrew15@yourdomain.com");
  TextEditingController passwordController = TextEditingController(text: "12345678");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoginToYourAccount.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 28.setHeight),
                      Expanded(
                        child: SingleChildScrollView(
                          child: GlassContainer(
                            height: 0.screenHeight,
                            width: 0.screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.setHeight),
                                CommonText(
                                  text: Languages.of(context).txtEnterYourLoginInformation,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                SizedBox(height: 25.setHeight),
                                CommonTextFormField(
                                  controller: emailController,
                                  hintText: Languages.of(context).txtEnterYourEmail,
                                  prefixIcon: AppAssets.icEmail,
                                ),
                                SizedBox(height: 20.setHeight),
                                ValueListenableBuilder(
                                  valueListenable: isShowPassword,
                                  builder: (context, value, child) {
                                    return CommonTextFormFieldWithPrefixAndSuffix(
                                      controller: passwordController,
                                      hintText: Languages.of(context).txtEnterYourPassword,
                                      prefixIcon: AppAssets.icPasswordKey,
                                      suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                                      suffixIconColor: CustomAppColor.of(context).iconTextFormFeild,
                                      obscureText: !value,
                                      keyboardType: TextInputType.visiblePassword,
                                      onSuffixClick: () {
                                        isShowPassword.value = !isShowPassword.value;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 22.setHeight),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CommonText(
                                      fontSize: 13.setFontSize,
                                      text: Languages.of(context).txtRememberMe,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    SizedBox(width: 15.setWidth),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: SizedBox(
                                        height: 22.setHeight,
                                        width: 40.setWidth,
                                        child: FlutterSwitch(
                                          activeColor: CustomAppColor.of(context).primary,
                                          inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                                          activeToggleColor: CustomAppColor.of(context).white,
                                          inactiveToggleColor: CustomAppColor.of(context).white,
                                          width: 44.setWidth,
                                          height: 22.setHeight,
                                          toggleSize: 16.0,
                                          borderRadius: 16.0,
                                          padding: 2.5,
                                          value: isRememberMeEnable.value,
                                          onToggle: (value) {
                                            setState(() {
                                              isRememberMeEnable.value = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 22.setHeight),
                                IgnorePointer(
                                  ignoring: true,
                                  child: CommonButton(
                                    text: Languages.of(context).txtLogin,
                                    onTap: () {
                                      Navigator.push(context, ProfileSetupScreen.route());
                                    },
                                  ),
                                ),
                                SizedBox(height: 15.setHeight),
                                IgnorePointer(
                                  ignoring: true,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, ForgotPasswordScreen.route());
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: CommonText(
                                        text: Languages.of(context).txtForgotPassword,
                                        textAlign: TextAlign.end,
                                        fontSize: 13.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        textColor: CustomAppColor.of(context).txtGray,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.setHeight),
                                Row(
                                  children: [
                                    SizedBox(width: 10.setWidth),
                                    Expanded(
                                      child: Divider(
                                        color: CustomAppColor.of(context).txtLightWhite,
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    CommonText(
                                      text: "${Languages.of(context).txtOr} ${Languages.of(context).txtLogin} ${Languages.of(context).txtWith}",
                                      textAlign: TextAlign.center,
                                      fontSize: 13.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtGray,
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    Expanded(
                                      child: Divider(
                                        color: CustomAppColor.of(context).txtLightWhite,
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(width: 10.setWidth),
                                  ],
                                ),
                                SizedBox(height: 30.setHeight),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: CustomAppColor.of(context).socialIconsBorder,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 10.setHeight),
                                      child: Image.asset(
                                        AppAssets.icGoogle,
                                        width: 24.setHeight,
                                        height: 24.setHeight,
                                      ),
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: CustomAppColor.of(context).socialIconsBorder,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 10.setHeight),
                                      child: Image.asset(
                                        AppAssets.icFacebook,
                                        width: 24.setHeight,
                                        height: 24.setHeight,
                                      ),
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: CustomAppColor.of(context).socialIconsBorder,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 10.setHeight),
                                      child: Image.asset(
                                        AppAssets.icApple,
                                        width: 24.setHeight,
                                        height: 24.setHeight,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.screenHeight * 0.1),
                                IgnorePointer(
                                  ignoring: true,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, SignUpScreen.route());
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
                                                fontSize: 13.setFontSize,
                                                fontWeight: FontWeight.w500,
                                                color: CustomAppColor.of(context).txtBlack,
                                                fontFamily: Constant.fontFamily,
                                                package: "bitx_screens_app",
                                              ),
                                            ),
                                            WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                            TextSpan(
                                              text: Languages.of(context).txtCreateAccount,
                                              style: TextStyle(
                                                fontSize: 14.setFontSize,
                                                fontWeight: FontWeight.w600,
                                                color: CustomAppColor.of(context).primary,
                                                package: "bitx_screens_app",
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
