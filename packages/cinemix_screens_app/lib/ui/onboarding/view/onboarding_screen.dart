import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/get_started/view/get_started_screen.dart';
import 'package:cinemix_screens_app/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;

  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (_) => OnboardingScreen(currentIndex: currentIndex));
  }

  const OnboardingScreen({super.key, this.currentIndex = 0});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingData> onboardingList = [];
  int _currentIndex = 0;
  late PageController pageController;

  void fillData() {
    onboardingList = [
      OnboardingData(
        image: AppAssets.imgOnboarding1,
        title: Languages.of(context).txtOnBoarding1,
        subTitle: Languages.of(context).txtOnBoarding1Desc,
      ),
      OnboardingData(
        image: AppAssets.imgOnboarding2,
        title: Languages.of(context).txtOnBoarding2,
        subTitle: Languages.of(context).txtOnBoarding2Desc,
      ),
      OnboardingData(
        image: AppAssets.imgOnboarding3,
        title: Languages.of(context).txtOnBoarding3,
        subTitle: Languages.of(context).txtOnBoarding3Desc,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;

    pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingList.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = onboardingList[index];
                return Stack(
                  children: [
                    Image.asset(
                      item.image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.01),
                              CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.9),
                              CustomAppColor.of(context).bgLinearShadow,
                              CustomAppColor.of(context).bgLinearShadow,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.4, 0.6, 0.9],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 110.setHeight),
                              CommonText(
                                text: item.title,
                                fontSize: 28.setFontSize,
                                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                              ),
                              SizedBox(height: 20.setHeight),
                              CommonText(
                                text: item.subTitle,
                                textColor: CustomAppColor.of(context).txtGray,
                                fontSize: 14.setFontSize,
                                fontFamily: Constant.fontFamilyClashGroteskRegular400,
                              ),
                              SizedBox(height: 20.setHeight),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 105.setWidth),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_currentIndex < onboardingList.length - 1) {
                                      pageController.nextPage(
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.decelerate,
                                      );
                                    } else {
                                      Navigator.push(context, GetStartedScreen.route());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: CustomAppColor.of(context).primary, borderRadius: BorderRadius.circular(100)),
                                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CommonText(
                                          text: Languages.of(context).txtNext,
                                          fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
                                          fontSize: 16.setFontSize,
                                          textColor: CustomAppColor.of(context).white,
                                        ),
                                        SizedBox(width: 10.setWidth),
                                        Icon(
                                          Icons.arrow_forward_sharp,
                                          color: CustomAppColor.of(context).white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.setHeight),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: List.generate(
                                      onboardingList.length,
                                      (dotIndex) => AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        height: 5.setHeight,
                                        width: _currentIndex == dotIndex ? 12.setWidth : 5.setWidth,
                                        decoration: BoxDecoration(
                                          color: _currentIndex == dotIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).hintText,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pageController.jumpToPage(2);
                                    },
                                    child: CommonText(
                                      text: Languages.of(context).txtSkip,
                                      textColor: CustomAppColor.of(context).txtGray,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 60.setHeight),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
