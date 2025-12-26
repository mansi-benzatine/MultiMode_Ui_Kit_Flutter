import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/glass_container/glass_container.dart';
import '../../../widgets/text/common_text.dart';
import '../../login/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WelcomeScreen());
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSignUpBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 50.setHeight,
                left: 20.setWidth,
                right: 20.setWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.setHeight,
                      width: 70.setWidth,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.icAppLogo),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtWelcomeTpCryptocoin.toUpperCase(),
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsum,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      maxLines: 3,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 0.screenHeight / 12),
                    GlassContainer(
                      width: 0.screenWidth,
                      height: 0.screenHeight / 9.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icRealTimeTrading,
                              height: 25.setHeight,
                              width: 24.setWidth,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: Languages.of(context).txtRealTimeTrading,
                                  fontSize: 17.setFontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                                Expanded(
                                    child: CommonText(
                                  text: Languages.of(context).txtLoremIpsumShort,
                                  fontSize: 11.setFontSize,
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w300,
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 22.setHeight),
                    GlassContainer(
                      width: 0.screenWidth,
                      height: 0.screenHeight / 9.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icSecureStorage,
                              height: 25.setHeight,
                              width: 24.setWidth,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: Languages.of(context).txtSecureStorage,
                                  fontSize: 17.setFontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                                Expanded(
                                    child: CommonText(
                                  text: Languages.of(context).txtLoremIpsumShort,
                                  fontSize: 11.setFontSize,
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w300,
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 22.setHeight),
                    GlassContainer(
                      width: 0.screenWidth,
                      height: 0.screenHeight / 9.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icInstantSwap,
                              height: 25.setHeight,
                              width: 24.setWidth,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: Languages.of(context).txtInstantSwap,
                                  fontSize: 17.setFontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                                Expanded(
                                    child: CommonText(
                                  text: Languages.of(context).txtLoremIpsumShort,
                                  fontSize: 11.setFontSize,
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w300,
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 0.screenHeight / 10),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtGetStarted,
                        onTap: () {
                          Navigator.push(context, LoginScreen.route());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
