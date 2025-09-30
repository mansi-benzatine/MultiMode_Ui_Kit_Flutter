import 'package:flutter/material.dart';
import 'package:step_counter_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../pages/dob_page.dart';
import '../pages/gender_page.dart';
import '../pages/goal_page.dart';
import '../pages/height_page.dart';
import '../pages/language_page.dart';
import '../pages/set_reminder_page.dart';
import '../pages/weight_page.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ProfileSetupScreen());
  }

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final PageController _pageController = PageController();

  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final int stepperLenght = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Column(
            children: [
              SizedBox(height: 25.setHeight),
              _stepperIndicator(),
              SizedBox(
                height: 600.setHeight,
                child: PageView(
                  onPageChanged: (value) {
                    currentPage.value = value;
                  },
                  controller: _pageController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    GenderPage(),
                    WeightPage(),
                    HeightPage(),
                    DOBPage(),
                    LanguagePage(),
                    GoalPage(),
                    SetReminderPage(),
                  ],
                ),
              ),
              SizedBox(height: 10.setHeight),
              _nextButtonView(),
              SizedBox(height: 10.setHeight),
            ],
          ),
        ),
      ),
    );
  }

  _stepperIndicator() {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            stepperLenght,
            (index) => Row(
              children: [
                Container(
                  width: 13.setHeight,
                  height: 13.setHeight,
                  decoration: BoxDecoration(
                    color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark,
                    shape: BoxShape.circle,
                  ),
                ),
                if (index != stepperLenght - 1)
                  Container(
                    color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark,
                    width: 14.setWidth,
                    height: value >= index ? 2.setHeight : 1.setHeight,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  _nextButtonView() {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Row(
          children: [
            if (value != 0 && value != stepperLenght - 1)
              InkWell(
                onTap: () {
                  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                child: Image.asset(
                  AppAssets.icPreviousProfileSetup,
                  height: 50.setHeight,
                  width: 50.setHeight,
                ),
              ),
            const Spacer(),
            if (value != 0 && value != stepperLenght - 1)
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, DashboardScreen.route(), (route) => false);
                },
                child: CommonText(
                  text: Languages.of(context).txtSkip,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.center,
                ),
              ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (value == stepperLenght - 1) {
                  Navigator.pushAndRemoveUntil(context, DashboardScreen.route(), (route) => false);
                } else {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }
              },
              child: Image.asset(
                (value != stepperLenght - 1) ? AppAssets.icNextProfileSetup : AppAssets.icDoneProfileSetup,
                height: 50.setHeight,
                width: 50.setHeight,
              ),
            ),
          ],
        );
      },
    );
  }
}
