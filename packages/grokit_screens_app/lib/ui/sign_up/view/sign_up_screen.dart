import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/signin/view/sign_in_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(true);

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
                  SizedBox(height: 45.setHeight),
                  CommonText(
                    text: Languages.of(context).txtSignUp,
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
                padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 30.setHeight),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtEnterYourPersonalInformationCreateYourAccountToGetStarted,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: nameController,
                        hintText: Languages.of(context).txtEnterFullName,
                        prefixIcon: AppAssets.icUser,
                        titleText: Languages.of(context).txtFullName,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: phoneNumberController,
                        hintText: Languages.of(context).txtEnterYourPhoneNumber,
                        prefixIcon: AppAssets.icCall,
                        titleText: Languages.of(context).txtPhoneNumber,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: emailController,
                        hintText: Languages.of(context).txtEnterEmailAddress,
                        prefixIcon: AppAssets.icEmail,
                        titleText: Languages.of(context).txtEmailAddress,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isPasswordVisible,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterPassword,
                            titleText: Languages.of(context).txtPassword,
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
                            controller: confirmPasswordController,
                            hintText: Languages.of(context).txtEnterConfirmPassword,
                            titleText: Languages.of(context).txtConfirmPassword,
                            prefixIcon: AppAssets.icPassword,
                            obscureText: value,
                            suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
                            onSuffixClick: () {
                              isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            fillColor: const WidgetStatePropertyAll(Colors.green),
                          ),
                          CommonText(
                            text: Languages.of(context).txtRememberMe,
                            fontFamily: Constant.fontFamilyMedium500,
                            fontSize: 13.setFontSize,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtSignUp,
                          onTap: () => Navigator.push(context, SignInScreen.route()),
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      SizedBox(height: 40.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtAlreadyHaveAnAccount,
                            fontFamily: Constant.fontFamilyMedium500,
                            fontSize: 14.setFontSize,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          SizedBox(width: 5.setWidth),
                          IgnorePointer(
                            ignoring: true,
                            child: GestureDetector(
                              onTap: () => Navigator.push(context, SignInScreen.route()),
                              child: CommonText(
                                text: Languages.of(context).txtSignIn,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                                textAlign: TextAlign.center,
                                textColor: CustomAppColor.of(context).txtPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.setHeight),
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
