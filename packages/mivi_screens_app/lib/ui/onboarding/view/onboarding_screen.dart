import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

import '../../get_start/views/get_start_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;

  const OnboardingScreen({super.key, this.currentIndex = 0});

  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(
      builder: (_) => OnboardingScreen(currentIndex: currentIndex),
    );
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentIndex.value = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final items = onboardingList(context);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: IgnorePointer(
          ignoring: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentIndex,
                  builder: (context, value, _) {
                    final lastIndex = onboardingList(context).length - 1;
                    if (value == lastIndex) {
                      return IgnorePointer(
                        ignoring: true,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.setWidth, top: 60.setHeight, bottom: 30.setHeight),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, GetStartScreen.route());
                            },
                            child: Image.asset(
                              AppAssets.icRightDoubleArrow,
                              color: CustomAppColor.of(context).icBlackWhite,
                              height: 26.setHeight,
                              width: 26.setWidth,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 120.setHeight,
                      );
                    }
                  },
                ),
              ),
              NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification.metrics is PageMetrics) {
                    final metrics = scrollNotification.metrics as PageMetrics;
                    final page = metrics.page?.round() ?? 0;
                    if (_currentIndex.value != page) {
                      _currentIndex.value = page;
                    }
                  }
                  return false;
                },
                child: FanCarouselImageSlider.sliderType1(
                  imagesLink: items.map((e) => e.image).toList(),
                  isAssets: true,
                  autoPlay: false,
                  currentItemShadow: const [],
                  expandFitAndZoomable: false,
                  imageFitMode: BoxFit.fill,
                  userCanDrag: true,
                  showIndicator: false,
                  isClickable: false,
                  sidesOpacity: 0.4,
                  imageRadius: 32,
                  slideViewportFraction: 0.80,
                  initalPageIndex: _currentIndex.value,
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(items.length, (index) {
                      final isActive = index == value;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
                        height: 4.setHeight,
                        width: isActive ? 24.setWidth : 4.setWidth,
                        decoration: BoxDecoration(
                          color: isActive ? CustomAppColor.of(context).primary : CustomAppColor.of(context).grey.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 20.setHeight),
              SizedBox(height: 10.setHeight),
              ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, value, _) {
                  final item = items[value];
                  return Column(
                    children: [
                      CommonText(
                        text: item.heading,
                        fontSize: 24.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                        child: CommonText(
                          text: item.descrption,
                          fontSize: 12.setFontSize,
                          height: 1.6,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.setHeight),
            ],
          ),
        ),
      ),
    );
  }
}
