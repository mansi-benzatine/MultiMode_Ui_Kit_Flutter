import 'package:flutter/material.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/ui/on_boarding/datamodel/on_boarding_data.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/sizer_utils.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../login_or_signup/view/login_or_signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
  }

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int selectedIndex = 0;
  List<OnBoardingData> onboardingList = [];

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  void _fillData() {
    onboardingList = [
      OnBoardingData(
        image: AppAssets.imgOnboarding1,
        descrption: Languages.of(context).txtOnboarding1Desc,
        heading: Languages.of(context).txtOnboarding1,
        bgColor: const Color(0xFFFED060),
      ),
      OnBoardingData(
        image: AppAssets.imgOnboarding2,
        descrption: Languages.of(context).txtOnboarding2Desc,
        heading: Languages.of(context).txtOnboarding2,
        bgColor: const Color(0xFFF8988C),
      ),
      OnBoardingData(
        image: AppAssets.imgOnboarding3,
        descrption: Languages.of(context).txtOnboarding3Desc,
        heading: Languages.of(context).txtOnboarding3,
        bgColor: const Color(0xFFA8E8E8),
      ),
    ];
  }

  Offset _beginOffsetForPage(int page) {
    switch (page) {
      case 0:
        return const Offset(1.0, 1.0);
      case 1:
        return const Offset(-1.0, 1.0);
      case 2:
        return const Offset(0.0, 1.0);
      default:
        return const Offset(0.0, 1.0);
    }
  }

  void _startAnimationForPage(int page) {
    _slideAnimation = _animationController.drive(
      Tween<Offset>(begin: _beginOffsetForPage(page), end: Offset.zero).chain(CurveTween(curve: Curves.easeOut)),
    );

    _animationController.reset();
    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slideAnimation = _animationController.drive(
      Tween<Offset>(begin: _beginOffsetForPage(selectedIndex), end: Offset.zero).chain(CurveTween(curve: Curves.easeOut)),
    );
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (onboardingList.isEmpty) _fillData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          itemCount: onboardingList.length,
          onPageChanged: (newPage) {
            if (newPage < 3) {
              setState(() => selectedIndex = newPage);
              _startAnimationForPage(newPage);
            } else {}
          },
          itemBuilder: (context, index) {
            final item = onboardingList[index];
            return Container(
              color: item.bgColor,
              child: Stack(
                children: [
                  Positioned(
                    left: index == 2 ? 20 : 0,
                    right: index == 2 ? 20 : 0,
                    bottom: 0,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Image.asset(
                        item.image,
                        height: index == 2
                            ? 480.setHeight
                            : index == 1
                                ? 460.setHeight
                                : 460.setHeight,
                        fit: index == 2 ? BoxFit.contain : BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: CommonText(
                          text: item.heading,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).black,
                          fontFamily: Constant.fontFamilyBold700,
                          fontSize: 40.setFontSize,
                          textAlign: TextAlign.start,
                          height: 0.96,
                        ),
                      ),
                      SizedBox(height: 12.setHeight),
                      Padding(
                        padding: EdgeInsets.only(left: 20.setWidth, right: 30.setWidth),
                        child: CommonText(
                          text: item.descrption,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).black,
                          fontSize: 13.setFontSize,
                          textAlign: TextAlign.start,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      Padding(
                        padding: EdgeInsets.only(left: 20.setWidth, right: 30.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(onboardingList.length, (dotIndex) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
                              height: 8.setHeight,
                              width: selectedIndex == dotIndex ? 20.setWidth : 8.setWidth,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: selectedIndex == dotIndex ? Colors.black : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex < onboardingList.length - 1) {
                              setState(() {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              });
                            } else {
                              Navigator.push(context, LoginOrSignupScreen.route());
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: CustomAppColor.of(context).black,
                              ),
                            ),
                            padding: EdgeInsets.all(6.setHeight),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
