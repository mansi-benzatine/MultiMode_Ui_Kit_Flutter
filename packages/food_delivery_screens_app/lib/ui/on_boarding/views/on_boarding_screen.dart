import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/ui/login_and_signup/views/login_and_signup_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../data_model/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  final int currentIndex;
  const OnBoardingScreen({super.key, required this.currentIndex});

  static Route<void> route({required int currentIndex}) {
    return MaterialPageRoute(builder: (_) => OnBoardingScreen(currentIndex: currentIndex));
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

    currentIndex.value = widget.currentIndex;
  }

  void _fillData() {
    setState(() {
      onBoardingList = [
        OnBoardingDataModel(
          title1: Languages.of(context).txtSearchBestFood,
          image: AppAssets.imgOnBoarding1,
          description: Languages.of(context).txtOnBoardingDesc,
        ),
        OnBoardingDataModel(
          title1: Languages.of(context).txtOrderNow,
          image: AppAssets.imgOnBoarding2,
          description: Languages.of(context).txtOnBoardingDesc,
        ),
        OnBoardingDataModel(
          title1: Languages.of(context).txtFastDelivered,
          image: AppAssets.imgOnBoarding3,
          description: Languages.of(context).txtOnBoardingDesc,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: IgnorePointer(
          ignoring: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55.setWidth, vertical: 20.setHeight),
                child: Image.asset(AppAssets.imgAppNameLogo),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardingList.length,
                  onPageChanged: (index) {
                    currentIndex.value = index;
                  },
                  itemBuilder: (context, index) {
                    final item = onBoardingList[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          item.image,
                          height: 375.setHeight,
                          width: 375.setWidth,
                          fit: BoxFit.contain,
                        ),
                        CommonText(
                          text: item.title1,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                        ),
                        SizedBox(height: 8.setHeight),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
                          child: CommonText(
                            text: "̆Lorem Ipsum is simply dummy text of the printing and typesetting industry.Ready to order from top restaurants?",
                            fontSize: 12.setFontSize,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 8.setHeight),
              ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      onBoardingList.length,
                      (index) {
                        final isActive = index == value;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
                          width: isActive ? 26.setWidth : 14.setWidth,
                          height: 2.setHeight,
                          decoration: isActive
                              ? BoxDecoration(
                                  color: CustomAppColor.of(context).primary,
                                  borderRadius: BorderRadius.circular(2),
                                )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: CustomAppColor.of(context).pageIndicator,
                                ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 40.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtLogin.toUpperCase(),
                  onTap: () => Navigator.push(context, LoginAndSignupScreen.route()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
