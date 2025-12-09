import 'package:flowly_screens_app/ui/profile_setup/pages/your_birthday_page.dart';
import 'package:flowly_screens_app/ui/profile_setup/pages/your_cycle_length_page.dart';
import 'package:flowly_screens_app/ui/profile_setup/pages/your_goal_page.dart';
import 'package:flowly_screens_app/ui/profile_setup/pages/your_last_date_of_period_view.dart';
import 'package:flowly_screens_app/ui/profile_setup/pages/your_period_length_page.dart';
import 'package:flowly_screens_app/ui/profile_setup/pages/your_relationship_status_page.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/progress_indicator/progress_indicator_view.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../pages/your_height_page.dart';
import '../pages/your_profile_page.dart';
import '../pages/your_weight_page.dart';

class ProfileSetupScreen extends StatefulWidget {
  final int currentIndex;
  final bool isShowPreparingLoader;

  const ProfileSetupScreen({super.key, this.currentIndex = 0, this.isShowPreparingLoader = false});

  static Route<dynamic> route({int currentIndex = 0, bool isShowPreparingLoader = false}) {
    return MaterialPageRoute(
      builder: (context) => ProfileSetupScreen(
        currentIndex: currentIndex,
        isShowPreparingLoader: isShowPreparingLoader,
      ),
    );
  }

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> implements TopBarClickListener {
  late PageController _pageController;
  final ValueNotifier<int> currentPage = ValueNotifier(0);
  final int stepperLength = 9;

  @override
  void initState() {
    super.initState();
    currentPage.value = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
    if (widget.isShowPreparingLoader) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const DownloadAlertDialog());
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 0.screenWidth,
            height: 0.screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomAppColor.of(context).pinkBg,
                  CustomAppColor.of(context).yellowBg,
                  CustomAppColor.of(context).lightYellowBg,
                ],
                stops: const [0.1, 0.2, 0.3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              _stepperIndicator(),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    currentPage.value = value;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const [
                    YourProfilePage(),
                    YourBirthdayPage(),
                    YourPeriodLengthPage(),
                    YourCycleLengthPage(),
                    YourWeightPage(),
                    YourHeightPage(),
                    YourRelationshipStatusPage(),
                    YourGoalPage(),
                    YourLastDateOfPeriodView(),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: currentPage,
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtNext,
                        onTap: () {
                          if (value == stepperLength - 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const DownloadAlertDialog();
                              },
                            );
                          } else {
                            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }
                        },
                        buttonColor: CustomAppColor.of(context).btnPrimary,
                        borderColor: CustomAppColor.of(context).btnPrimary,
                        height: 45.setHeight,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 10.setHeight),
            ],
          ),
        ],
      ),
    );
  }

  _stepperIndicator() {
    return Padding(
      padding: EdgeInsets.only(top: 60.setHeight, right: 20.setWidth, left: 20.setWidth),
      child: Row(
        children: [
          IgnorePointer(
            ignoring: true,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: currentPage,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    stepperLength,
                    (index) => Row(
                      children: [
                        if (index != stepperLength)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                            child: Container(
                              width: 0.screenWidth / 17,
                              height: 3.setHeight,
                              decoration: BoxDecoration(
                                color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).whiteGreyIndicator,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: currentPage,
              builder: (context, value, child) {
                return CommonText(
                  text: "${currentPage.value + 1}/$stepperLength",
                  fontFamily: Constant.fontFamilyMulishBold700,
                  fontSize: 16.setFontSize,
                );
              })
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      if (currentPage.value == 0) {
        Navigator.pop(context);
      } else {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
