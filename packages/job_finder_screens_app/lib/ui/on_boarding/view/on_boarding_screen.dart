import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../utils/app_color.dart';
import '../../select_your_option/view/select_your_option_screen.dart';
import '../model/on_boarding_data_model.dart';

class OnBoardingScreen extends StatefulWidget {
  final int initialIndex;

  const OnBoardingScreen({super.key, this.initialIndex = 0});

  static Route<void> route({int index = 0}) {
    return MaterialPageRoute<void>(
      builder: (_) => OnBoardingScreen(initialIndex: index),
    );
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  List<OnBoardingDataModel> onBoardingList = [];
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  _fillData() {
    onBoardingList = [
      OnBoardingDataModel(
        title1: "Search",
        title2: "Your job",
        image: AppAssets.imgOnBoarding1,
        description: "Figure out your top five priorities whether it is company culture, salary.",
      ),
      OnBoardingDataModel(
        title1: "Apply to",
        title2: "Best Jobs",
        image: AppAssets.imgOnBoarding2,
        description: "You can apply to your desirable jobs very quickly and easily with ease.",
      ),
      OnBoardingDataModel(
        title1: "Make Your",
        title2: "Career",
        image: AppAssets.imgOnBoarding3,
        description: "We help you find your dream job based on your skillset, location, demand.",
      ),
    ];
  }

  @override
  void initState() {
    _fillData();
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    currentIndex.value = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: IgnorePointer(
        ignoring: true,
        child: Column(
          children: [
            _IntroPageView(pageController: _pageController, onBoardingList: onBoardingList, currentIndex: currentIndex),
            _BottomNextButtonView(pageController: _pageController, onBoardingList: onBoardingList, currentIndex: currentIndex),
          ],
        ),
      ),
    );
  }
}

class _IntroPageView extends StatelessWidget {
  final PageController pageController;
  final List<OnBoardingDataModel> onBoardingList;
  final ValueNotifier<int> currentIndex;

  const _IntroPageView({
    required this.pageController,
    required this.onBoardingList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: onBoardingList.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          currentIndex.value = index;
        },
        itemBuilder: (BuildContext context, int index) {
          final item = onBoardingList[index];

          return _itemPageView(context: context, index: index, item: item);
        },
      ),
    );
  }

  _itemPageView({required BuildContext context, required int index, required OnBoardingDataModel item}) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            bottom: false,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item.image,
                  width: 0.screenWidth,
                  fit: BoxFit.contain,
                ),
                if (index != onBoardingList.length - 1)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        pageController.jumpToPage(onBoardingList.length - 1);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                        child: CommonText(
                          text: Languages.of(context).txtSkip,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGrey,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: "${item.title1} ",
              fontWeight: FontWeight.w800,
              fontSize: 28.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            CommonText(
              text: item.title2,
              fontWeight: FontWeight.w800,
              fontSize: 28.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
          child: CommonText(
            text: item.description,
            fontWeight: FontWeight.w500,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ),
        SizedBox(height: 38.setHeight),
      ],
    );
  }
}

class _BottomNextButtonView extends StatelessWidget {
  final PageController pageController;
  final List<OnBoardingDataModel> onBoardingList;
  final ValueNotifier<int> currentIndex;

  const _BottomNextButtonView({
    required this.pageController,
    required this.onBoardingList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothPageIndicator(
          controller: pageController, // PageController
          count: onBoardingList.length,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
            dotColor: CustomAppColor.of(context).containerGrey,
            activeDotColor: CustomAppColor.of(context).secondary,
            strokeWidth: 2,
            dotHeight: 8.setHeight,
            dotWidth: 8.setHeight,
          ),
        ),
        SizedBox(height: 38.setHeight),
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, value, widget) {
            return Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgScreenWhite,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: CustomAppColor.of(context).black..withOpacityPercent(.08),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
              child: SafeArea(
                top: false,
                child: CommonButton(
                  text: (value != onBoardingList.length - 1) ? Languages.of(context).txtNext : Languages.of(context).txtGetStarted,
                  buttonTextSize: 18.setFontSize,
                  buttonTextWeight: FontWeight.w500,
                  buttonColor: CustomAppColor.of(context).txtSecondary,
                  image: AppAssets.icNextRound,
                  onTap: () {
                    if (value != onBoardingList.length - 1) {
                      pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                    } else {
                      Navigator.push(context, SelectYourOptionScreen.route());
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
