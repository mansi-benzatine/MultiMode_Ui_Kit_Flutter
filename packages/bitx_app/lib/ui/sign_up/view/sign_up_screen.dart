import 'package:bitx_app/ui/login/view/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/glass_container/glass_container.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const SignUpScreen());
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController(text: "andrew15@yourdomain.com");
  final TextEditingController passwordController = TextEditingController(text: "12345678");
  final TextEditingController confirmPasswordController = TextEditingController(text: "12345678");
  final TextEditingController nameController = TextEditingController(text: "Andrew Oliver");

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
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtCreateAccount.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 32.setFontSize,
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
                                  text: Languages.of(context).txtEnterYourPersonalInformation,
                                  textAlign: TextAlign.center,
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                SizedBox(height: 30.setHeight),
                                CommonTextFormField(
                                  controller: nameController,
                                  hintText: Languages.of(context).txtEnterYourName,
                                  prefixIcon: AppAssets.icBottomProfile,
                                ),
                                SizedBox(height: 20.setHeight),
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
                                CommonButton(
                                  text: Languages.of(context).txtSignUp,
                                  onTap: () {
                                    Navigator.push(context, LoginScreen.route());
                                  },
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
                                      text: "${Languages.of(context).txtOr} ${Languages.of(context).txtSignUp} ${Languages.of(context).txtWith}",
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, LoginScreen.route());
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
                                              fontSize: 13.setFontSize,
                                              fontWeight: FontWeight.w500,
                                              color: CustomAppColor.of(context).txtBlack,
                                              fontFamily: Constant.fontFamily,
                                              package: "bitx_app",
                                            ),
                                          ),
                                          WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                          TextSpan(
                                            text: Languages.of(context).txtSignInNow,
                                            style: TextStyle(
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              color: CustomAppColor.of(context).primary,
                                              package: "bitx_app",
                                              fontFamily: Constant.fontFamily,
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
