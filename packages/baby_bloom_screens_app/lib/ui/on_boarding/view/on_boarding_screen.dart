import 'dart:math';

import 'package:baby_bloom_screens_app/ui/get_start/view/get_start_screen.dart';
import 'package:baby_bloom_screens_app/ui/on_boarding/datamodel/on_boarding_data.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class OnBoardingScreen extends StatefulWidget {
  final int currentIndex;

  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (_) => OnBoardingScreen(currentIndex: currentIndex));
  }

  const OnBoardingScreen({super.key, this.currentIndex = 0});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int selectedIndex = 0;
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
    currentIndex.value = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
  }

  @override
  Widget build(BuildContext context) {
    onboardingList(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: IgnorePointer(
          ignoring: true,
          child: PageView.builder(
            controller: _pageController,
            itemCount: onboardingList(context).length,
            onPageChanged: (newPage) {
              if (newPage < 3) {
                setState(() => selectedIndex = newPage);
                currentIndex.value = newPage;
              } else {}
            },
            itemBuilder: (context, index) {
              final item = onboardingList(context)[index];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        item.image,
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.setWidth, right: 75.setWidth),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: item.heading.split(' ').map((word) {
                            const highlightWords = [
                              'pregnancy',
                              'simple',
                              'tips',
                              'reminders',
                              'health',
                              'growth',
                            ];

                            bool isHighlighted = highlightWords.contains(word.toLowerCase());

                            return TextSpan(
                              text: '$word '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                package: 'baby_bloom_screens_app',
                                fontFamily: Constant.fontFamilyExtraBold800,
                                fontSize: 30.setFontSize,
                                color: isHighlighted ? Colors.pink : CustomAppColor.of(context).txtBlack,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.setHeight, left: 20.setWidth, right: 30.setWidth),
                      child: CommonText(
                        text: item.descrption,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                        fontSize: 13.setFontSize,
                        textAlign: TextAlign.start,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    Padding(
                      padding: EdgeInsets.only(left: 20.setWidth, right: 30.setWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(onboardingList(context).length, (dotIndex) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
                                height: 8.setHeight,
                                width: 8.setWidth,
                                decoration: BoxDecoration(
                                  color: selectedIndex == dotIndex ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            }),
                          ),
                          ValueListenableBuilder(
                              valueListenable: currentIndex,
                              builder: (context, value, widget) {
                                return IgnorePointer(
                                  ignoring: true,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        if (value != onboardingList(context).length - 1) {
                                          _pageController.nextPage(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        } else {
                                          Navigator.push(context, GetStartScreen.route());
                                        }
                                      },
                                      child: SizedBox(
                                        width: 60.setWidth,
                                        height: 60.setHeight,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 60.setWidth,
                                              height: 60.setHeight,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: CustomAppColor.of(context).grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            TweenAnimationBuilder<double>(
                                              tween: Tween<double>(
                                                begin: 0.0,
                                                end: (value + 1) / onboardingList(context).length,
                                              ),
                                              duration: const Duration(milliseconds: 300),
                                              builder: (context, animatedPercent, _) {
                                                return CustomPaint(
                                                  size: Size(60.setWidth, 60.setHeight),
                                                  painter: GradientCircularPainter(percent: animatedPercent),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: 44.setWidth,
                                              height: 44.setHeight,
                                              decoration: BoxDecoration(
                                                color: CustomAppColor.of(context).secondary,
                                                shape: BoxShape.circle,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 4,
                                                  )
                                                ],
                                              ),
                                              child: const Icon(Icons.arrow_forward, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GradientCircularPainter extends CustomPainter {
  final double percent;

  GradientCircularPainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 1.5;
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
      paint.color = const Color(0xFFF13C79);
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    } else {
      paint.shader = SweepGradient(
        colors: [
          const Color(0xFFF13C79),
          const Color(0xFFfb7ba5).withValues(alpha: 0.09),
        ],
        stops: const [0.0, 0.5],
        startAngle: 0,
        endAngle: 3.5 * pi,
        transform: const GradientRotation(startAngle),
      ).createShader(rect);

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant GradientCircularPainter oldDelegate) => oldDelegate.percent != percent;
}
