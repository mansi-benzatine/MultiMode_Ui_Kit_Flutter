import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/ui/onboarding/datamodel/onboarding_data.dart';
import 'package:flowly_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
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
    AppAssets.refreshAssets(context);
    _currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Image.asset(AppAssets.imgBgNavbar),
                Positioned(
                  top: -15.setHeight,
                  child: IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).btnNavigation,
                            border: Border.all(
                              color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFFC8C8).withValues(alpha: 0.4),
                                offset: const Offset(0, 1),
                                blurRadius: 10,
                                spreadRadius: 0,
                              )
                            ]),
                        height: 70.setHeight,
                        width: 70.setWidth,
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          size: 36,
                          color: CustomAppColor.of(context).icWhitePrimary,
                        ),
                      ),
                      onTap: () {
                        if (_currentIndex < onboardingList.length - 1) {
                          pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                        } else {
                          Navigator.push(context, ProfileSetupScreen.route());
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      item.image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 110.setHeight),
                            CommonText(
                              text: item.title,
                              fontSize: 24.setFontSize,
                              fontFamily: Constant.fontFamilyMulishExtraBold800,
                            ),
                            SizedBox(height: 10.setHeight),
                            CommonText(
                              text: item.subTitle,
                              textColor: CustomAppColor.of(context).txtGray,
                              fontSize: 14.setFontSize,
                            ),
                            SizedBox(height: 10.setHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: List.generate(
                                    onboardingList.length,
                                    (dotIndex) => AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      height: 5.setHeight,
                                      width: _currentIndex == dotIndex ? 24.setWidth : 5.setWidth,
                                      decoration: BoxDecoration(
                                        color: _currentIndex == dotIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).hintText,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 90.setHeight),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
