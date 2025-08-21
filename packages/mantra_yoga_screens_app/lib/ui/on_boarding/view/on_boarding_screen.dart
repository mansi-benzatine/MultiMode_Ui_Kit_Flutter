import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../welcome/view/welcome_screen.dart';
import '../model/on_boarding_data_model.dart';

class OnBoardingScreen extends StatefulWidget {
  final int selectedIndex;
  static Route<void> route({required int selectedIndex}) {
    return MaterialPageRoute(builder: (_) => OnBoardingScreen(selectedIndex: selectedIndex));
  }

  const OnBoardingScreen({super.key, required this.selectedIndex});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  List<OnBoardingDataModel> onBoardingData = [];
  ValueNotifier<int> currentPage = ValueNotifier(0);

  @override
  void dispose() {
    _pageController.dispose();
    currentPage.dispose();
    super.dispose();
  }

  void _fillOnBoardingData() {
    onBoardingData = [
      OnBoardingDataModel(
        image: AppAssets.imgOnBoarding1,
        title: Languages.of(context).txtStayClam,
        description: Languages.of(context).txtLoremIpsum,
      ),
      OnBoardingDataModel(
        image: AppAssets.imgOnBoarding2,
        title: Languages.of(context).txtMindfulness,
        description: Languages.of(context).txtLoremIpsum,
      ),
      OnBoardingDataModel(
        image: AppAssets.imgOnBoarding3,
        title: Languages.of(context).txtStayFocus,
        description: Languages.of(context).txtLoremIpsum,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    currentPage = ValueNotifier(widget.selectedIndex);
    _pageController = PageController(initialPage: widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    _fillOnBoardingData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: IgnorePointer(
          ignoring: true,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: onBoardingData.length,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            onBoardingData[index].image,
                            height: 0.screenHeight,
                            width: 0.screenWidth / 1.2,
                            fit: BoxFit.contain,
                          ),
                        ),
                        CommonText(
                          text: onBoardingData[index].title.toUpperCase(),
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w800,
                          fontFamily: Constant.fontFamilyExtraBold800,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        SizedBox(height: 10.setHeight),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                          child: CommonText(
                            text: onBoardingData[index].description,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyRegular400,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(height: 10.setHeight),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.setHeight, bottom: 25.setHeight),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingData.length,
                  effect: WormEffect(
                    dotHeight: 8.setHeight,
                    dotWidth: 8.setWidth,
                    spacing: 5.setWidth,
                    activeDotColor: CustomAppColor.of(context).primary,
                    dotColor: CustomAppColor.of(context).bgGray,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 20.setHeight),
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: currentPage,
                      builder: (context, value, child) {
                        if (value == onBoardingData.length - 1) {
                          return const SizedBox.shrink();
                        }

                        return InkWell(
                          onTap: () {
                            _pageController.jumpToPage(onBoardingData.length - 1);
                          },
                          child: CommonText(
                            text: Languages.of(context).txtSkip,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w500,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    CommonButton(
                      text: Languages.of(context).txtNext,
                      buttonColor: CustomAppColor.of(context).primary,
                      borderColor: CustomAppColor.of(context).borderColor,
                      borderWidth: 3,
                      width: 105.setWidth,
                      height: 45.setHeight,
                      radius: 14,
                      onTap: () {
                        if (currentPage.value == onBoardingData.length - 1) {
                          Navigator.push(context, WelcomeScreen.route());
                        } else {
                          _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        }
                      },
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
