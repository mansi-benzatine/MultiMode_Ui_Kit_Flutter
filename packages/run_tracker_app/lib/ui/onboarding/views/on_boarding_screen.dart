import 'package:flutter/material.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/ui/fill_information/views/fill_information_screen.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/text/common_text.dart';

import '../datamodels/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

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
      Navigator.push(context, FillInformationScreen.route());
    }
  }

  void _skip() {}

  void fillData() {
    onboardingItems = [
      OnboardingItem(
        image: AppAssets.imgOnBoarding1,
        title: Languages.of(context).txtOnboarding1,
        description: Languages.of(context).txtOnboarding1Desc,
      ),
      OnboardingItem(
        image: AppAssets.imgOnBoarding2,
        title: Languages.of(context).txtOnboarding2,
        description: Languages.of(context).txtOnboarding2Desc,
      ),
      OnboardingItem(
        image: AppAssets.imgOnBoarding3,
        title: Languages.of(context).txtOnboarding3,
        description: Languages.of(context).txtOnboarding3Desc,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              onboardingItems[_currentIndex].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                    CustomAppColor.of(context).primary,
                    CustomAppColor.of(context).primary,
                  ],
                  stops: [0.6, 0.7, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 150.setHeight,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: onboardingItems.length,
                        onPageChanged: (index) =>
                            setState(() => _currentIndex = index),
                        itemBuilder: (context, index) {
                          final item = onboardingItems[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.setWidth,
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
                              fontWeight: FontWeight.w400,
                              fontSize: 14.setFontSize,
                              textColor: Colors.white,
                            ),
                          ),
                          Row(
                            children: List.generate(onboardingItems.length, (
                              dotIndex,
                            ) {
                              final bool isActive = _currentIndex == dotIndex;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: isActive ? 25.setWidth : 5.setWidth,
                                  height: 5.setHeight,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? Colors.white
                                        : Colors.black.withValues(alpha: 0.24),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            }),
                          ),

                          GestureDetector(
                            onTap: _nextPage,
                            child: Image.asset(
                              AppAssets.icGreenRoundNavigator,
                              width: 40.setWidth,
                              height: 40.setHeight,
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
        ],
      ),
    );
  }
}
