import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../setup_profile/view/setup_profile_screen.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
        builder: (context) => const AccountCreatedScreen());
  }

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.screenHeight / 2,
                  width: 0.screenWidth,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).btnPrimary,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(80)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.setHeight),
                      Image.asset(
                        AppAssets.icThumbsUp,
                        width: 150.setHeight,
                        height: 150.setHeight,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 35.setHeight),
                      CommonText(
                        text: "${Languages.of(context).txtAccountCreated}!",
                        fontSize: 26.setFontSize,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).white,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 25.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: CommonText(
                          text: Languages.of(context)
                              .txtYourAccountHasBeenCreatedSuccessfullyPressContinueToStartUsingApp,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                    ],
                  ),
                ),
                SizedBox(height: 0.screenHeight / 4.5),
                InkWell(
                  onTap: () {
                    Navigator.push(context, SetupProfileScreen.route());
                  },
                  child: Image.asset(
                    AppAssets.icGoToNext,
                    width: 60.setHeight,
                    height: 60.setHeight,
                  ),
                ),
                SizedBox(height: 0.screenHeight / 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColor.of(context).txtGray,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "${Languages.of(context).txtByContinuingYouAgreeToOur} "),
                        TextSpan(
                          text: Languages.of(context).txtTermsOfService,
                          style: TextStyle(
                              color: CustomAppColor.of(context).txtPrimary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  CustomAppColor.of(context).txtPrimary,
                              decorationThickness: 1,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.setFontSize,
                              height: 2),
                        ),
                        TextSpan(text: " ${Languages.of(context).txtAnd} "),
                        TextSpan(
                          text: "${Languages.of(context).txtPrivacyPolicy}.",
                          style: TextStyle(
                            color: CustomAppColor.of(context).txtPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                CustomAppColor.of(context).txtPrimary,
                            decorationThickness: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
