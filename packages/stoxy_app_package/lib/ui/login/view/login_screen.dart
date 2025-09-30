import 'package:flutter/material.dart';
import 'package:stoxy_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/text_field/text_form_field.dart';

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

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPassword = ValueNotifier(false);

  TextEditingController emailController = TextEditingController(text: "andrew15@yourdomain.com");
  TextEditingController passwordController = TextEditingController(text: "12345678");

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
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.setHeight),
                      CommonText(
                        text: Languages.of(context).txtSignIn,
                        textAlign: TextAlign.start,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDescriptionGray,
                      ),
                      SizedBox(height: 40.setHeight),
                      CommonTextFormField(
                        controller: emailController,
                        hintText: Languages.of(context).txtEnterYourEmail,
                        prefixIcon: AppAssets.icEmail,
                        titleText: Languages.of(context).txtEmail,
                      ),
                      SizedBox(height: 20.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isShowPassword,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterYourPassword,
                            titleText: Languages.of(context).txtPassword,
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
                      SizedBox(height: 30.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtSignIn,
                        gradient: CustomAppColor.of(context).primaryGradient,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
                          );
                        },
                      ),
                      SizedBox(height: 15.setHeight),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CommonText(
                            text: Languages.of(context).txtForgotPassword,
                            textAlign: TextAlign.end,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamily,
                            textColor: CustomAppColor.of(context).txtBlack,
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
                            text: "${Languages.of(context).txtOr} ${Languages.of(context).txtSignIn} ${Languages.of(context).txtWith}",
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
                          SizedBox(
                            height: 32.setHeight,
                            width: 32.setWidth,
                            child: Image.asset(
                              AppAssets.icGoogle,
                            ),
                          ),
                          SizedBox(width: 25.setWidth),
                          SizedBox(
                            height: 32.setHeight,
                            width: 32.setWidth,
                            child: Image.asset(
                              AppAssets.icFacebook,
                            ),
                          ),
                          SizedBox(width: 25.setWidth),
                          SizedBox(
                            height: 32.setHeight,
                            width: 32.setWidth,
                            child: Image.asset(
                              AppAssets.icApple,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.screenHeight * 0.1),
                      InkWell(
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
                                    fontSize: 13.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: CustomAppColor.of(context).txtBlack,
                                    fontFamily: Constant.fontFamilyMedium,
                                    package: "stoxy_app_package",
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtCreateAccount,
                                  style: TextStyle(
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColor.of(context).primary,
                                    fontFamily: Constant.fontFamily,
                                    package: "stoxy_app_package",
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
