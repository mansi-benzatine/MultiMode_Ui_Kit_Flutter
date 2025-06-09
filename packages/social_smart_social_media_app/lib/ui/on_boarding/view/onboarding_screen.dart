import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../welcome/view/welcome_screen.dart';
import '../datamodel/onboarding_data.dart';

class SocialSmartOnboardingScreen extends StatefulWidget {
  const SocialSmartOnboardingScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SocialSmartOnboardingScreen());
  }

  @override
  State<SocialSmartOnboardingScreen> createState() => _SocialSmartOnboardingScreenState();
}

class _SocialSmartOnboardingScreenState extends State<SocialSmartOnboardingScreen> {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  int currantPageIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
            statusBarBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
            statusBarColor: CustomAppColor.of(context).transparent,
          ),
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currantPageIndex = value;
                          });
                        },
                        itemCount: onBoardingList(context).length,
                        itemBuilder: (context, index) {
                          OnboardingData mData = onBoardingList(context)[index];
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: AppSizes.setWidth(32),
                                    left: AppSizes.setWidth(32),
                                    top: AppSizes.setHeight(130),
                                  ),
                                  child: Image.asset(
                                    mData.image!,
                                    height: AppSizes.setHeight(300),
                                    width: index == 2 ? AppSizes.setWidth(264) : AppSizes.setWidth(300),
                                    fit: BoxFit.fill,
                                    gaplessPlayback: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: index == 2 ? AppSizes.setHeight(94) : AppSizes.setHeight(60), horizontal: AppSizes.setWidth(28)),
                                  child: CommonText(
                                    text: mData.title ?? "",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizes.setFontSize(34),
                                    fontFamily: Constant.fontFamilyUrbanist,
                                    letterSpacing: 0,
                                    maxLines: 4,
                                    height: 1.2,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    _indicatorWidget(),
                    SizedBox(height: AppSizes.setHeight(20)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(36), horizontal: AppSizes.setWidth(18)),
                      child: CommonButton(
                        isShadowButton: true,
                        child: CommonText(
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(16),
                          textColor: CustomAppColor.of(context).white,
                          text:
                              currantPageIndex == onBoardingList(context).length - 1 ? Languages.of(context).getStarted : Languages.of(context).next,
                        ),
                        onTap: () {
                          /* MyApp.changeTheme(context, isLightTheme: !Constant.isLightThemeGlobal);
                        setState(() {});*/

                          if (currantPageIndex < onBoardingList(context).length - 1) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // getIt.get<LocalStorageService>().setBool(LocalStorageService.isFirstTime, false);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _indicatorWidget() {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        dotColor: AppColor.grey.withOpacityPercent(0.25),
        activeDotColor: AppColor.btnGradiant2,
        dotHeight: 8,
        dotWidth: 8,
        expansionFactor: 3.5,
      ),
    );
  }
}
