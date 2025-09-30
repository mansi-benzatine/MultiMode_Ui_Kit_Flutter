import 'package:flutter/material.dart';
import 'package:step_counter_app_package/localization/language/languages.dart';
import 'package:step_counter_app_package/utils/constant.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../achivements_detail/view/achivements_detail_screen.dart';

class AchivementsScreen extends StatefulWidget {
  const AchivementsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const AchivementsScreen());
  }

  @override
  State<AchivementsScreen> createState() => _AchivementsScreenState();
}

class _AchivementsScreenState extends State<AchivementsScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAchievements,
            textAlign: Alignment.centerLeft,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  SizedBox(height: 10.setHeight),

                  // Daily Steps Section
                  _buildAchievementSection(
                    icon: AppAssets.icAchievementDailyStep,
                    title: Languages.of(context).txtDailySteps,
                    color: CustomAppColor.of(context).colorSteps,
                    achievements: [
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
                  ),
                  SizedBox(height: 20.setHeight),

                  // Total Days Section
                  _buildAchievementSection(
                    icon: AppAssets.icAchievementTotalDays,
                    title: Languages.of(context).txtTotalDays,
                    color: CustomAppColor.of(context).primary,
                    achievements: [
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
                  ),
                  SizedBox(height: 20.setHeight),
                  // Total Distance Section
                  _buildAchievementSection(
                    icon: AppAssets.icAchievementTotalDistance,
                    title: Languages.of(context).txtTotalDistance,
                    color: CustomAppColor.of(context).colorDistance,
                    achievements: [
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
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementSection({
    required String icon,
    required String title,
    required Color color,
    required List<AchievementData> achievements,
  }) {
    return Column(
      children: [
        // Header
        InkWell(
          onTap: () {
            Navigator.push(context, AchievementsDetailScreen.route(title: title, color: color, data: achievements, icon: icon));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 45.setWidth,
                padding: EdgeInsets.only(bottom: 15.setHeight),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  icon,
                  width: icon == AppAssets.icAchievementDailyStep
                      ? 60.setHeight
                      : icon == AppAssets.icAchievementTotalDays
                          ? 30.setHeight
                          : 30.setWidth,
                  height: icon == AppAssets.icAchievementDailyStep
                      ? 30.setHeight
                      : icon == AppAssets.icAchievementTotalDays
                          ? 25.setHeight
                          : 30.setWidth,
                  color: color,
                ),
              ),
              if (icon == AppAssets.icAchievementDailyStep) SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: color,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                width: 20.setWidth,
                height: 20.setHeight,
                margin: EdgeInsets.only(right: 10.setWidth),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomAppColor.of(context).white,
                  size: 12.setWidth,
                ),
              ),
            ],
          ),
        ),

        // Achievement Circles
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.setWidth, horizontal: 13.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: achievements.take(4).map((achievement) {
              return _buildAchievementCircle(
                value: achievement.value,
                unit: achievement.unit,
                isCompleted: achievement.isCompleted,
                color: color,
                icon: achievement.icon,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementCircle({
    required String value,
    required String unit,
    required bool isCompleted,
    required Color color,
    required String icon,
  }) {
    return Container(
      width: 70.setWidth,
      height: 75.setHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(icon),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 22.setHeight),
          CommonText(
            text: value,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            height: 1,
            textColor: CustomAppColor.of(context).txtWhite,
          ),
          if (unit != value) ...[
            // Don't show unit if it's the same as value (like "5K")
            CommonText(
              text: unit,
              fontSize: 8.setFontSize,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              height: 1,
              textColor: CustomAppColor.of(context).txtWhite,
            ),
          ]
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

class AchievementData {
  final String value;
  final String unit;
  final bool isCompleted;
  final String icon;

  AchievementData(this.value, this.unit, this.isCompleted, this.icon);
}
