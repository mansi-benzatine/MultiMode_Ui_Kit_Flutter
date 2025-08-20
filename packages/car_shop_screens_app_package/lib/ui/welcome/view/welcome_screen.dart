import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../login/view/login_screen.dart';
import '../../sign_up/view/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WelcomeScreen());
  }

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.imgWelcome,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 100.setWidth,
                        left: 16.setWidth,
                        bottom: 16.setHeight,
                      ),
                      child: CommonText(
                        text: Languages.of(context).txtDiscoverYourDreamCar.toUpperCase(),
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).white,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      width: 0.screenWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.setHeight),
                          topRight: Radius.circular(20.setHeight),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                      child: Column(
                        children: [
                          SizedBox(height: 10.setHeight),
                          Container(
                            width: 50.setWidth,
                            height: 3.setHeight,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).txtBlack,
                              borderRadius: BorderRadius.circular(10.setHeight),
                            ),
                          ),
                          SizedBox(height: 30.setHeight),
                          Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  text: Languages.of(context).txtLogin.toUpperCase(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                              Expanded(
                                child: CommonButton(
                                  text: Languages.of(context).txtSignUp.toUpperCase(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                    );
                                  },
                                  buttonTextColor: CustomAppColor.of(context).primary,
                                  borderColor: CustomAppColor.of(context).primary,
                                  buttonGradient: LinearGradient(colors: [
                                    CustomAppColor.of(context).transparent,
                                    CustomAppColor.of(context).transparent,
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.setHeight),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: CustomAppColor.of(context).txtGray,
                                  thickness: 1,
                                  height: 20.setHeight,
                                ),
                              ),
                              SizedBox(width: 15.setWidth),
                              CommonText(
                                text: "${Languages.of(context).txtOr} ${Languages.of(context).txtContinueWith}",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                              SizedBox(width: 15.setWidth),
                              Expanded(
                                child: Divider(
                                  color: CustomAppColor.of(context).txtGray,
                                  thickness: 1,
                                  height: 20.setHeight,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.setHeight),
                          CommonButton(
                            text: Languages.of(context).txtContinueWithFacebook,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(
                                    selectedIndex: 0,
                                  ),
                                ),
                              );
                            },
                            buttonTextColor: CustomAppColor.of(context).txtBlack,
                            borderColor: CustomAppColor.of(context).txtBlack,
                            image: AppAssets.icFacebook,
                            buttonTextWeight: FontWeight.w500,
                            buttonGradient: LinearGradient(colors: [
                              CustomAppColor.of(context).transparent,
                              CustomAppColor.of(context).transparent,
                            ]),
                          ),
                          SizedBox(height: 20.setHeight),
                          CommonButton(
                            text: Languages.of(context).txtContinueWithGoogle,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(
                                    selectedIndex: 0,
                                  ),
                                ),
                              );
                            },
                            buttonTextColor: CustomAppColor.of(context).txtBlack,
                            borderColor: CustomAppColor.of(context).txtBlack,
                            image: AppAssets.icGoogle,
                            buttonTextWeight: FontWeight.w500,
                            buttonGradient: LinearGradient(colors: [
                              CustomAppColor.of(context).transparent,
                              CustomAppColor.of(context).transparent,
                            ]),
                          ),
                          SizedBox(height: 20.setHeight),
                          CommonButton(
                            text: Languages.of(context).txtContinueWithApple,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(
                                    selectedIndex: 0,
                                  ),
                                ),
                              );
                            },
                            buttonTextColor: CustomAppColor.of(context).txtBlack,
                            borderColor: CustomAppColor.of(context).txtBlack,
                            image: AppAssets.icApple,
                            buttonTextWeight: FontWeight.w500,
                            buttonGradient: LinearGradient(colors: [
                              CustomAppColor.of(context).transparent,
                              CustomAppColor.of(context).transparent,
                            ]),
                          ),
                          SizedBox(height: 20.setHeight),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
