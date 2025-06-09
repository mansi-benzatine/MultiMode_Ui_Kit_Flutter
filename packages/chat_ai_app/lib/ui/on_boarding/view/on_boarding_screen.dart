import 'dart:math';

import 'package:chat_ai_app_package/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../localization/language/languages.dart';
import '../../../../../widgets/text/common_text.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../welcome/view/welcome_screen.dart';
import '../model/on_boarding_data_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const OnBoardingScreen());
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  List<OnBoardingDataModel> onBoardingList = [];

  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
    _fillData();
  }

  void _fillData() {
    setState(() {
      onBoardingList = [
        OnBoardingDataModel(
          title1: Languages.of(context).txtAskMeAnything,
          image: AppAssets.imgOnBoarding1,
          description: Languages.of(context).txtLoremIpsumDesc,
        ),
        OnBoardingDataModel(
          title1: Languages.of(context).txtDoRealTimeMessaging,
          image: AppAssets.imgOnBoarding2,
          description: Languages.of(context).txtLoremIpsumDesc,
        ),
        OnBoardingDataModel(
          title1: Languages.of(context).txtSendVoiceMessaging,
          image: AppAssets.imgOnBoarding3,
          description: Languages.of(context).txtLoremIpsumDesc,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          _IntroPageView(
            pageController: _pageController,
            onBoardingList: onBoardingList,
            currentIndex: currentIndex,
          ),
          _BottomNextButtonView(pageController: _pageController, onBoardingList: onBoardingList, currentIndex: currentIndex),
        ],
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
    return PageView.builder(
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
    );
  }

  _itemPageView({required BuildContext context, required int index, required OnBoardingDataModel item}) {
    return Stack(
      children: [
        Image.asset(
          item.image,
          width: 0.screenWidth,
          height: 0.screenHeight,
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
        SafeArea(
          child: Column(
            children: [
              SizedBox(height: 40.setHeight),
              Container(
                width: 0.screenWidth,
                margin: EdgeInsets.symmetric(horizontal: 25.setWidth),
                child: CommonText(
                  text: item.title1.toUpperCase(),
                  fontWeight: FontWeight.w900,
                  fontSize: 40.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  height: 1,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10.setHeight),
              Container(
                margin: EdgeInsets.only(
                  left: 25.setWidth,
                  right: 80.setWidth,
                ),
                width: 0.screenWidth,
                child: CommonText(
                  text: item.description,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlackAndGray,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 38.setHeight),
            ],
          ),
        ),
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
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (context, value, widget) {
                      if (currentIndex.value != onBoardingList.length - 1) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              pageController.jumpToPage(onBoardingList.length - 1);
                            },
                            child: CommonText(
                              text: Languages.of(context).txtSkip,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        );
                      }

                      return const SizedBox();
                    }),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: onBoardingList.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                    dotColor: CustomAppColor.of(context).emptyDotColor,
                    activeDotColor: CustomAppColor.of(context).primary,
                    strokeWidth: 2,
                    dotHeight: 8.setHeight,
                    dotWidth: 8.setHeight,
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (context, value, widget) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            if (value != onBoardingList.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.push(context, WelcomeScreen.route());
                            }
                          },
                          child: SizedBox(
                            width: 60.setWidth,
                            height: 60.setHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: 0.0,
                                    end: (value + 1) / onBoardingList.length,
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  builder: (context, animatedPercent, _) {
                                    return CustomPaint(
                                      size: Size(54.setWidth, 54.setHeight),
                                      painter: GradientCircularPainter(percent: animatedPercent),
                                    );
                                  },
                                ),
                                Container(
                                  width: 44.setWidth,
                                  height: 44.setHeight,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF00E8C2),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppAssets.icNextRound,
                                      height: 44.setHeight,
                                      width: 44.setWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
        ],
      ),
    );
  }
}

class GradientCircularPainter extends CustomPainter {
  final double percent;

  GradientCircularPainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 2.0;
    final radius = (size.width / 2) - strokeWidth / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * percent;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (percent >= 1.0) {
      paint.color = Colors.black;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    } else {
      paint.shader = SweepGradient(
        colors: [
          Colors.black,
          Colors.black.withOpacityPercent(0.05),
        ],
        stops: const [0.0, 0.99],
        startAngle: 0,
        endAngle: 2 * pi,
        transform: const GradientRotation(startAngle),
      ).createShader(rect);

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant GradientCircularPainter oldDelegate) => oldDelegate.percent != percent;
}
