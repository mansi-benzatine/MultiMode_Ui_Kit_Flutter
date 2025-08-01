import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/recent_activities/views/recent_activities_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/running_view_details/views/running_view_details_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/step_counter/views/step_counter_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/weekly_goal_setting/views/weekly_goal_setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../water_tracker/views/water_tracker_screen.dart';
import '../datamodels/home_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements TopBarClickListener {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<RecentActivity> activitiesList = [];
  List<BestRecords> bestRecordList = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void fillData() {
    activitiesList = [
      RecentActivity(
        date: "March 25, 2023",
        distance: 15.25,
        duration: "00:10:38",
        pace: "05:25 min/km",
        calories: 50.80,
      ),
      RecentActivity(
        date: "March 24, 2023",
        distance: 20.18,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 80.75,
      ),
      RecentActivity(
        date: "March 23, 2023",
        distance: 50.10,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 125.00,
      ),
    ];

    bestRecordList = [
      BestRecords(
        icon: AppAssets.icRoad,
        title: Languages.of(context).txtLongestDistance,
        description: "250:00",
        trailingString: "Km",
      ),
      BestRecords(
        icon: AppAssets.icBlackStar,
        title: Languages.of(context).txtBestPace,
        description: "44:32",
        trailingString: "min/km",
      ),
      BestRecords(
        icon: AppAssets.icClock,
        title: Languages.of(context).txtLongestDuration,
        description: "15:12:30",
        trailingString: "",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowTitle: true,
              title: Languages.of(context).txtAppName.toUpperCase(),
              shortHeading: Languages.of(context).txtGoFasterAndSmarter,
              isShowInfo: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250.setHeight,
                      child: PageView(
                        clipBehavior: Clip.hardEdge,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: const [HeartHealthView(), DistanceView()],
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
                          width: 8.setWidth,
                          height: 8.setHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? CustomAppColor.of(context).primary
                                : CustomAppColor.of(context).grey,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.setHeight),
                    SwitchAppOptionsView(),
                    SizedBox(height: 30.setHeight),
                    RecentActivitiesView(recentActivity: activitiesList),
                    SizedBox(height: 10.setHeight),
                    BestRecordsListView(bestRecordList: bestRecordList),
                    SizedBox(height: 30.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strInfo) {
      Navigator.push(context, WeeklyGoalSettingScreen.route());
    }
  }
}

class SwitchAppOptionsView extends StatelessWidget {
  const SwitchAppOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context, StepCounterScreen.route()),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0F24A),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.setWidth,
                vertical: 12.setHeight,
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icSteps,
                    height: 39.setHeight,
                    width: 39.setWidth,
                  ),
                  SizedBox(width: 20.setWidth),
                  CommonText(
                    text: Languages.of(context).txtSteps,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, WaterTrackerScreen.route()),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF37E1FF),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.setWidth,
                vertical: 12.setHeight,
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icWaterDrop,
                    height: 40.setHeight,
                    width: 40.setWidth,
                  ),
                  SizedBox(width: 20.setWidth),
                  CommonText(
                    text: Languages.of(context).txtWater,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
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
                text: Languages.of(context).txtRecentActivities,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtPurple,
              ),
              InkWell(
                onTap: () =>
                    Navigator.push(context, RecentActivitiesScreen.route()),
                child: CommonText(
                  text: Languages.of(context).txtMore,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtPurple,
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
                onTap: () =>
                    Navigator.push(context, RunningViewDetailsScreen.route()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.setWidth,
                      vertical: 10.setHeight,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: Offset(1, 1),
                        ),
                      ],

                      color: CustomAppColor.of(context).containerBgwhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: Image.asset(
                            AppAssets.imgMapView,
                            height: 79.setHeight,
                            width: 79.setWidth,
                          ),
                        ),
                        SizedBox(width: 17.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: activity.date,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: activity.distance.toString(),
                                      style: TextStyle(
                                        fontSize: 24.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColor.of(
                                          context,
                                        ).txtBlack,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Km",
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
                              SizedBox(height: 13.setHeight),
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
                                    ).txtGreyLightGrey,
                                  ),
                                  CommonText(
                                    text: activity.pace,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtGreyLightGrey,
                                  ),
                                  CommonText(
                                    text:
                                        "${activity.calories.toString()} kcal",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtGreyLightGrey,
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
            textColor: CustomAppColor.of(context).txtPurple,
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
                    color: CustomAppColor.of(context).containerBgPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).txtWhite,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          activity.icon,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).icBlack,
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
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                CommonText(
                                  text: activity.description.toString(),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.setFontSize,
                                  textColor: CustomAppColor.of(
                                    context,
                                  ).txtBlackPurple,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.setHeight,
                                    horizontal: 4.setWidth,
                                  ),
                                  child: CommonText(
                                    text: activity.trailingString.toString(),
                                    fontWeight: FontWeight.w500,

                                    fontSize: 14.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtBlackPurple,
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

class HeartHealthView extends StatelessWidget {
  const HeartHealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.setHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              width: 150.setHeight,
              height: 100.setHeight,
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: Languages.of(context).txtHeartHealth,
                  textStyle: TextStyle(
                    fontFamily: Constant.fontFamily,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w500,
                    color: CustomAppColor.of(context).txtPurpleWhite,
                  ),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                    canScaleToFit: true,
                    showTicks: false,
                    showLabels: false,
                    minimum: 0,
                    maximum: 100,
                    radiusFactor: 1.3,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.16,
                      cornerStyle: CornerStyle.bothCurve,
                      color: CustomAppColor.of(context).containerBgLightPurple,
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
                        width: 0.16,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0.01,
                        angle: 90,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "75%",
                              textColor: CustomAppColor.of(context).txtPurple,
                              fontSize: 36.setFontSize,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                            SizedBox(height: 5.setHeight),
                            CommonText(
                              text: Languages.of(context).txtThisWeek,
                              textColor: CustomAppColor.of(context).txtGrey,
                              fontSize: 18.setFontSize,
                              fontWeight: FontWeight.w400,
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
          SizedBox(height: 10.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icYellowWalk,
                    height: 20.setHeight,
                    width: 20.setWidth,
                  ),
                  SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "55",
                          style: TextStyle(
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColor.of(context).txtGrey,
                          ),
                        ),
                        TextSpan(
                          text: "/300min",
                          style: TextStyle(
                            fontSize: 10.setFontSize, // Smaller font
                            fontWeight: FontWeight.w400,
                            color: CustomAppColor.of(context).txtGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icRedWalk,
                    height: 20.setHeight,
                    width: 20.setWidth,
                  ),
                  SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "25",
                          style: TextStyle(
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColor.of(context).txtGrey,
                          ),
                        ),
                        TextSpan(
                          text: "/150min",
                          style: TextStyle(
                            fontSize: 10.setFontSize,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColor.of(context).txtGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DistanceView extends StatelessWidget {
  const DistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.setHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              width: 150.setHeight,
              height: 100.setHeight,
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: Languages.of(context).txtDistance,
                  textStyle: TextStyle(
                    fontFamily: Constant.fontFamily,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFD86C9),
                  ),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                    canScaleToFit: true,
                    showTicks: false,
                    showLabels: false,
                    minimum: 0,
                    maximum: 100,
                    radiusFactor: 1.3,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.16,
                      cornerStyle: CornerStyle.bothCurve,
                      color: CustomAppColor.of(context).containerBgLightPurple,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: 75,
                        gradient: SweepGradient(
                          colors: [Color(0xFFFD86C9), Color(0xFFFD86C9)],
                          startAngle: 23,
                          endAngle: 50,
                        ),
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.16,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0.01,
                        angle: 90,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            CommonText(
                              text: "1.2",
                              textColor: Color(0xFFFD86C9),
                              fontSize: 48.setFontSize,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                            CommonText(
                              text: "Km",
                              textColor: Color(0xFFFD86C9),
                              fontSize: 18.setFontSize,
                              fontWeight: FontWeight.w700,
                              height: 1,
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
          CommonText(
            text: "Weekly Goal 100 km",
            fontWeight: FontWeight.w400,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }
}
