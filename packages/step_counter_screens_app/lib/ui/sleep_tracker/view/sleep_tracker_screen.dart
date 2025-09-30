import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/set_sleep_target/view/set_sleep_target.dart';
import 'package:step_counter_screens_app_package/ui/sleep_manually_record/view/sleep_manually_record_screen.dart';
import 'package:step_counter_screens_app_package/ui/sleep_report/view/sleep_report_screen.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../sleep_report/pages/sleep_result_screen.dart';

class SleepTrackerScreen extends StatefulWidget {
  const SleepTrackerScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SleepTrackerScreen());
  }

  @override
  State<SleepTrackerScreen> createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSleepTracker,
            textAlign: Alignment.centerLeft,
            isShowBack: true,
            isShowShare: true,
            isShowReport: true,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 0.screenHeight * 0.05),
                CommonText(
                  text: Languages.of(context).txtDailyTarget,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  height: 1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.setHeight),
                CommonText(
                  text: Languages.of(context).txtDashHoursMinutes,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  height: 1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.setHeight),
                Image.asset(
                  AppAssets.imgWatch,
                  width: 200.setWidth,
                  fit: BoxFit.contain,
                  gaplessPlayback: true,
                ),
                SizedBox(height: 30.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
                  child: CommonText(
                    text: Languages.of(context).txtRecordYourSleepMsg,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontFamily: Constant.fontFamily,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, SetSleepTargetScreen.route());
                    },
                    child: Container(
                        width: 180.setWidth,
                        height: 45.setHeight,
                        decoration: BoxDecoration(color: CustomAppColor.of(context).colorTimes, borderRadius: BorderRadius.circular(1000)),
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        alignment: Alignment.center,
                        child: CommonText(
                          text: Languages.of(context).txtSetTarget.toUpperCase(),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                          fontFamily: Constant.fontFamily,
                          height: 1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
                SizedBox(height: 15.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, SleepManuallyRecordScreen.route());
                    },
                    child: Container(
                        decoration: BoxDecoration(color: CustomAppColor.of(context).colorTimes, borderRadius: BorderRadius.circular(1000)),
                        alignment: Alignment.center,
                        width: 180.setWidth,
                        height: 45.setHeight,
                        child: CommonText(
                          text: Languages.of(context).txtRecordManually.toUpperCase(),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                          fontFamily: Constant.fontFamily,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strShare) {
      Navigator.push(context, SleepResultScreen.route());
    }
    if (name == Constant.strReport) {
      Navigator.push(context, SleepReportScreen.route());
    }
  }
}
