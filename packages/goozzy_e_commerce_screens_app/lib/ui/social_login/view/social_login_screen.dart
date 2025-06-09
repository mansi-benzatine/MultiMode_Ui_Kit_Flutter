import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/sign_up/view/sign_up_screen.dart';

import '../../../../../../ui/create_new_account/view/create_new_account_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/container/common_container.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/social_login_data.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const SocialLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    List<SocialLoginData> socialLoginButtons = socialLoginList(context);

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(61)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        AppAssets.icLeftArrow,
                        width: AppSizes.setWidth(20),
                        height: AppSizes.setHeight(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(28)),
                  child: Image.asset(
                    AppAssets.imgSocialLogin,
                    width: AppSizes.setWidth(200),
                    height: AppSizes.setHeight(168),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(25), bottom: AppSizes.setHeight(15)),
                  child: CommonText(
                    text: Languages.of(context).letsYouIn,
                    fontSize: AppSizes.setFontSize(35),
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                ...socialLoginButtons.map(
                  (data) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
                          child: CustomContainer(
                            width: AppSizes.setWidth(360),
                            height: AppSizes.setHeight(60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  data.assetPath ?? '',
                                  height: AppSizes.setHeight(28),
                                  width: AppSizes.setWidth(28),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                                  child: CommonText(
                                    text: data.buttonText ?? '',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).dividerGrey,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                        child: CommonText(
                          text: Languages.of(context).orContinueWith,
                          fontSize: AppSizes.setFontSize(13),
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).dividerGrey,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                    child: CommonButton(
                      onTap: () => Navigator.push(context, CreateNewAccountScreen.route()),
                      btnText: Languages.of(context).signInWithPassword,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).dontHaveAnAccount,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: InkWell(
                          onTap: () => Navigator.push(context, SignUpScreen.route()),
                          child: CommonText(
                            text: Languages.of(context).signUp,
                            textColor: CustomAppColor.of(context).txtPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
