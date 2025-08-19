import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_driver_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/button/common_button.dart';

import '../../../widgets/text/common_text.dart';
import '../../login/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const WelcomeScreen());
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80)),
                    color: CustomAppColor.of(context).white,
                  ),
                  padding: EdgeInsets.only(top: 40.setHeight),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80)),
                    child: Image.asset(
                      AppAssets.imgWelcome,
                      width: 0.screenWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.setHeight),
              CommonText(
                text: Languages.of(context).txtWelcomeToTaxiMode,
                fontSize: 24.setFontSize,
                textAlign: TextAlign.center,
                textColor: CustomAppColor.of(context).txtBlack,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 30.setHeight),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtContinueWithMobileNumber,
                  onTap: () {
                    Navigator.push(context, LoginScreen.route());
                  },
                  buttonTextWeight: FontWeight.w500,
                  buttonTextSize: 14.setFontSize,
                  image: AppAssets.icCallRound,
                  mLeft: 25.setWidth,
                  mRight: 25.setWidth,
                ),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CommonButton(
                        height: 55.setHeight,
                        text: Languages.of(context).txtGoogle,
                        onTap: () {},
                        buttonTextWeight: FontWeight.w500,
                        buttonTextSize: 14.setFontSize,
                        image: AppAssets.icGoogle,
                      ),
                    ),
                    SizedBox(width: 21.setWidth),
                    Expanded(
                      child: CommonButton(
                        height: 55.setHeight,
                        text: Languages.of(context).txtFacebook,
                        onTap: () {},
                        buttonTextWeight: FontWeight.w500,
                        buttonTextSize: 14.setFontSize,
                        image: AppAssets.icFacebook,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.setHeight),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w500,
                      color: CustomAppColor.of(context).txtGray,
                      height: 1.7,
                    ),
                    children: [
                      TextSpan(
                        text: "${Languages.of(context).txtByContinuingYouAgreeToOur} ",
                      ),
                      TextSpan(
                        text: Languages.of(context).txtTermsOfService,
                        style: TextStyle(
                          color: CustomAppColor.of(context).txtPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomAppColor.of(context).txtPrimary,
                          decorationThickness: 2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                      TextSpan(text: " ${Languages.of(context).txtAnd} "),
                      TextSpan(
                        text: "${Languages.of(context).txtPrivacyPolicy}.",
                        style: TextStyle(
                          color: CustomAppColor.of(context).txtPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomAppColor.of(context).txtPrimary,
                          decorationThickness: 2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.setHeight),
            ],
          ),
        ),
      ),
    );
  }
}
