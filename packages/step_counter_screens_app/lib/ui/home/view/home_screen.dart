import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/achivements/view/achivements_screen.dart';
import 'package:step_counter_screens_app_package/ui/distance_report/view/distance_report_screen.dart';
import 'package:step_counter_screens_app_package/ui/sleep_tracker/view/sleep_tracker_screen.dart';
import 'package:step_counter_screens_app_package/ui/step_report/view/step_report_screen.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';
import 'package:step_counter_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../calories_report/view/calories_report_screen.dart';
import '../../water_tracker/view/water_tracker_screen.dart';
import '../model/progress_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements TopBarClickListener {
  List<ProgressDataModel> progressDataList = [];

  _fillData() {
    progressDataList = [
      ProgressDataModel(
        title: Languages.of(context).txtTotalSteps,
        value: "4800",
        unit: Languages.of(context).txtSteps,
        icon: AppAssets.icSteps,
        color: CustomAppColor.of(context).colorSteps,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerSteps,
        containerColor: CustomAppColor.of(context).colorContainerSteps,
      ),
      ProgressDataModel(
        title: Languages.of(context).txtTotalCalories,
        value: "565",
        unit: Languages.of(context).txtKcal,
        icon: AppAssets.icCalories,
        color: CustomAppColor.of(context).colorCalories,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerCalories,
        containerColor: CustomAppColor.of(context).colorContainerCalories,
      ),
      ProgressDataModel(
        title: Languages.of(context).txtTotalDistance,
        value: "55.88",
        unit: Languages.of(context).txtKm,
        icon: AppAssets.icDistance,
        color: CustomAppColor.of(context).colorDistance,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerDistance,
        containerColor: CustomAppColor.of(context).colorContainerDistance,
      ),
      ProgressDataModel(
        title: Languages.of(context).txtTotalSleep,
        value: "07:30",
        unit: "Hrs:Min",
        icon: AppAssets.icSleep,
        color: CustomAppColor.of(context).colorTimes,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerTimes,
        containerColor: CustomAppColor.of(context).colorContainerTimes,
      ),
      ProgressDataModel(
        title: Languages.of(context).txtTotalWater,
        value: "300",
        unit: Languages.of(context).txtML,
        icon: AppAssets.icWater,
        color: CustomAppColor.of(context).colorWater,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerWater,
        containerColor: CustomAppColor.of(context).colorContainerWater,
      ),
      ProgressDataModel(
        title: Languages.of(context).txtTotalAchievements,
        value: "12",
        unit: Languages.of(context).txtMedal,
        icon: AppAssets.icAchievements,
        color: CustomAppColor.of(context).colorAchievements,
        containerBgColor: CustomAppColor.of(context).colorHomeContainerAchievements,
        containerColor: CustomAppColor.of(context).colorContainerAchievements,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBar(
          this,
          isShowBack: false,
          textAlign: Alignment.topLeft,
          title: Languages.of(context).txtHome,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 0.setHeight, bottom: 20.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _progressChartView(),
                // SizedBox(height: 25.setHeight),
                _progressView(),
                SizedBox(height: 25.setHeight),
                Column(
                  children: List.generate(
                    progressDataList.length,
                    (index) => _itemDetailsView(
                      title: progressDataList[index].title,
                      value: progressDataList[index].value,
                      unit: progressDataList[index].unit,
                      icon: progressDataList[index].icon,
                      color: progressDataList[index].color,
                      containerBgcolor: progressDataList[index].containerBgColor,
                      containerColor: progressDataList[index].containerColor,
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(context, StepReportScreen.route());
                        } else if (index == 1) {
                          Navigator.push(context, CaloriesReportScreen.route());
                        } else if (index == 2) {
                          Navigator.push(context, DistanceReportScreen.route());
                        } else if (index == 3) {
                          Navigator.push(context, SleepTrackerScreen.route());
                        } else if (index == 4) {
                          Navigator.push(context, WaterTrackerScreen.route());
                        } else if (index == 5) {
                          Navigator.push(context, AchivementsScreen.route());
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _progressChartView() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 240.setHeight,
          width: 0.screenWidth,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 6000,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.18,
                  cornerStyle: CornerStyle.bothCurve,
                  color: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: 4655,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.18,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: CustomAppColor.of(context).primary,
                    enableAnimation: true,
                    animationDuration: 1500,
                    animationType: AnimationType.easeOutBack,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0,
                    angle: 90,
                    widget: Container(
                      height: (240 - 70).setHeight,
                      width: (240 - 70).setHeight,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomAppColor.of(context).primary.withValues(alpha: 0.15),
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 18.setHeight),
                          Image.asset(
                            AppAssets.icFootStep,
                            height: 36.setHeight,
                            width: 36.setHeight,
                          ),
                          SizedBox(height: 12.setHeight),
                          CommonText(
                            text: "4,655",
                            fontSize: 35.setFontSize,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.30,
                            textColor: CustomAppColor.of(context).txtBlack,
                            height: 1.2,
                          ),
                          CommonText(
                            text: Languages.of(context).txtStep,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30.setHeight),
          padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 18.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(1000),
            border: Border.all(
              color: CustomAppColor.of(context).borderColorPrimary,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.04),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CommonText(
            text: "${Languages.of(context).txtGoal}: 6000".toUpperCase(),
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtPrimary,
          ),
        ),
      ],
    );
  }

  _progressView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.icFire,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "400 ${Languages.of(context).txtKcal}",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 3.setHeight),
                  CommonText(
                    text: Languages.of(context).txtCalories,
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.3,
                    textColor: CustomAppColor.of(context).txtDarkGray,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight),
              child: VerticalDivider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.icPinLocation,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "2.51 ${Languages.of(context).txtKm}",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 3.setHeight),
                  CommonText(
                    text: Languages.of(context).txtDistance,
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtDarkGray,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight),
              child: VerticalDivider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.icClock,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "0h 32min",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 3.setHeight),
                  CommonText(
                    text: Languages.of(context).txtTime,
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtDarkGray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemDetailsView({
    required String title,
    required String value,
    required String unit,
    required String icon,
    required Color color,
    required Color containerBgcolor,
    required Color containerColor,
    required Function() onTap,
  }) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.setHeight, vertical: 10.setHeight),
          decoration: BoxDecoration(
            color: containerBgcolor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: containerBgcolor.withValues(alpha: 0.2)),
          ),
          margin: EdgeInsets.only(bottom: 14.setHeight),
          child: Row(
            children: [
              Container(
                height: 64.setHeight,
                width: 64.setHeight,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: color == containerColor ? CustomAppColor.of(context).white : color.withValues(alpha: 0.5)),
                ),
                padding: EdgeInsets.all(10.setWidth),
                child: Image.asset(
                  icon,
                  color: color == containerColor ? CustomAppColor.of(context).white : color,
                ),
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: title,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 6.setHeight),
                    Row(
                      children: [
                        CommonText(
                          text: value,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                          height: 1,
                        ),
                        SizedBox(width: 4.setWidth),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 5.setHeight),
                            child: CommonText(
                              text: unit,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.setWidth),
              Image.asset(
                AppAssets.icArrowRight,
                height: 24.setHeight,
                width: 25.setHeight,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    // TODO: implement onTopBarClick
  }
}
