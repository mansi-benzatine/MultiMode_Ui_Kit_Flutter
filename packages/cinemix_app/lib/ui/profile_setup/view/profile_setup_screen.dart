import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/profile_setup/pages/add_your_finger_view.dart';
import 'package:cinemix_app/ui/profile_setup/pages/choose_your_interest_page.dart';
import 'package:cinemix_app/ui/profile_setup/pages/create_new_pin_page.dart';
import 'package:cinemix_app/ui/profile_setup/pages/your_profile_page.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/alert_dialog/profile_setup_success_dialog.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ProfileSetupScreen());
  }

  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> implements TopBarClickListener {
  List<Widget> pageview = [
    const ChooseInterestScreen(),
    const YourProfilePage(),
    const CreateNewPinPage(),
    const AddYourFingerView(),
  ];
  final PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: _currentIndex == 0
                  ? Languages.of(context).txtChooseYourInterest
                  : _currentIndex == 1
                      ? Languages.of(context).txtYourProfile
                      : _currentIndex == 2
                          ? Languages.of(context).txtCreateNewPin
                          : Languages.of(context).txtAddYourFingerprint,
              isShowBack: true,
            ),
            Expanded(
              child: PageView.builder(
                itemCount: pageview.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(child: pageview[index]),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtSkip,
                                onTap: () {
                                  setState(() {
                                    pageController.jumpToPage(3);
                                  });
                                },
                                buttonColor: CustomAppColor.of(context).btnGrey,
                                buttonTextColor: CustomAppColor.of(context).txtGray,
                                borderColor: CustomAppColor.of(context).btnGrey,
                              ),
                            ),
                            SizedBox(width: 15.setWidth),
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtContinue,
                                onTap: () {
                                  if (_currentIndex < pageview.length - 1) {
                                    pageController.nextPage(
                                      duration: const Duration(milliseconds: 400),
                                      curve: Curves.decelerate,
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return ProfileSetupSuccessDialog(parentContext: context);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
