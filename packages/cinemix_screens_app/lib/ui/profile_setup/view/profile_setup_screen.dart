import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/profile_setup/pages/add_your_finger_view.dart';
import 'package:cinemix_screens_app/ui/profile_setup/pages/choose_your_interest_page.dart';
import 'package:cinemix_screens_app/ui/profile_setup/pages/create_new_pin_page.dart';
import 'package:cinemix_screens_app/ui/profile_setup/pages/your_profile_page.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/alert_dialog/profile_setup_success_dialog.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  final int currentIndex;
  final bool isShowSuccessAlert;

  static Route<void> route({int currentIndex = 0, bool isShowSuccessAlert = false}) {
    return MaterialPageRoute(
      builder: (_) => ProfileSetupScreen(currentIndex: currentIndex, isShowSuccessAlert: isShowSuccessAlert),
    );
  }

  const ProfileSetupScreen({super.key, this.currentIndex = 0, this.isShowSuccessAlert = false});

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
  late PageController pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: widget.currentIndex);

    if (widget.isShowSuccessAlert) {
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
                child: const ProfileSetupSuccessDialog());
          },
        );
      });
    }
  }

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
                physics: NeverScrollableScrollPhysics(),
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
                        child: IgnorePointer(
                          ignoring: true,
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
                                        builder: (context) {
                                          return const ProfileSetupSuccessDialog();
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
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
