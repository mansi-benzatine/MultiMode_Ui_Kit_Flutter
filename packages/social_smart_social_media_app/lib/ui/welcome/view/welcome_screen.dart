import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../../../../../../../ui/on_boarding/view/onboarding_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text/gradiant_text.dart';
import '../../sign_in/view/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const WelcomeScreen());
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          iconTheme: IconThemeData(color: CustomAppColor.of(context).icWhite),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: CustomAppColor.of(context).icBlack),
            onPressed: () => Navigator.push(context, SocialSmartOnboardingScreen.route()),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.setWidth(4),
            vertical: AppSizes.setHeight(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.imgWelcomeBg,
                  height: AppSizes.setHeight(200),
                  width: AppSizes.setWidth(360),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: AppSizes.setHeight(20)),
                CommonText(
                  text: Languages.of(context).welcome,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(44),
                  fontFamily: Constant.fontFamilyUrbanist,
                ),
                SizedBox(height: AppSizes.setHeight(20)),
                _buildSocialButton(
                  iconPath: AppAssets.icFacebook,
                  buttonText: Languages.of(context).continueWithFacebook,
                  onTap: () {},
                ),
                _buildSocialButton(
                  iconPath: AppAssets.icGoogle,
                  buttonText: Languages.of(context).continueWithGoogle,
                  onTap: () {},
                ),
                _buildSocialButton(
                  iconPath: AppAssets.icApple,
                  buttonText: Languages.of(context).continueWithApple,
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.setWidth(24),
                    vertical: AppSizes.setHeight(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).grey.withOpacityPercent(0.3),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CommonText(
                          text: Languages.of(context).or,
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.setFontSize(14),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).grey.withOpacityPercent(0.3),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    useSimpleStyle: false,
                    isShadowButton: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.icMsg,
                          width: AppSizes.setWidth(20),
                          height: AppSizes.setHeight(18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonText(
                            text: Languages.of(context).signUpWithEmail,
                            textColor: AppColor.txtWhite,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).existingUser,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontSize: AppSizes.setFontSize(14),
                      ),
                      SizedBox(width: AppSizes.setWidth(2)),
                      InkWell(
                        onTap: () => Navigator.push(context, SignInScreen.route()),
                        child: GradientText(
                          child: CommonText(
                            text: Languages.of(context).signInNow,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.setFontSize(14),
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

  Widget _buildSocialButton({required String iconPath, required String buttonText, required Function()? onTap, bool? isDarkMode}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(10)),
      child: Container(
        width: AppSizes.setWidth(400),
        height: AppSizes.setHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomAppColor.of(context).bgBottomSheet.withOpacityPercent(0.5),
          border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: AppSizes.setWidth(20),
              height: AppSizes.setHeight(20),
              color: (isDarkMode ?? false) ? CustomAppColor.of(context).icBlack : null,
            ),
            Padding(
              padding: EdgeInsets.only(left: AppSizes.setWidth(10)),
              child: CommonText(
                text: buttonText,
                textColor: CustomAppColor.of(context).txtBlack,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
