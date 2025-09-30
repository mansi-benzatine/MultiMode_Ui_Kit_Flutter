import 'package:flutter/material.dart';
import 'package:stoxy_app_package/ui/profile_setup/view/profile_setup_screen.dart';

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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

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
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.setHeight),
                      CommonText(
                        text: Languages.of(context).txtSignUp,
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
                      SizedBox(height: 30.setHeight),
                      CommonTextFormField(
                        controller: nameController,
                        hintText: Languages.of(context).txtEnterYourName,
                        prefixIcon: AppAssets.icUserName,
                        titleText: Languages.of(context).txtName,
                      ),
                      SizedBox(height: 20.setHeight),
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
                        text: Languages.of(context).txtSignUp,
                        gradient: CustomAppColor.of(context).primaryGradient,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileSetupScreen(),
                              ));
                        },
                      ),
                      SizedBox(height: 35.setHeight),
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
                      SizedBox(height: 25.setHeight),
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
                      SizedBox(height: 50.setHeight),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
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
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColor.of(context).txtBlack,
                                    fontFamily: Constant.fontFamilyMedium,
                                    package: "stoxy_app_package",
                                  ),
                                ),
                                WidgetSpan(child: SizedBox(width: 5.setWidth)),
                                TextSpan(
                                  text: Languages.of(context).txtSignIn,
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
