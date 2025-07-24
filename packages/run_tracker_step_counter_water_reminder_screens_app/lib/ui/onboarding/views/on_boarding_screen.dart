import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/fill_information/views/fill_information_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';

import '../datamodels/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;
  static Route<void> route({required int currentIndex}) {
    return MaterialPageRoute(
      builder: (_) => OnboardingScreen(currentIndex: currentIndex),
    );
  }

  const OnboardingScreen({super.key, required this.currentIndex});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  List<OnboardingItem> onboardingItems = [];

  void _nextPage() {
    if (_currentIndex < onboardingItems.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(context, OnboardingDetailsScreen.route());
    }
  }

  void _skip() {}

  void fillData() {
    onboardingItems = [
      OnboardingItem(
        image: AppAssets.imgOnBoarding1,
        title: "Run Tracker",
        description:
            "It tracks running stats, records routes with GPS in real-time, and helps improve your running performance with detailed analysis and insight graphs.",
      ),
      OnboardingItem(
        image: AppAssets.imgOnBoarding2,

        title: "Step Counter",
        description:
            "This step counter app is very easy to use. Open it and start to walk, step counter app automatically records your steps.",
      ),
      OnboardingItem(
        image: AppAssets.imgOnBoarding3,
        title: "Water Reminder",
        description:
            "Water is essential to our life, drinking enough and the right quantity of water is vital for our health. Water reminder app is drink water tracker & reminder free.",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              onboardingItems[_currentIndex].image,
              fit: BoxFit.cover,
            ),
          ),

          // Black gradient overlay at bottom
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xFF24232A),
                    Color(0xFF24232A),
                  ],
                  stops: [0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Onboarding content
          SafeArea(
            child: IgnorePointer(
              ignoring: true,
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 180.setHeight,
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: onboardingItems.length,
                          onPageChanged: (index) =>
                              setState(() => _currentIndex = index),
                          itemBuilder: (context, index) {
                            final item = onboardingItems[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.setWidth,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonText(
                                    text: item.title,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22.setFontSize,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: item.description,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.setFontSize,
                                    textColor: Colors.white,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.setHeight,
                          horizontal: 30.setWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: _skip,
                              child: CommonText(
                                text: "Skip",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.setFontSize,
                                textColor: Colors.grey,
                              ),
                            ),
                            Row(
                              children: List.generate(onboardingItems.length, (
                                dotIndex,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: _currentIndex == dotIndex
                                        ? Colors.white
                                        : Colors.white38,
                                  ),
                                );
                              }),
                            ),
                            GestureDetector(
                              onTap: _nextPage,
                              child: CommonText(
                                text:
                                    _currentIndex == onboardingItems.length - 1
                                    ? "Done"
                                    : "Next",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.setFontSize,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
