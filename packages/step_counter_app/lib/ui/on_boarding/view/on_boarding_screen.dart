import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../profile_setup/view/profile_setup_screen.dart';
import '../model/on_boarding_data_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  PageController pageController = PageController();

  List<OnBoardingDataModel> onBoardingData = [];

  _fillOnBoardingData() {
    onBoardingData = [
      OnBoardingDataModel(
        title: "Track Every Step",
        description: "Stay active every day by tracking your steps easily. Build healthy habits, improve fitness, and make every step count toward a healthier lifestyle.",
        image: AppAssets.imgOnBoarding3,
      ),
      OnBoardingDataModel(
        title: "See Your Progress",
        description: "Get detailed insights on steps, distance, and calories burned. Track your journey, measure daily progress, and stay motivated to achieve your fitness goals.",
        image: AppAssets.imgOnBoarding2,
      ),
      OnBoardingDataModel(
        title: "Achieve Your Goals",
        description: "Set daily step targets, unlock milestones, and celebrate achievements. Turn small steps into lasting results with rewards that keep you inspired and consistent.",
        image: AppAssets.imgOnBoarding1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillOnBoardingData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return Container(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                SizedBox.expand(
                    child: Image.asset(
                  onBoardingData[value].image,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                )),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomAppColor.of(context).black.withValues(alpha: 0.25),
                        CustomAppColor.of(context).black.withValues(alpha: 0.25),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 0.screenHeight / 2.4,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20.setHeight),
                        Container(
                          width: 75.setWidth,
                          height: 5.setHeight,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).white,
                            borderRadius: BorderRadius.circular(1000),
                            boxShadow: [
                              BoxShadow(
                                color: CustomAppColor.of(context).black.withValues(alpha: 0.25),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: PageView.builder(
                            itemCount: onBoardingData.length,
                            controller: pageController,
                            onPageChanged: (index) {
                              currentIndex.value = index;
                            },
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 24.setWidth,
                                  right: 24.setWidth,
                                  top: 40.setHeight,
                                  bottom: 20.setHeight,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: onBoardingData[index].title,
                                      fontSize: 24.setFontSize,
                                      fontWeight: FontWeight.w700,
                                      textColor: CustomAppColor.of(context).white,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 18.setHeight),
                                    CommonText(
                                      text: onBoardingData[index].description,
                                      fontSize: 14.setFontSize,
                                      fontWeight: FontWeight.w300,
                                      textColor: CustomAppColor.of(context).white,
                                      textAlign: TextAlign.start,
                                      maxLines: 6,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  onBoardingData.length,
                                  (index) {
                                    bool isActive = currentIndex.value == index;
                                    return AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin: EdgeInsets.symmetric(horizontal: 1.setWidth),
                                      height: 4.setHeight,
                                      width: 20.setWidth,
                                      decoration: BoxDecoration(
                                        color: isActive ? CustomAppColor.of(context).white : CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          if (isActive)
                                            BoxShadow(
                                              color: CustomAppColor.of(context).black.withValues(alpha: 0.25),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 4),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  if (pageController.page != null && (pageController.page ?? 0) < onBoardingData.length - 1) {
                                    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                  } else {
                                    Navigator.push(context, ProfileSetupScreen.route());
                                  }
                                },
                                child: Image.asset(
                                  AppAssets.icNext,
                                  height: 40.setHeight,
                                  width: 40.setHeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.bottomPadding),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
