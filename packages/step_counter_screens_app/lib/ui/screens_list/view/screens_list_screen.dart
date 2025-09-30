import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:step_counter_screens_app_package/ui/distance_report/view/distance_report_screen.dart';
import 'package:step_counter_screens_app_package/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:step_counter_screens_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:step_counter_screens_app_package/ui/reminder/view/reminder_screen.dart';
import 'package:step_counter_screens_app_package/ui/sleep_report/view/sleep_report_screen.dart';
import 'package:step_counter_screens_app_package/ui/sleep_tracker/view/sleep_tracker_screen.dart';
import 'package:step_counter_screens_app_package/ui/splash/view/splash_screen.dart';
import 'package:step_counter_screens_app_package/ui/step_report/view/step_report_screen.dart';
import 'package:step_counter_screens_app_package/ui/subscription/view/subscription_screen.dart';
import 'package:step_counter_screens_app_package/ui/water_report/pages/water_all_records_screen.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../achivements/view/achivements_screen.dart';
import '../../achivements_detail/pages/achivement_sucess_screen.dart';
import '../../achivements_detail/view/achivements_detail_screen.dart';
import '../../calories_report/pages/calories_all_records_screen.dart';
import '../../calories_report/pages/calories_result_screen.dart';
import '../../calories_report/view/calories_report_screen.dart';
import '../../distance_report/pages/distance_all_records_screen.dart';
import '../../distance_report/pages/distance_result_screen.dart';
import '../../instructions/view/instructions_screen.dart';
import '../../set_sleep_target/view/set_sleep_target.dart';
import '../../sleep_manually_record/view/sleep_manually_record_screen.dart';
import '../../sleep_report/pages/sleep_result_screen.dart';
import '../../step_report/pages/step_result_screen.dart';
import '../../step_report/pages/steps_all_records_screen.dart';
import '../../water_report/pages/water_result_screen.dart';
import '../../water_report/view/water_report_screen.dart';
import '../../water_tracker/view/set_water_tracker_screen.dart';
import '../../water_tracker/view/water_tracker_screen.dart';
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
        title: "Splash",
        onClick: () => Navigator.push(context, SplashScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(currentIndex: 0),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(currentIndex: 1),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(currentIndex: 2),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Gender",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileSetupScreen(currentIndex: 0),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Weight",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileSetupScreen(currentIndex: 1),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Height",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileSetupScreen(currentIndex: 2),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Date of Birth",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileSetupScreen(currentIndex: 3),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Reminder",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileSetupScreen(currentIndex: 4),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(currentIndex: 0),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "History",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 1,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete History",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 1,
              isShowDeleteDialogInHistory: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty History",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 1,
              isShowEmptyHistoryScreen: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(currentIndex: 2),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Subscription",
        onClick: () => Navigator.push(context, SubscriptionScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Setting",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(currentIndex: 3),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Instruction",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const InstructionsScreen(),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Sensitivity",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 0,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Weight",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 1,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Height : Feet & Inches",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 2,
              isSelectedFeet: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Height : Centimeters",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 2,
              isSelectedFeet: false,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Gender",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 3,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Birthday",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 4,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Steps Goal",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 5,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Bedtime Schedule",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 6,
              isSelectedBedTimeSchedule: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Wake Up Time Schedule",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 6,
              isSelectedBedTimeSchedule: false,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Language",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 7,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Step Length",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 8,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Metric & Imperial Unit",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 9,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set First Day Of Week",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(
              currentIndex: 3,
              setCurrentIndexForBs: 10,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reminder",
        onClick: () => Navigator.push(context, ReminderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Daily Report Reminder",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReminderScreen(isShowDailyReminderBs: true),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Repeat Reminder",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReminderScreen(isShowRepeat: true),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Steps : Days Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StepReportScreen(
              periodName: "Day",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Steps : See All Records",
        onClick: () => Navigator.push(context, StepsAllRecordsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Steps : Week Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StepReportScreen(
              periodName: "Week",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Steps : No Data Found",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StepReportScreen(
              periodName: "Day",
              isForEmptyView: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Steps : Month Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StepReportScreen(periodName: "Month"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Step : Steps Share Data",
        onClick: () => Navigator.push(context, StepResultScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : Days Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaloriesReportScreen(periodName: "Day"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : See All Record",
        onClick: () => Navigator.push(context, CaloriesAllRecordsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : Week Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaloriesReportScreen(periodName: "Week"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : No Data Found ",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaloriesReportScreen(
              periodName: "Day",
              isForEmptyView: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : Month Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaloriesReportScreen(periodName: "Month"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calories : Calories Share Data",
        onClick: () => Navigator.push(context, CaloriesResultScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : Days Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DistanceReportScreen(periodName: "Day"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : See All Records",
        onClick: () => Navigator.push(context, DistanceAllRecordsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : Week Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DistanceReportScreen(periodName: "Week"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : No Data Found",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DistanceReportScreen(
              periodName: "Day",
              isForEmptyView: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : Month Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DistanceReportScreen(periodName: "Month"),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Distance : Distance Share Data",
        onClick: () => Navigator.push(context, DistanceResultScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep Tracker",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepTrackerScreen(),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Set Target",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetSleepTargetScreen(),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Set Time For Bed Time",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetSleepTargetScreen(
              isForBedTime: true,
              isShowSetTimeBs: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Set Time For Wake Up Time ",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetSleepTargetScreen(
              isForBedTime: false,
              isShowSetTimeBs: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Record Manually",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepManuallyRecordScreen(),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Week Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepReportScreen(
              periodName: "Week",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Month Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepReportScreen(
              periodName: "Month",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : No Data Found",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepReportScreen(
              periodName: "Week",
              isForEmptyView: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sleep : Sleep Share Data",
        onClick: () => Navigator.push(context, SleepResultScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water Tracker",
        onClick: () => Navigator.push(context, WaterTrackerScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : Set Target",
        onClick: () => Navigator.push(context, SetWaterTrackerScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : Day Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaterReportScreen(
              periodName: "Day",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : See All Record",
        onClick: () => Navigator.push(context, WaterAllRecordsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : Week Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaterReportScreen(
              periodName: "Week",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : No Data Found",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaterReportScreen(
              periodName: "Day",
              isForEmptyView: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : Month Report",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WaterReportScreen(
              periodName: "Month",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Water : Water Share Data",
        onClick: () => Navigator.push(context, WaterResultScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievements",
        onClick: () => Navigator.push(context, AchivementsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievements : Daily Steps",
        onClick: () => Navigator.push(
            context,
            AchievementsDetailScreen.route(
              data: [
                AchievementData("5K", "5K", true, AppAssets.icDailyStepMedal),
                AchievementData("10K", "10K", true, AppAssets.icDailyStepMedal),
                AchievementData("15K", "15K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("20K", "20K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("25K", "25K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("30K", "30K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("35K", "35K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("40K", "40K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("45K", "45K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("50K", "50K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("55K", "55K", false, AppAssets.icDailyStepMedalInactive),
                AchievementData("60K", "60K", false, AppAssets.icDailyStepMedalInactive),
              ],
              color: CustomAppColor.of(context).primary,
              icon: AppAssets.icAchievementTotalDays,
              title: Languages.of(context).txtTotalDays,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievements : Total Days",
        onClick: () => Navigator.push(
            context,
            AchievementsDetailScreen.route(
              icon: AppAssets.icAchievementTotalDays,
              title: Languages.of(context).txtTotalDays,
              color: CustomAppColor.of(context).primary,
              data: [
                AchievementData("5", "Days", true, AppAssets.icTotalDaysMedal),
                AchievementData("10", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("15", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("20", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("40", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("80", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("100", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("120", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("160", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("320", "Days", false, AppAssets.icTotalDaysMedalInactive),
                AchievementData("365", "Days", false, AppAssets.icTotalDaysMedalInactive),
              ],
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievements : Total Distance",
        onClick: () => Navigator.push(
            context,
            AchievementsDetailScreen.route(
              icon: AppAssets.icAchievementTotalDistance,
              title: Languages.of(context).txtTotalDistance,
              color: CustomAppColor.of(context).colorDistance,
              data: [
                AchievementData("5", "Km", true, AppAssets.icTotalDistanceMedal),
                AchievementData("10", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("20", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("40", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("80", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("100", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("120", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("140", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("160", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("320", "Km", false, AppAssets.icTotalDistanceMedalInactive),
                AchievementData("640", "Km", false, AppAssets.icTotalDistanceMedalInactive),
              ],
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievement : Steps Success",
        onClick: () => Navigator.push(
            context,
            AchivementSucessScreen.route(
              data: AchievementData("5K", "5K", true, AppAssets.icDailyStepMedal),
              color: CustomAppColor.of(context).primary,
              icon: AppAssets.icAchievementTotalDays,
              title: Languages.of(context).txtTotalDays,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievement : Days Success",
        onClick: () => Navigator.push(
          context,
          AchivementSucessScreen.route(
            icon: AppAssets.icAchievementTotalDays,
            title: Languages.of(context).txtTotalDays,
            color: CustomAppColor.of(context).primary,
            data: AchievementData("5", "Days", true, AppAssets.icTotalDaysMedal),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Achievement : Distance Success",
        onClick: () => Navigator.push(
          context,
          AchivementSucessScreen.route(
            icon: AppAssets.icAchievementTotalDistance,
            title: Languages.of(context).txtTotalDistance,
            color: CustomAppColor.of(context).colorDistance,
            data: AchievementData("5", "Km", true, AppAssets.icTotalDistanceMedal),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
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
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: CustomAppColor.of(context).white,
              ),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          title: CommonText(
            text: "Step Mode - Step Counter App",
            fontSize: 20.setFontSize,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).white,
          ),
          leadingWidth: 38,
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
                        return _itemList(
                          context: context,
                          item: screenList[index],
                          index: index + 1,
                        );
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

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
    required int index,
  }) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${index.toString()}.  ",
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
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
                child: Image.asset(
                  item.icon,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  gaplessPlayback: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
