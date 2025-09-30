import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musify_screens_app_package/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../welcome/view/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;

  const OnboardingScreen({super.key, this.currentIndex = 0});

  static Route route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (context) => OnboardingScreen(currentIndex: currentIndex));
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currantPageIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: widget.currentIndex, viewportFraction: 1.0, keepPage: true);
    currantPageIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: (Theme.of(context).brightness == Brightness.dark) ? Brightness.light : Brightness.dark,
        statusBarBrightness: (Theme.of(context).brightness == Brightness.dark) ? Brightness.light : Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.imgCommonBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  PageView.builder(
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.setHeight),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: mData.title?.toUpperCase() ?? "",
                              style: TextStyle(
                                color: CustomAppColor.of(context).txtBlack,
                                fontSize: 26.setFontSize,
                                fontWeight: FontWeight.w700,
                                fontFamily: Constant.fontFamily,
                                package: 'musify_screens_app_package',
                              ),
                              children: [
                                WidgetSpan(child: SizedBox(width: 10.setWidth)),
                                TextSpan(
                                  text: mData.subTitle?.toUpperCase() ?? "",
                                  style: TextStyle(
                                    color: CustomAppColor.of(context).primary,
                                    fontSize: 26.setFontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Constant.fontFamily,
                                    package: 'musify_screens_app_package',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.setHeight),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                            child: CommonText(
                              text: mData.description ?? "",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.setFontSize,
                              fontFamily: Constant.fontFamily,
                              maxLines: 4,
                              letterSpacing: 0,
                              height: 1,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 450.setHeight),
                            child: Image.asset(
                              onBoardingList(context)[index].image ?? "",
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 0.screenHeight * 0.21,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _indicatorWidget(),
                        SizedBox(height: 25.setHeight),
                        IgnorePointer(
                          ignoring: true,
                          child: GestureDetector(
                            onTap: () {
                              if (currantPageIndex == onBoardingList(context).length - 1) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                              } else {
                                pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                              }
                            },
                            child: Container(
                              height: 48.setHeight,
                              width: 48.setHeight,
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(15.setWidth),
                              child: Image.asset(
                                AppAssets.icArrowRight,
                                color: CustomAppColor.of(context).black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
        dotColor: CustomAppColor.of(context).greyIndicator,
        activeDotColor: CustomAppColor.of(context).primary,
        dotHeight: 5.setHeight,
        dotWidth: 5.setWidth,
        spacing: 3.setWidth,
        expansionFactor: 3.5,
      ),
    );
  }
}
