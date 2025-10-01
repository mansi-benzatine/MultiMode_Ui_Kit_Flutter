import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/sign_in/view/sign_in_screen.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/text_field/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailAddressController = TextEditingController(text: "Kellyoliver@yourdomain.com");
  final TextEditingController passwordController = TextEditingController(text: "123456789");
  final TextEditingController fullNameController = TextEditingController(text: "Kelly Oliver");
  final TextEditingController confirmPasswordController = TextEditingController(text: "123456789");

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              AppAssets.imgBg,
              height: 280.setHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            Padding(
              padding: EdgeInsets.only(top: 240.setHeight),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                padding: EdgeInsets.only(left: 22.setWidth, top: 20.setHeight, right: 22.setWidth),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormView(
                        emailAddressController: emailAddressController,
                        passwordController: passwordController,
                        isPasswordVisible: isPasswordVisible,
                        confirmPasswordController: confirmPasswordController,
                        fullNameController: fullNameController,
                        isConfirmPasswordVisible: isConfirmPasswordVisible,
                      ),
                      SizedBox(height: 40.setHeight),
                      const SocialSignInView()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.setHeight,
              left: 22.setWidth,
              child: IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.icArrowRight,
                    width: 25.setWidth,
                    height: 25.setHeight,
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

class FormView extends StatefulWidget {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(true);

  FormView(
      {super.key,
      required this.emailAddressController,
      required this.passwordController,
      required this.isPasswordVisible,
      required this.confirmPasswordController,
      required this.fullNameController,
      required this.isConfirmPasswordVisible});

  @override
  State<FormView> createState() => FormViewState();
}

class FormViewState extends State<FormView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSignUp,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 30.setFontSize,
        ),
        SizedBox(height: 12.setHeight),
        CommonText(
          text: Languages.of(context).txtKindlyFillInYourDetailsBelowToSignInYourAnAccount,
          fontFamily: Constant.fontFamilyMedium500,
          fontSize: 16.setFontSize,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtGray,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          prefixIcon: AppAssets.icUser,
          controller: widget.fullNameController,
          hintText: Languages.of(context).txtEnterFullName,
          titleText: Languages.of(context).txtFullName,
          prefixIconColor: CustomAppColor.of(context).icGray,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          prefixIcon: AppAssets.icEmail,
          controller: widget.emailAddressController,
          hintText: Languages.of(context).txtEnterEmailAddress,
          titleText: Languages.of(context).txtEmailAddress,
          prefixIconColor: CustomAppColor.of(context).icGray,
        ),
        SizedBox(height: 20.setHeight),
        ValueListenableBuilder(
          valueListenable: widget.isPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: widget.passwordController,
              hintText: Languages.of(context).txtEnterPassword,
              titleText: Languages.of(context).txtPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
              onSuffixClick: () {
                widget.isPasswordVisible.value = !widget.isPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 20.setHeight),
        ValueListenableBuilder(
          valueListenable: widget.isConfirmPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: widget.confirmPasswordController,
              hintText: Languages.of(context).txtEnterConfirmPassword,
              titleText: Languages.of(context).txtConfirmPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
              onSuffixClick: () {
                widget.isConfirmPasswordVisible.value = !widget.isConfirmPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 30.setHeight),
        IgnorePointer(
          ignoring: true,
          child: CommonButton(
            text: Languages.of(context).txtSignUp,
            onTap: () => Navigator.push(context, SignInScreen.route()),
          ),
        ),
      ],
    );
  }
}

class SocialSignInView extends StatelessWidget {
  const SocialSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: CustomAppColor.of(context).dividerColor,
                height: 35.setHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: CommonText(
                text: Languages.of(context).txtOrSignInWith,
                fontFamily: Constant.fontFamilyMedium500,
                fontSize: 16.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
              ),
            ),
            Expanded(
              child: Divider(
                color: CustomAppColor.of(context).dividerColor,
                height: 35.setHeight,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: CustomAppColor.of(context).borderTextFormField)),
              child: Image.asset(
                AppAssets.icGoogle,
                height: 26.setHeight,
                width: 26.setWidth,
              ),
            ),
            SizedBox(width: 24.setWidth),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                AppAssets.icApple,
                height: 32.setHeight,
                width: 32.setWidth,
              ),
            ),
            SizedBox(width: 24.setWidth),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                AppAssets.icFacebook,
                height: 32.setHeight,
                width: 32.setWidth,
              ),
            )
          ],
        ),
        SizedBox(height: 30.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtAlreadyHaveAnAccount,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtGray,
              fontSize: 16.setFontSize,
            ),
            SizedBox(width: 5.setWidth),
            IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, SignInScreen.route());
                },
                child: CommonText(
                  text: Languages.of(context).txtSignIn,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtOrange,
                  fontSize: 16.setFontSize,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.setHeight),
      ],
    );
  }
}
