import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../create_profile/view/create_profile_screen.dart';
import '../../forgot_password/view/forgot_password_screen.dart';
import '../../sign_in/view/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isKeepLogin = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset(
                        AppAssets.icBack,
                        width: 24.setHeight,
                        height: 24.setHeight,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                  child: _SignInView(
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    isPasswordVisible: _isPasswordVisible,
                    isKeepLogin: _isKeepLogin,
                  ),
                ),
                SizedBox(height: 60.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "${Languages.of(context).txtYouHaveAlreadyAnAccount} ",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, SignInScreen.route());
                          },
                          child: CommonText(
                            text: Languages.of(context).txtSignInNow,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.setFontSize,
                            textColor: CustomAppColor.of(context).primary,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordVisible;
  final ValueNotifier<bool> isKeepLogin;

  const _SignInView({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.isKeepLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.icAiText,
          width: 60.setHeight,
          height: 47.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 40.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).txtSignUp,
              fontWeight: FontWeight.w800,
              fontSize: 35.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              fontWeight: FontWeight.w400,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtBlackAndGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 25.setHeight),
            CommonTextFormFieldWithPrefix(
              controller: nameController,
              titleText: Languages.of(context).txtName,
              hintText: Languages.of(context).txtEnterYourName,
              prefixIcon: AppAssets.icName,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20.setHeight),
            CommonTextFormFieldWithPrefix(
              controller: emailController,
              titleText: Languages.of(context).txtEmail,
              hintText: Languages.of(context).txtEnterYourEmail,
              prefixIcon: AppAssets.icEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.setHeight),
            ValueListenableBuilder(
              valueListenable: isPasswordVisible,
              builder: (context, value, widget) {
                return CommonTextFormFieldWithPrefixAndSuffix(
                  controller: passwordController,
                  titleText: Languages.of(context).txtPassword,
                  hintText: Languages.of(context).txtEnterYourPassword,
                  prefixIcon: AppAssets.icPassword,
                  suffixIcon: value ? AppAssets.icVisiblePassword : AppAssets.icUnVisiblePassword,
                  obscureText: value,
                  keyboardType: TextInputType.visiblePassword,
                  onSuffixClick: () => isPasswordVisible.value = !isPasswordVisible.value,
                );
              },
            ),
            SizedBox(height: 25.setHeight),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isKeepLogin,
                  builder: (context, value, widget) {
                    return InkWell(
                      onTap: () => isKeepLogin.value = !isKeepLogin.value,
                      child: Image.asset(
                        isKeepLogin.value ? AppAssets.icCheckBoxUnFill : AppAssets.icCheckBoxFill,
                        width: 18.setHeight,
                        height: 18.setHeight,
                        gaplessPlayback: true,
                      ),
                    );
                  },
                ),
                SizedBox(width: 12.setWidth),
                CommonText(
                  text: Languages.of(context).txtKeepMeLoggedIn,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 25.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtSignIn,
                onTap: () {
                  Navigator.push(context, CreateProfileScreen.route());
                },
              ),
            ),
            SizedBox(height: 10.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, ForgotPasswordScreen.route());
                    },
                    child: CommonText(
                      text: Languages.of(context).txtForgotPassword,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.setHeight),
            Row(
              children: [
                Expanded(
                  child: Divider(color: CustomAppColor.of(context).lineColor),
                ),
                SizedBox(width: 15.setWidth),
                CommonText(
                  text: Languages.of(context).txtOrSignInWith,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: Divider(color: CustomAppColor.of(context).lineColor),
                ),
              ],
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icGoogle,
                  height: 32.setHeight,
                  width: 32.setHeight,
                  gaplessPlayback: true,
                ),
                SizedBox(width: 20.setWidth),
                Image.asset(
                  AppAssets.icFacebook,
                  height: 32.setHeight,
                  width: 32.setHeight,
                  gaplessPlayback: true,
                ),
                SizedBox(width: 20.setWidth),
                Image.asset(
                  AppAssets.icApple,
                  height: 32.setHeight,
                  width: 32.setHeight,
                  gaplessPlayback: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
