import 'package:flutter/material.dart';

import '../../../../../../ui/social_login/view/social_login_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/common_richtext/common_richtext.dart';
import '../../../widgets/text/common_text.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const AccountCreatedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: SizedBox(
          width: AppSizes.fullWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.setHeight(116),
                    left: AppSizes.setWidth(22),
                    right: AppSizes.setWidth(22),
                  ),
                  child: Image.asset(
                    AppAssets.imgAccountCreated,
                    width: AppSizes.setWidth(258),
                    height: AppSizes.setHeight(233),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(58)),
                  child: CommonText(
                    text: Languages.of(context).accountCreated,
                    fontSize: AppSizes.setFontSize(35),
                    fontWeight: FontWeight.w800,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(25)),
                  child: CommonText(
                    text: Languages.of(context).yourAccountCreated,
                    fontSize: AppSizes.setFontSize(15),
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(88)),
                  child: CommonButton(
                    btnText: Languages.of(context).txtContinue,
                    onTap: () => Navigator.push(context, SocialLoginScreen.route()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(39), left: AppSizes.setWidth(41), right: AppSizes.setWidth(30)),
                  child: CommonText(
                    text: Languages.of(context).byContinuingYouAgreeToGoozzy,
                    fontSize: AppSizes.setFontSize(15),
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(5)),
                CommonRichText(
                  firstText: Languages.of(context).termsAndCondition,
                  middleText: Languages.of(context).and,
                  lastText: Languages.of(context).privacyPolicy,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
