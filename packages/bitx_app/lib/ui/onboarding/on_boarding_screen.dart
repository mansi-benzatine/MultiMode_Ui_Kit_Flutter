import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
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
              image: AssetImage(AppAssets.imgBgOnBoarding),
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
                    SizedBox(height: 10.setHeight),
                    pageIndicator(),
                    SizedBox(height: 15.setHeight),
                    ValueListenableBuilder(
                      valueListenable: currantPageIndex,
                      builder: (context, value, child) {
                        OnboardingData mData = onBoardingList(context)[value];
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.setHeight),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                                  child: CommonText(
                                    text: (mData.title ?? "").toUpperCase(),
                                    fontFamily: Constant.fontFamilyImpact,
                                    fontSize: 38.setFontSize,
                                    textColor: CustomAppColor.of(context).onboardingHeading,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: 10.setHeight),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                                  child: CommonText(
                                    text: mData.description ?? "",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.setFontSize,
                                    maxLines: 3,
                                    textColor: CustomAppColor.of(context).txtGray,
                                    height: 0,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: 10.setHeight),
                                SizedBox(
                                  height: 0.screenHeight / 1.9,
                                  child: PageView.builder(
                                    controller: pageController,
                                    onPageChanged: (index) {
                                      setState(() {
                                        currantPageIndex.value = index;
                                      });
                                    },
                                    itemCount: onBoardingList(context).length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                                        child: Image.asset(
                                          onBoardingList(context)[index].image ?? "",
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                                  child: CommonButton(
                                    text: Languages.of(context).txtNext,
                                    onTap: () {
                                      if (currantPageIndex.value == (onBoardingList(context).length - 1)) {
                                        Navigator.push(context, WelcomeScreen.route());
                                      } else {
                                        pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.setHeight),
                                Visibility(
                                  visible: currantPageIndex.value != 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageController.jumpToPage(2);
                                      });
                                    },
                                    child: Center(
                                      child: CommonText(
                                        text: Languages.of(context).txtSkip,
                                        fontFamily: Constant.fontFamily,
                                        textColor: CustomAppColor.of(context).txtSkip,
                                        fontSize: 15.setFontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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

  Widget pageIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          final bool isFilled = currantPageIndex.value >= index;

          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
              height: 3.setHeight,
              decoration: BoxDecoration(
                color: isFilled ? _progressColor(context, index) : CustomAppColor.of(context).unSelectedPageIndicator,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }),
      ),
    );
  }

  Color _progressColor(BuildContext context, int index) {
    switch (index) {
      case 0:
        return CustomAppColor.of(context).primary;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.purpleAccent;
      default:
        return Colors.grey;
    }
  }
}
