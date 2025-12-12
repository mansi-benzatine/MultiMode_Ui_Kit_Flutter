import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/dashboard/views/dashboard_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/history/views/history_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/languages/views/languages_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/last_seven_days_report/views/last_seven_days_report_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/onboarding/views/on_boarding_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/pause_run_tracker/views/pause_run_tracker_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/recent_activities/views/recent_activities_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/reminder/views/reminder_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/report/views/report_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/running_reminder/views/running_reminder_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/running_view_details/views/running_view_details_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/setting/views/setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/share_run_history/views/share_run_history_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/start_run_tracker/views/start_run_tracker_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/step_counter/views/step_counter_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/subscription/views/subscription_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/water_tracker/views/water_tracker_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/water_tracker_setting/views/water_tracker_setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/weekly_goal_setting/views/weekly_goal_setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/well_done/views/well_done_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../counter /views/counter_screen.dart';
import '../../fill_information/views/fill_information_screen.dart';
import '../../generating_weekly_goal/views/generating_your_weekly_goal_screen.dart';
import '../../location_permission/views/location_permission_screen.dart';
import '../../splash/views/splash_screen.dart';
import '../../water_drink_reminder/views/water_drink_reminder_screen.dart';
import '../../weekly_goal/views/weekly_goal_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => ScreenListScreen(title: title));
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];

  _fillData() {
    screenList = [
      ScreenListDataModel(title: "Splash", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SplashScreen.route())),
      ScreenListDataModel(title: "Onboarding 1", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Onboarding 2", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Onboarding 3", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2))),
      ScreenListDataModel(title: "Welcome", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingDetailsScreen.route(isShownWelcomeBs: true))),
      ScreenListDataModel(title: "What Is Your Gender?", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingDetailsScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "How Much Do You Weight?", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingDetailsScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "How Tall Are You?", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingDetailsScreen.route(currentIndex: 2))),
      ScreenListDataModel(title: "Generating your weekly goal", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, GeneratingYourWeeklyGoalScreen.route())),
      ScreenListDataModel(title: "Weekly Goal heart health", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WeeklyGoalScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Weekly Goal Distance", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WeeklyGoalScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Home : Heart Health", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Home : Distance", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Weekly Goal : Heart Health", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WeeklyGoalSettingScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Weekly Goal : Distance", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WeeklyGoalSettingScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Location Permission", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, LocationPermissionScreen.route())),
      ScreenListDataModel(title: "Start Run Tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, StartRunTrackerScreen.route())),
      ScreenListDataModel(title: "Count Down 3", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, CountdownScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Count Down 2", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, CountdownScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Count Down 1", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, CountdownScreen.route(currentIndex: 2))),
      ScreenListDataModel(title: "Count Down Go", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, CountdownScreen.route(currentIndex: 3))),
      ScreenListDataModel(title: "Pause Run Tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, PauseRunTrackerScreen.route())),
      ScreenListDataModel(title: "Unlock Run Tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, PauseRunTrackerScreen.route(isShowUnlockOverLay: true))),
      ScreenListDataModel(title: "Stop Resume Run Tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, PauseRunTrackerScreen.route(isShowPauseOverLay: true))),
      ScreenListDataModel(title: "Finish Training", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, PauseRunTrackerScreen.route(isShownFinishTrainingAlert: true))),
      ScreenListDataModel(title: "Well Done", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WellDoneScreen.route())),
      ScreenListDataModel(title: "Give Rating", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WellDoneScreen.route(isShownRatingBs: true))),
      ScreenListDataModel(title: "Share Run History", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ShareRunHistoryScreen.route())),
      ScreenListDataModel(title: "Recent Activities", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, RecentActivitiesScreen.route())),
      ScreenListDataModel(title: "Running View Details", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, RunningViewDetailsScreen.route())),
      ScreenListDataModel(title: "Profile", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2))),
      ScreenListDataModel(title: "Add Weight", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isAddWeightBs: true))),
      ScreenListDataModel(title: "Subscription ", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SubscriptionScreen.route())),
      ScreenListDataModel(title: "Settings", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SettingScreen.route())),
      ScreenListDataModel(title: "Reminder", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ReminderScreen.route())),
      ScreenListDataModel(title: "Running Reminder", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, RunningReminderScreen.route())),
      ScreenListDataModel(title: "Set Unit", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SettingScreen.route(isShownSetUnitBs: true))),
      ScreenListDataModel(title: "Set First Day Of Week", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SettingScreen.route(isShownWeekDayBs: true))),
      ScreenListDataModel(title: "Languages", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, LanguageScreen.route())),
      ScreenListDataModel(title: "Step Counter", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, StepCounterScreen.route())),
      ScreenListDataModel(title: "Edit Target Steps", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, StepCounterScreen.route(isShownEditTarget: true))),
      ScreenListDataModel(title: "Report", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ReportScreen.route())),
      ScreenListDataModel(title: "Last 7 Days Report", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, LastSevenDaysReportScreen.route())),
      ScreenListDataModel(title: "More History", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, HistoryScreen.route())),
      ScreenListDataModel(title: "Water Tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WaterTrackerScreen.route())),
      ScreenListDataModel(title: "Setting - Water tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WaterTrackerSettingScreen.route())),
      ScreenListDataModel(title: "Set Target - Water tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, WaterTrackerSettingScreen.route(isShownSetTarget: true))),
      ScreenListDataModel(title: "Reminder - Water tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DrinkWaterReminder.route())),
      ScreenListDataModel(title: "Set Interval - Water tracker", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DrinkWaterReminder.route(isShownSetIntervalBs: true))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, color: CustomAppColor.of(context).white),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          leadingWidth: 38.setWidth,
          title: CommonText(text: "Tracker Mode App", fontSize: 18.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).white, fontFamily: Constant.fontFamilyMontserratSemiBold),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.imgBgHomeScreenPlain), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 26),
              _ModeGridView(screenList: screenList),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeGridView extends StatelessWidget {
  final List<ScreenListDataModel> screenList;

  const _ModeGridView({required this.screenList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 0.screenWidth,
        margin: EdgeInsets.only(top: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: 6.setHeight,
              width: 50.setWidth,
              margin: EdgeInsets.symmetric(vertical: 15.setHeight),
              decoration: BoxDecoration(color: CustomAppColor.of(context).greyHandle, borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(height: 5.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: List.generate(screenList.length, (index) {
                        return _itemList(context: context, item: screenList[index], index: index + 1);
                      }),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemList({required BuildContext context, required ScreenListDataModel item, required int index}) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 3.setHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomAppColor.of(context).listTileColorScreenList,
            boxShadow: [BoxShadow(color: CustomAppColor.of(context).listTileShadow.withValues(alpha: .10), offset: const Offset(0, 4), blurRadius: 10, spreadRadius: 1)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(text: "${index.toString()}.  ", fontSize: 15.setFontSize, fontFamily: Constant.fontFamilyMontserratSemiBold, fontWeight: FontWeight.w600, textColor: CustomAppColor.of(context).txtBlack),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMontserratSemiBold,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.setWidth),
                child: Image.asset(item.icon, height: 20.setHeight, width: 20.setHeight, gaplessPlayback: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
