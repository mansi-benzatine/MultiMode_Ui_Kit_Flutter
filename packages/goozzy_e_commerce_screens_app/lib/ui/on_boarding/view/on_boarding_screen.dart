import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../ui/sign_up/view/sign_up_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  final int initialIndex;
  const OnBoardingScreen({super.key, required this.initialIndex});
  static Route route({required int initialIndex}) {
    return MaterialPageRoute(builder: (context) => OnBoardingScreen(initialIndex: initialIndex));
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    currentIndex.value = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppSizes.setHeight(690),
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (value) {
                        currentIndex.value = value;
                      },
                      itemCount: onBoardingList(context).length,
                      itemBuilder: (context, index) {
                        OnboardingData mData = onBoardingList(context)[index];
                        return Column(
                          children: [
                            Image.asset(
                              mData.image!,
                              height: AppSizes.setHeight(600),
                              width: AppSizes.setHeight(488),
                              fit: BoxFit.cover,
                              gaplessPlayback: true,
                            ),
                            SizedBox(height: AppSizes.setHeight(15)),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                              child: CommonText(
                                text: mData.title?.toUpperCase() ?? "",
                                fontWeight: FontWeight.w800,
                                fontSize: AppSizes.setFontSize(24),
                                textColor: CustomAppColor.of(context).txtBlue,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSizes.setHeight(20)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
                    child: IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                          pHorizontal: AppSizes.setWidth(12),
                          width: AppSizes.setWidth(200),
                          onTap: () {
                            if (currentIndex.value < onBoardingList(context).length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              getIt.get<LocalStorageService>().setBool(LocalStorageService.isFirstTime, false);
                              Navigator.pushAndRemoveUntil(context, SignUpScreen.route(), (Route<dynamic> route) => false);
                            }
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: currentIndex.value == onBoardingList(context).length - 1 ? Languages.of(context).getStarted : Languages.of(context).next,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppSizes.setFontSize(18),
                                  textColor: CustomAppColor.of(context).white,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(20), bottom: AppSizes.setHeight(20)),
                    child: _indicatorWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicatorWidget() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
        dotColor: CustomAppColor.of(context).indicator,
        activeDotColor: CustomAppColor.of(context).txtPurple,
        dotHeight: AppSizes.setHeight(15),
        dotWidth: AppSizes.setWidth(15),
      ),
    );
  }
}
