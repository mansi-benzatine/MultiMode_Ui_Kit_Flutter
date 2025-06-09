import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../welcome/view/welcome_screen.dart';
import '../datamodel/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  final int initialIndex;
  const OnboardingScreen({super.key, required this.initialIndex});

  static Route route({required int initialIndex}) {
    return MaterialPageRoute(builder: (context) => OnboardingScreen(initialIndex: initialIndex));
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currantPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 1.0,
      keepPage: true,
    );
    currantPageIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
                      physics: const NeverScrollableScrollPhysics(),
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
                                  maxLines: 4,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  height: 1.2,
                                  letterSpacing: 0,
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
                  IgnorePointer(
                    ignoring: true,
                    child: Padding(
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
                            Navigator.pushAndRemoveUntil(context, WelcomeScreen.route(), (Route<dynamic> route) => false);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
