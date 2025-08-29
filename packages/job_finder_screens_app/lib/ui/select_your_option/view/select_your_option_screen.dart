import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import '../../screens_list/view/screens_list_screen.dart';
import '../../sign_in/view/sign_in_screen.dart';

class SelectYourOptionScreen extends StatefulWidget {
  const SelectYourOptionScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SelectYourOptionScreen());
  }

  @override
  State<SelectYourOptionScreen> createState() => _SelectYourOptionScreenState();
}

class _SelectYourOptionScreenState extends State<SelectYourOptionScreen> implements TopBarClickListener {
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            // Navigator.of(JobFinderScreensApp.navigatorKey.currentContext!).pop();
            Navigator.pushReplacement(
              JobFinderScreensApp.navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (_) => const ScreenListScreen(title: "Job Finder"),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: CustomAppColor.of(context).bgScreenWhite,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IgnorePointer(
                ignoring: true,
                child: TopBar(
                  this,
                  title: "",
                  isShowBack: true,
                  iconColor: CustomAppColor.of(context).bgDetailsCard,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 10.setHeight, bottom: 50.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _TitleAndDescriptionView(),
                      SizedBox(height: 60.setHeight),
                      _OptionView(isSelected: isSelected),
                    ],
                  ),
                ),
              ),
              const IgnorePointer(
                ignoring: true,
                child: _ContinueButtonView(),
              ),
            ],
          ),
        ));
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  /*void _handleBackNavigation() {
    if (Navigator.of(JobFinderScreensApp.navigatorKey.currentContext!).canPop()) {
      Navigator.of(JobFinderScreensApp.navigatorKey.currentContext!).pop();
    }
  }*/
}

class _TitleAndDescriptionView extends StatelessWidget {
  const _TitleAndDescriptionView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: "${Languages.of(context).txtSelectYour} ",
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
              textAlign: TextAlign.start,
            ),
            CommonText(
              text: Languages.of(context).txtOptions,
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtPrimaryWhite,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        CommonText(
          text: Languages.of(context).txtOptionsDesc,
          fontWeight: FontWeight.w500,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _OptionView extends StatelessWidget {
  final ValueNotifier<bool> isSelected;

  const _OptionView({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (context, value, widget) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  isSelected.value = true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: value ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).containerLightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 10.setWidth),
                  child: Column(
                    children: [
                      Image.asset(
                        value ? AppAssets.icJobSeekerSelected : AppAssets.icJobSeekerUnSelected,
                        height: 64.setHeight,
                        width: 64.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtJobSeeker,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.setFontSize,
                        textColor: value ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtSecondaryWhite,
                        textAlign: TextAlign.center,
                      ),
                      CommonText(
                        text: Languages.of(context).txtJobSeekerDesc,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.setFontSize,
                        textColor: value ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtGrey,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.setHeight),
                      Image.asset(
                        value ? AppAssets.icRadioCheck : AppAssets.icRadioUnCheck,
                        height: 24.setHeight,
                        width: 24.setHeight,
                        color: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 22.setWidth),
            Expanded(
              child: InkWell(
                onTap: () {
                  isSelected.value = false;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: (!value) ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).containerLightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 10.setWidth),
                  child: Column(
                    children: [
                      Image.asset(
                        (!value) ? AppAssets.icCompanySelected : AppAssets.icCompanyUnSelected,
                        height: 64.setHeight,
                        width: 64.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtCompany,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.setFontSize,
                        textColor: (!value) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtSecondaryWhite,
                        textAlign: TextAlign.center,
                      ),
                      CommonText(
                        text: Languages.of(context).txtCompanyDesc,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.setFontSize,
                        textColor: (!value) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtGrey,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.setHeight),
                      Image.asset(
                        (!value) ? AppAssets.icRadioCheck : AppAssets.icRadioUnCheck,
                        height: 24.setHeight,
                        width: 24.setHeight,
                        color: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  const _ContinueButtonView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          text: Languages.of(context).txtContinue,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, SignInScreen.route());
          },
        ),
      ),
    );
  }
}
