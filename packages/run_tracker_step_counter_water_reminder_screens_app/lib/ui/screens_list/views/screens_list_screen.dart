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
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../counter /views/counter_screen.dart';
import '../../fill_information/views/fill_information_screen.dart';
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
    return MaterialPageRoute<void>(
      builder: (_) => ScreenListScreen(title: title),
    );
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Fill Information".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnboardingDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Generating your weekly goal".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, WeeklyGoalScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Weekly Goal Setting".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, WeeklyGoalSettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Location Permission".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, LocationPermissionScreen.route()),
      ),
      ScreenListDataModel(
        title: "Start Run Tracker".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, StartRunTrackerScreen.route()),
      ),
      ScreenListDataModel(
        title: "Count Down".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CountdownScreen.route()),
      ),
      ScreenListDataModel(
        title: "Pause Run Tracker".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, PauseRunTrackerScreen.route()),
      ),
      ScreenListDataModel(
        title: "Well Done".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, WellDoneScreen.route()),
      ),
      ScreenListDataModel(
        title: "Share Run History".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ShareRunHistoryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Recent Activities".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, RecentActivitiesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Running View Details".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, RunningViewDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Subscription ".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SubscriptionScreen.route()),
      ),
      ScreenListDataModel(
        title: "Settings".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reminder".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReminderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Running Reminder".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, RunningReminderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Languages".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LanguageScreen.route()),
      ),
      ScreenListDataModel(
        title: "Step Counter".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, StepCounterScreen.route()),
      ),
      ScreenListDataModel(
        title: "Report".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReportScreen.route()),
      ),
      ScreenListDataModel(
        title: "Last 7 Days Report".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, LastSevenDaysReportScreen.route()),
      ),
      ScreenListDataModel(
        title: "More History".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, HistoryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Water Tracker".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, WaterTrackerScreen.route()),
      ),
      ScreenListDataModel(
        title: "Setting - Water tracker".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, WaterTrackerSettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reminder - Water tracker".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DrinkWaterReminder.route()),
      ),
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
            icon: Icon(
              Icons.arrow_back,
              color: CustomAppColor.of(context).white,
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          title: CommonText(
            text: "Tracker Mode App",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).white,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBgHomeScreenPlain),
              fit: BoxFit.cover,
            ),
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
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).greyHandle,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: screenList.map((item) {
                        return _itemList(context: context, item: item);
                      }).toList(),
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

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
  }) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.setWidth,
          vertical: 4.setHeight,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 14.setWidth,
          vertical: 14.setHeight,
        ),
        width:
            (MediaQuery.of(context).size.width -
                16.setWidth * 2 -
                14.setWidth * 2) /
            3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomAppColor.of(context).listTileColorScreenList,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(
                context,
              ).listTileShadow.withValues(alpha: .10),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 6.setHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 15.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgSkyBlue,
                    CustomAppColor.of(context).bgDarkBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                item.icon,
                height: 32.setHeight,
                width: 32.setHeight,
                gaplessPlayback: true,
              ),
            ),
            SizedBox(height: 10.setHeight),
            Container(
              constraints: BoxConstraints(minHeight: 37.setHeight),
              alignment: Alignment.center,
              child: CommonText(
                text: item.title.toUpperCase(),
                fontSize: 13.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
                isAutoSize: true,
                maxLines: 2,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
