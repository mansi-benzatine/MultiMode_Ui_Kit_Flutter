import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:musify_app_package/ui/sign_in_phone_number/view/sign_in_phone_number_screen.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/widgets/text_field/text_form_field.dart';

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

  TextEditingController emailController = TextEditingController(text: "stilva05@yourdomain.com");
  TextEditingController passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: Languages.of(context).txtSignIn.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 28.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        maxLines: 3,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 40.setHeight),
                      CommonTextFormField(
                        controller: emailController,
                        hintText: Languages.of(context).txtEnterYourEmail,
                        prefixIcon: AppAssets.icEmail,
                        titleText: Languages.of(context).txtEmail,
                      ),
                      SizedBox(height: 15.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isShowPassword,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterYourPassword,
                            titleText: Languages.of(context).txtPassword,
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
                      CommonButton(
                        text: Languages.of(context).txtSignIn,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupScreen()));
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
                            fontSize: 15.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.setHeight),
                      Row(
                        children: [
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: Divider(
                              color: CustomAppColor.of(context).txtGray,
                              thickness: 0.5,
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          CommonText(
                            text: "${Languages.of(context).txtOr} ${Languages.of(context).txtContinueWith}",
                            textAlign: TextAlign.center,
                            fontSize: 13.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: Divider(
                              color: CustomAppColor.of(context).txtGray,
                              thickness: 0.5,
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                        ],
                      ),
                      SizedBox(height: 30.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPhoneNumberScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomAppColor.of(context).txtGray,
                                  width: 0.5,
                                ),
                                color: CustomAppColor.of(context).containerBg,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(15.setHeight),
                              child: Image.asset(
                                AppAssets.icCall,
                                height: 18.setHeight,
                                width: 18.setWidth,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.setWidth),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CustomAppColor.of(context).txtGray,
                                width: 0.5,
                              ),
                              color: CustomAppColor.of(context).containerBg,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(12.setHeight),
                            height: 52.setHeight,
                            width: 52.setWidth,
                            child: Image.asset(
                              AppAssets.icFacebook,
                            ),
                          ),
                          SizedBox(width: 15.setWidth),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CustomAppColor.of(context).txtGray,
                                width: 0.5,
                              ),
                              color: CustomAppColor.of(context).containerBg,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(12.setHeight),
                            height: 52.setHeight,
                            width: 52.setWidth,
                            child: Image.asset(
                              AppAssets.icGoogle,
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
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColor.of(context).txtBlack,
                                    fontFamily: Constant.fontFamily,
                                    package: "musify_app_package",
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtSignUp,
                                  style: TextStyle(
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColor.of(context).txtSeeAll,
                                    fontFamily: Constant.fontFamily,
                                    package: "musify_app_package",
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
