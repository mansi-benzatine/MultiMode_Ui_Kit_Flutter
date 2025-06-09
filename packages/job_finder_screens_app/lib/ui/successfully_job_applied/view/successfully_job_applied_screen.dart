import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
import '../../applied_job_details/view/applied_job_details_screen.dart';
import '../../dashboard/view/dashboard_screen.dart';

class SuccessfullyJobAppliedScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SuccessfullyJobAppliedScreen());
  }

  const SuccessfullyJobAppliedScreen({super.key});

  @override
  State<SuccessfullyJobAppliedScreen> createState() => _SuccessfullyJobAppliedScreenState();
}

class _SuccessfullyJobAppliedScreenState extends State<SuccessfullyJobAppliedScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              title: Languages.of(context).txtConfirmation,
              isShowTitle: true,
              isShowBack: true,
              textColor: CustomAppColor.of(context).txtSecondary,
            ),
          ),
          const Expanded(
            child: _ConfirmationView(),
          ),
          IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _ContinueButtonView(
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    DashboardScreen.route(
                        isFromEmptyMessage: false,
                        isFromHome: false,
                        isFromApplication: false,
                        isFromMessage: false,
                        isFromProfile: false,
                        isFromSavedJobs: false),
                    (route) => false),
              ),
            ),
          )
        ],
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

class _ConfirmationView extends StatelessWidget {
  const _ConfirmationView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.imgSuccessfullyJobApplied,
            height: 254.setHeight,
            width: 254.setWidth,
          ),
          CommonText(
            text: Languages.of(context).txtYouHaveAppliedJobSuccessful,
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(context).txtYouHaveAppliedJobSuccessfulDesc,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  final Function()? onTap;
  const _ContinueButtonView({this.onTap});

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
            color: CustomAppColor.of(context).black..withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            CommonButton(
              onTap: onTap,
              text: Languages.of(context).txtBackToHome,
              buttonTextSize: 18.setFontSize,
              buttonTextWeight: FontWeight.w500,
              buttonColor: CustomAppColor.of(context).txtSecondary,
            ),
            SizedBox(height: 15.setHeight),
            CommonOutlineButton(
              onTap: () => Navigator.push(context, AppliedJobDetailsScreen.route()),
              text: Languages.of(context).txtShowTrackApplication,
              buttonBorderColor: CustomAppColor.of(context).secondary,
              buttonTextColor: CustomAppColor.of(context).txtSecondary,
              buttonColor: CustomAppColor.of(context).bgScreenWhite,
            ),
          ],
        ),
      ),
    );
  }
}
