import 'package:flutter/material.dart';
import 'package:step_counter_app_package/ui/water_report/pages/water_result_screen.dart';
import 'package:step_counter_app_package/ui/water_report/view/water_report_screen.dart';
import 'package:step_counter_app_package/ui/water_tracker/view/set_water_tracker_screen.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/constant.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const WaterTrackerScreen());
  }

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> implements TopBarClickListener {
  int currentGlasses = 3; // Current progress (3 out of 8 glasses)
  int targetGlasses = 8;
  double targetVolume = 2000; // ml

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtWaterTracker,
            textAlign: Alignment.centerLeft,
            isShowBack: true,
            isShowShare: true,
            isShowReport: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Daily Target Title
                  CommonText(
                    text: Languages.of(context).txtDailyTarget,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 40.setHeight),
                  // Water Glass Widget
                  Image.asset(
                    AppAssets.imgWaterGlasses,
                    width: 175.setWidth,
                    fit: BoxFit.contain,
                    gaplessPlayback: true,
                  ),
                  SizedBox(height: 40.setHeight),
                  // Glasses Counter with Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gray dots for remaining glasses

                      Container(
                        width: 24.setWidth,
                        height: 24.setHeight,
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgContainerGrayAndBlack,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: CustomAppColor.of(context).white,
                          size: 16.setWidth,
                        ),
                      ),
                      SizedBox(width: 26.setWidth),
                      // Target number
                      CommonText(
                        text: targetGlasses.toString(),
                        fontSize: 24.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 26.setWidth),
                      // Blue dot for current progress
                      Container(
                        width: 24.setWidth,
                        height: 24.setHeight,
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).colorWater,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: CustomAppColor.of(context).white,
                          size: 16.setWidth,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.setHeight),
                  // Glasses text and volume
                  CommonText(
                    text: "/ 8 Glasses",
                    fontSize: 16.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonText(
                    text: "(${targetVolume.toInt()} ml)",
                    fontSize: 16.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 60.setHeight),
                  // Set Target Button
                  InkWell(
                    onTap: () {
                      Navigator.push(context, SetWaterTrackerScreen.route());
                    },
                    child: Container(
                        width: 180.setWidth,
                        height: 45.setHeight,
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).colorWater,
                          borderRadius: BorderRadius.circular(1000),
                        ),
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
                  const SizedBox(height: 40),
                ],
              ),
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
      Navigator.push(context, WaterResultScreen.route());
    }
    if (name == Constant.strReport) {
      Navigator.push(context, WaterReportScreen.route());
    }
  }
}
