import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../ui/on_boarding/view/onboarding_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text/gradiant_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../forgot_password/view/forgot_password_screen.dart';
import '../../profile_setup/view/profile_setup_screen.dart';
import '../../sign_up/view/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SignInScreen());
  }

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        iconTheme: IconThemeData(color: CustomAppColor(context).icBlack),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomAppColor(context).icBlack),
          onPressed: () => Navigator.push(context, SocialSmartOnboardingScreen.route()),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: EdgeInsets.only(
            left: AppSizes.setWidth(20),
            right: AppSizes.setWidth(20),
            top: AppSizes.setHeight(28),
          ),
          child: Column(
            children: [
              CommonText(
                text: Languages.of(context).loginToYourAccount,
                fontSize: AppSizes.setFontSize(40),
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: AppSizes.setHeight(40)),
              CommonTextFormField(
                hintText: Languages.of(context).enterEmail,
                leadingIcon: Image.asset(
                  AppAssets.icMsg,
                  color: CustomAppColor.of(context).icBlack,
                  scale: 4.5,
                ),
              ),
              SizedBox(height: AppSizes.setHeight(16)),
              CommonTextFormField(
                hintText: Languages.of(context).enterPassword,
                isPasswordField: true,
                leadingIcon: Image.asset(
                  AppAssets.icLock,
                  color: CustomAppColor.of(context).icBlack,
                  scale: 4.5,
                ),
              ),
              SizedBox(height: AppSizes.setHeight(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: AppSizes.setHeight(24),
                      width: AppSizes.setWidth(24),
                      decoration: BoxDecoration(
                        gradient: isChecked
                            ? const LinearGradient(
                                colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                        border: !isChecked
                            ? Border.all(color: CustomAppColor.of(context).containerGrey, width: 2)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: isChecked
                          ? Image.asset(
                              AppAssets.icTrueMark,
                              width: AppSizes.setWidth(9),
                              height: AppSizes.setHeight(6),
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: Languages.of(context).rememberMe,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(14),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.setHeight(24)),
              CommonButton(
                onTap: () {
                  Navigator.push(context, ProfileSetUpScreen.route());
                },
                useSimpleStyle: false,
                btnText: Languages.of(context).signIn,
                isShadowButton: true,
              ),
              SizedBox(height: AppSizes.setHeight(24)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                  );
                },
                child: GradientText(
                  child: CommonText(
                    text: Languages.of(context).forgotThePassword,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.setHeight(15)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: CustomAppColor.of(context).grey.withOpacityPercent(0.3),
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CommonText(
                        text: Languages.of(context).orContinueWith,
                        fontSize: AppSizes.setFontSize(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: CustomAppColor.of(context).grey.withOpacityPercent(0.3),
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialButton(context, AppAssets.icFacebook),
                    _socialButton(context, AppAssets.icGoogle),
                    _socialButton(context, AppAssets.icApple, isApple: true),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.setHeight(35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: Languages.of(context).dontHaveAnAccount,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: AppSizes.setFontSize(12),
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: GradientText(
                      child: CommonText(
                        text: Languages.of(context).signUp,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(12),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSizes.setHeight(35)),
            ],
          ),
        ),
      ),
    );
  }

  _socialButton(BuildContext context, String asset, {bool isApple = false}) {
    return Container(
      width: AppSizes.setWidth(80),
      height: AppSizes.setHeight(54),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgContainerBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomAppColor.of(context).btnBorderGrey.withOpacityPercent(0.5),
          width: 0.5,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          asset,
          width: AppSizes.setWidth(20),
          color: isApple ? CustomAppColor.of(context).icBlack : null,
        ),
      ),
    );
  }
}
