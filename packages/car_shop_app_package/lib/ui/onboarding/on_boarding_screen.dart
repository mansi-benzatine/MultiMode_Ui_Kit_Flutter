import 'package:car_shop_app_package/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../welcome/view/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const OnboardingScreen());
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  int currantPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          child: Stack(
            children: [
              Column(
                children: [
                  if (currantPageIndex < onBoardingList(context).length - 1)
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 20.setWidth, top: 20.setHeight),
                      child: InkWell(
                        onTap: () {
                          pageController.animateToPage(onBoardingList(context).length - 1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        child: CommonText(text: Languages.of(context).txtSkip, fontSize: 14.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, textColor: CustomAppColor.of(context).txtBlack),
                      ),
                    ),
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
                        return Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 32.setWidth,
                                  left: 32.setWidth,
                                ),
                                child: Image.asset(
                                  mData.image!,
                                  fit: BoxFit.contain,
                                  gaplessPlayback: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.setHeight),
                            CommonText(
                              text: mData.title ?? "",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.setFontSize,
                              fontFamily: Constant.fontFamily,
                              maxLines: 4,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 20.setHeight),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                              child: CommonText(
                                text: mData.description ?? "",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.setFontSize,
                                fontFamily: Constant.fontFamily,
                                maxLines: 3,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                            ),
                            SizedBox(height: 30.setHeight),
                          ],
                        );
                      },
                    ),
                  ),
                  _indicatorWidget(),
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 18.setWidth),
                    child: CommonButton(
                      onTap: () {
                        if (currantPageIndex < onBoardingList(context).length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                        }
                      },
                      text: (currantPageIndex == onBoardingList(context).length - 1 ? Languages.of(context).txtGetStarted : Languages.of(context).txtNext),
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
        dotColor: CustomAppColor.of(context).greyIndicator,
        activeDotColor: CustomAppColor.of(context).primary,
        dotHeight: 8,
        dotWidth: 8,
        expansionFactor: 3.5,
      ),
    );
  }
}
