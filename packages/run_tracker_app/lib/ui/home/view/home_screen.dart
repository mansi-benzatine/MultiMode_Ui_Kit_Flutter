import 'package:flutter/material.dart';
import 'package:run_tracker_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/ui/dashboard/views/dashboard_screen.dart';
import 'package:run_tracker_app/ui/result_share/views/result_share_screen.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../widgets/text/common_text.dart';
import '../datamodels/home_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements TopBarClickListener {
  List<DetailsItem> detailsItem = [];
  List<RecentActivity> activitiesList = [];
  List<BestRecords> bestRecordList = [];

  _fillData() {
    detailsItem = [
      DetailsItem(
        icon: AppAssets.icDistance,
        iconBackground: Color(0xFFF7CF37),
        value: '150.00',
        unit: 'km',
        label: 'Total Distance',
      ),
      DetailsItem(
        icon: AppAssets.icTime,
        iconBackground: Color(0xFF9AE33C),
        value: '58:76:03',
        unit: '',
        label: 'Total Time',
      ),
      DetailsItem(
        icon: AppAssets.icCalories,
        iconBackground: Color(0xFFBA84FB),
        value: '855.00',
        unit: 'kcal',
        label: 'Total Calories',
      ),
      DetailsItem(
        icon: AppAssets.icAverageSpeed,
        iconBackground: Color(0xFFEC834B),
        value: '120.00',
        unit: 'min/km',
        label: 'Total Average Speed',
      ),
    ];

    activitiesList = [
      RecentActivity(
        date: "June 09, 2022",
        distance: 20.67,
        duration: "01:10:38",
        pace: "12:23 min/km",
        calories: 10,
      ),
      RecentActivity(
        date: "June 08, 2022",
        distance: 12.66,
        duration: "00:00:38",
        pace: "25:28 min/km",
        calories: 20.00,
      ),
      RecentActivity(
        date: "June 07, 2022",
        distance: 35.00,
        duration: "02:10:38",
        pace: "10:20 min/km",
        calories: 20.00,
      ),
    ];

    bestRecordList = [
      BestRecords(
        icon: AppAssets.icRoad,
        title: Languages.of(context).txtLongestDistance,
        description: "0",
        trailingString: "mile",
      ),
      BestRecords(
        icon: AppAssets.icStar,
        title: Languages.of(context).txtTopSpeed,
        description: "0",
        trailingString: "min/mi",
      ),
      BestRecords(
        icon: AppAssets.icWhiteTime,
        title: Languages.of(context).txtLongestDuration,
        description: "00.00",
        trailingString: "",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Column(
      children: [
        TopBar(
          this,
          isShowSimpleTitle: true,
          simpleTitle: Languages.of(context).txtAppName.toUpperCase(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.setHeight),
                DailyDistanceView(),
                DetailsContainerView(detailsItem: detailsItem),
                SizedBox(height: 20.setHeight),
                RecentActivitiesView(recentActivity: activitiesList),
                SizedBox(height: 10.setHeight),
                BestRecordsListView(bestRecordList: bestRecordList),
                SizedBox(height: 30.setHeight),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}

class DailyDistanceView extends StatelessWidget {
  const DailyDistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180.setHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              width: 150.setHeight,
              height: 100.setHeight,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    canScaleToFit: true,
                    showTicks: false,
                    showLabels: false,
                    minimum: 0,
                    maximum: 100,
                    radiusFactor: 1.6,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.20,
                      cornerStyle: CornerStyle.bothCurve,
                      color: CustomAppColor.of(context).greyShadow,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: 75,
                        gradient: SweepGradient(
                          colors: [
                            CustomAppColor.of(context).primary,
                            CustomAppColor.of(context).primary,
                          ],
                          startAngle: 23,
                          endAngle: 50,
                        ),
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.20,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0.02,
                        angle: 90,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.icSpeedometer,
                              width: 24.setWidth,
                              height: 24.setHeight,
                              color: CustomAppColor.of(context).icBlack,
                            ),
                            SizedBox(height: 15.setHeight),
                            CommonText(
                              text: "78.50",
                              textColor: CustomAppColor.of(context).limePrimary,
                              fontSize: 36.setFontSize,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                            SizedBox(height: 8.setHeight),
                            Container(
                              height: 1.setHeight,
                              width: 97.setWidth,
                              color: CustomAppColor.of(
                                context,
                              ).grey.withValues(alpha: 0.2),
                            ),
                            SizedBox(height: 8.setHeight),
                            CommonText(
                              text: Languages.of(context).txtKm,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: Languages.of(context).txtDailyDistanceGoal,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(width: 5.setWidth),
              CommonText(
                text: "100 KM",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsContainerView extends StatelessWidget {
  final List<DetailsItem> detailsItem;

  const DetailsContainerView({super.key, required this.detailsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: detailsItem.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = detailsItem[index];
          return _buildItem(context, item);
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, DetailsItem item) {
    return Container(
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.light)
            ? Colors.transparent
            : item.iconBackground,
        border: Border.all(color: CustomAppColor.of(context).border),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.only(top: 16.setHeight, left: 16.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: (Theme.of(context).brightness == Brightness.light)
                  ? item.iconBackground
                  : Color.alphaBlend(
                      Colors.black.withValues(alpha: 0.08),
                      item.iconBackground,
                    ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              item.icon,
              color: Colors.white,
              width: 30.setWidth,
              height: 30.setHeight,
            ),
          ),
          SizedBox(height: 12.setHeight),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: item.value),
                if (item.unit.isNotEmpty)
                  TextSpan(
                    text: ' ${item.unit}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.setFontSize,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 4.setHeight),
          Expanded(
            child: CommonText(
              text: item.label,
              fontSize: 13.setFontSize,
              overflow: TextOverflow.ellipsis,
              textColor: CustomAppColor.of(context).txtGreyBlack,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentActivitiesView extends StatelessWidget {
  final List<RecentActivity> recentActivity;

  const RecentActivitiesView({super.key, required this.recentActivity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtRecentHistory,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  DashboardScreen.route(currentIndex: 1),
                ),
                child: CommonText(
                  text: Languages.of(context).txtMore,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 5.setHeight),
            itemCount: recentActivity.length,
            itemBuilder: (context, index) {
              final activity = recentActivity[index];
              return GestureDetector(
                onTap: () => Navigator.push(context, ResultShareScreen.route()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.setWidth,
                      vertical: 14.setHeight,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomAppColor.of(context).border,
                        width: 0.7,
                      ),
                      color: CustomAppColor.of(context).containerBgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: Image.asset(
                            AppAssets.icMap,
                            height: 79.setHeight,
                            width: 79.setWidth,
                          ),
                        ),
                        SizedBox(width: 17.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: activity.distance.toStringAsFixed(
                                        2,
                                      ),
                                      style: TextStyle(
                                        fontSize: 24.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColor.of(
                                          context,
                                        ).txtBlack,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          " ${Languages.of(context).txtKm.toLowerCase()}",
                                      style: TextStyle(
                                        fontSize: 14.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColor.of(
                                          context,
                                        ).txtBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                text: activity.date,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.setFontSize,
                                textColor: CustomAppColor.of(
                                  context,
                                ).txtDarkGrey,
                              ),
                              SizedBox(height: 10.setHeight),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: activity.duration,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                  CommonText(
                                    text: activity.pace,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                  CommonText(
                                    text:
                                        "${activity.calories.toStringAsFixed(0)} Kcal",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BestRecordsListView extends StatelessWidget {
  final List<BestRecords> bestRecordList;

  const BestRecordsListView({super.key, required this.bestRecordList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtBestRecords,
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w500,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 5.setHeight),
            itemCount: bestRecordList.length,
            itemBuilder: (context, index) {
              final activity = bestRecordList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.setWidth,
                    vertical: 10.setHeight,
                  ),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerBgColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: CustomAppColor.of(context).border,
                      width: 0.7,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: index == 0
                              ? CustomAppColor.of(context).primary
                              : index == 1
                              ? Color(0xFF9AE33C)
                              : Color(0xFFEC834B),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          activity.icon,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).white,
                          width: 24.setWidth,
                        ),
                      ),
                      SizedBox(width: 17.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: activity.title.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.setFontSize,
                              textColor: CustomAppColor.of(
                                context,
                              ).txtBlackDarkGrey,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CommonText(
                                  text: activity.description.toString(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.setFontSize,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.setHeight,
                                    horizontal: 4.setWidth,
                                  ),
                                  child: CommonText(
                                    text: activity.trailingString.toString(),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.setFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
