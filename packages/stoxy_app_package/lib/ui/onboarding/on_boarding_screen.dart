import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/ui/onboarding/datamodel/onboarding_data.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../widgets/button/common_button.dart';
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
  ValueNotifier<int> currantPageIndex = ValueNotifier<int>(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgCommonBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    AppAssets.imgBgOnBoarding,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (value) {
                          currantPageIndex.value = value;
                        },
                        itemCount: onBoardingList(context).length,
                        itemBuilder: (context, index) {
                          /* OnboardingData mData = onBoardingList(context)[index];*/
                          return Image.asset(
                            onBoardingList(context)[index].image ?? "",
                            fit: BoxFit.contain,
                            height: 250,
                          );
                        },
                      ),
                    ),
                    _indicatorWidget(),
                    SizedBox(height: 20.setHeight),
                    ValueListenableBuilder(
                      valueListenable: currantPageIndex,
                      builder: (context, value, child) {
                        OnboardingData mData = onBoardingList(context)[value];
                        return Column(
                          children: [
                            SizedBox(height: 10.setHeight),
                            CommonText(
                              text: (mData.title ?? "").toUpperCase(),
                              fontWeight: FontWeight.w700,
                              fontSize: 22.setFontSize,
                              fontFamily: Constant.fontFamily,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 10.setHeight),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                              child: CommonText(
                                text: mData.description ?? "",
                                fontWeight: FontWeight.w400,
                                fontSize: 13.setFontSize,
                                fontFamily: Constant.fontFamily,
                                maxLines: 3,
                                textColor: CustomAppColor.of(context).txtGray,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 20.setHeight),
                            CommonButton(
                              mLeft: 20.setWidth,
                              mRight: 20.setWidth,
                              text: Languages.of(context).txtNext,
                              gradient: CustomAppColor.of(context).primaryGradient,
                              onTap: () {
                                if (currantPageIndex.value == (onBoardingList(context).length - 1)) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                                } else {
                                  pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                                }
                              },
                            ),
                            SizedBox(height: 20.setHeight),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
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
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 25.setWidth,
          height: 5.setHeight,
          color: CustomAppColor.of(context).primary,
          borderRadius: BorderRadius.circular(8),
        ),
        dotDecoration: DotDecoration(
          width: 5.setWidth,
          height: 5.setHeight,
          color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(6),
        ),
        spacing: 4.setWidth,
      ),
    );
  }
}
