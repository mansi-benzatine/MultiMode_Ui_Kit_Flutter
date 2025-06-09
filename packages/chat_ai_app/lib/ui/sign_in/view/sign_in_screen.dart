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
import '../../sign_up/view/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignInScreen());
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
                _SignInView(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isPasswordVisible: _isPasswordVisible,
                  isKeepLogin: _isKeepLogin,
                ),
                SizedBox(height: 60.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "${Languages.of(context).txtDoNotHaveAnAccount} ",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context, SignUpScreen.route());
                        },
                        child: CommonText(
                          text: Languages.of(context).txtCreateAccount,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                          textColor: CustomAppColor.of(context).primary,
                          textAlign: TextAlign.start,
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
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordVisible;
  final ValueNotifier<bool> isKeepLogin;

  const _SignInView({
    required this.emailController,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.isKeepLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Column(
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
                text: Languages.of(context).txtSignIn,
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
                    suffixIcon: value ? AppAssets.icUnVisiblePassword : AppAssets.icVisiblePassword,
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
                          value ? AppAssets.icCheckBoxUnFill : AppAssets.icCheckBoxFill,
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
              CommonButton(
                text: Languages.of(context).txtSignIn,
                onTap: () {
                  Navigator.push(context, CreateProfileScreen.route());
                },
              ),
              SizedBox(height: 10.setHeight),
              Row(
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
      ),
    );
  }
}
