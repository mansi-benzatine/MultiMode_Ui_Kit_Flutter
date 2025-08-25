import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/constant.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../dialogs/alerts/profile_setup_congratulation_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../pages/your_age_page.dart';
import '../pages/your_gender_page.dart';
import '../pages/your_goles_page.dart';
import '../pages/your_height_page.dart';
import '../pages/your_profile_page.dart';
import '../pages/your_targated_weight_page.dart';
import '../pages/your_weight_page.dart';
import '../pages/your_yoga_level_page.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const ProfileSetupScreen());
  }

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> implements TopBarClickListener {
  final PageController _pageController = PageController();

  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final int stepperLenght = 8;

  _getTopBarTitle() {
    if (currentPage.value == 0) {
      return Languages.of(context).txtYourGender;
    } else if (currentPage.value == 1) {
      return Languages.of(context).txtYourProfile;
    } else if (currentPage.value == 2) {
      return Languages.of(context).txtYourYogaLevel;
    } else if (currentPage.value == 3) {
      return Languages.of(context).txtYourGoals;
    } else if (currentPage.value == 4) {
      return Languages.of(context).txtYourAge;
    } else if (currentPage.value == 5) {
      return Languages.of(context).txtYourWeight;
    } else if (currentPage.value == 6) {
      return Languages.of(context).txtYourTargetedWeight;
    } else if (currentPage.value == 7) {
      return Languages.of(context).txtYourHeight;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, value, child) {
              return TopBar(
                this,
                title: _getTopBarTitle(),
              );
            },
          ),
          _stepperIndicator(),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                currentPage.value = value;
              },
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                YourGenderPage(),
                YourProfilePage(),
                YourYogaLevelPage(),
                YourGoalsPage(),
                YourAgePage(),
                YourWeightPage(),
                YourTargatedWeightPage(),
                YourHeightPage(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtSkip,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, DashboardScreen.route(), (route) => false);
                    },
                    buttonColor: CustomAppColor.of(context).bgScreen,
                    borderColor: CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                    borderWidth: 2,
                    height: 45.setHeight,
                    radius: 18,
                    buttonTextColor: CustomAppColor.of(context).txtDarkGray,
                    buttonTextWeight: FontWeight.w500,
                    buttonFontFamily: Constant.fontFamilyMedium500,
                  ),
                ),
                SizedBox(width: 12.setWidth),
                ValueListenableBuilder(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    return Expanded(
                      child: CommonButton(
                        text: Languages.of(context).txtContinue,
                        onTap: () {
                          if (value == stepperLenght - 1) {
                            ProfileSetupCongratulationDialog.show(context, onTap: () {
                              Navigator.pushAndRemoveUntil(context, DashboardScreen.route(), (route) => false);
                            });
                          } else {
                            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }
                        },
                        buttonColor: CustomAppColor.of(context).primary,
                        borderColor: CustomAppColor.of(context).borderColor,
                        borderWidth: 3,
                        height: 45.setHeight,
                        radius: 18,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.setHeight),
        ],
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
                  width: 25.setHeight,
                  height: 25.setHeight,
                  decoration: BoxDecoration(
                    color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).setpperUnSelected,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: CommonText(
                      text: (index + 1).toString(),
                      fontSize: 12.setFontSize,
                      fontWeight: value >= index ? FontWeight.w700 : FontWeight.w500,
                      fontFamily: value >= index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                      textColor: value >= index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGrayAndPrimary,
                    ),
                  ),
                ),
                if (index != stepperLenght - 1)
                  Container(
                    color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).setpperUnSelected,
                    width: 18.setWidth,
                    height: value >= index ? 2.5.setHeight : 1.setHeight,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      if (currentPage.value == 0) {
        Navigator.pop(context);
      } else {
        _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    }
  }
}
