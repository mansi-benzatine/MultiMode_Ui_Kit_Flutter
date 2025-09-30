import 'package:flutter/material.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/first_day_of_week_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/gender_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/height_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/step_goal_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/step_length_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/ui/reminder/view/reminder_screen.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/utils/utils.dart';

import '../../../dialogs/bottom_sheet/bedtime_bottom_sheet_dialog.dart';
import '../../../dialogs/bottom_sheet/birthday_bottom_sheet_dialog.dart';
import '../../../dialogs/bottom_sheet/language_bottom_sheet_dialog.dart';
import '../../../dialogs/bottom_sheet/sensitivity_bottom_sheet_dialog.dart';
import '../../../dialogs/bottom_sheet/unit_bottom_sheet_dialog.dart';
import '../../../dialogs/bottom_sheet/weight_bottom_sheet_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtSetting,
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 20.setHeight, bottom: 30.setHeight),
              child: Column(
                children: [
                  _personalInformationView(),
                  SizedBox(height: 20.setHeight),
                  _setGoalView(),
                  SizedBox(height: 20.setHeight),
                  _bedtimeScheduleView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _personalInformationView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtPersonalInformation.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtGender,
                    widgets: GenderBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileGender,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtGender,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "Male",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtWeight,
                    widgets: WeightBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileWeight,
                        height: 20.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtWeight,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: Languages.of(context).txtCaloriesCalculationNeedsIt,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "70 kg",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtHeight,
                    widgets: HeightBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileHeight,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtHeight,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: Languages.of(context).txtCaloriesCalculationNeedsIt,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "170 cm",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtBirthday,
                    widgets: BirthdayBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileDOB,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtBirthday,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "Jan 7, 1998",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtLanguage,
                    isShowSpace: false,
                    widgets: LanguageBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileLanguage,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtLanguage,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "English",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _setGoalView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtSetGoal.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtStepGoal,
                    widgets: StepGoalBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSetupProfileGoal,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtStepGoal,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "6000",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtSensitivity,
                    widgets: SensitivityBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.setHeight),
                        child: Image.asset(
                          AppAssets.icSensitivity,
                          height: 22.setHeight,
                          width: 24.setWidth,
                        ),
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtSensitivity,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                              height: 0,
                            ),
                            CommonText(
                              text: Languages.of(context).txtHighSensitivityMeansSmallMovementsWillBeCountedAsSteps,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonText(
                            text: "Low",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          ),
                          SizedBox(width: 5.setWidth),
                          Image.asset(
                            AppAssets.icArrowDropDown,
                            height: 28.setHeight,
                            width: 28.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtStepLength,
                    widgets: StepLengthBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.setHeight),
                        child: Image.asset(
                          AppAssets.icStepLength,
                          height: 20.setHeight,
                          width: 24.setWidth,
                        ),
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtStepLength,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: Languages.of(context).txtDistanceAndSpeedCalculationNeedIt,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Row(
                        children: [
                          CommonText(
                            text: "2 ft 2 in",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          ),
                          SizedBox(width: 5.setWidth),
                          Image.asset(
                            AppAssets.icArrowDropDown,
                            height: 28.setHeight,
                            width: 28.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtMetricImperialUnit,
                    widgets: UnitBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.setHeight),
                        child: Image.asset(
                          AppAssets.icUnit,
                          height: 20.setHeight,
                          width: 22.setWidth,
                        ),
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtUnit,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: Languages.of(context).txtMetricImperialUnit,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Row(
                        children: [
                          CommonText(
                            text: "lbs / ft / mile",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          ),
                          SizedBox(width: 5.setWidth),
                          Image.asset(
                            AppAssets.icArrowDropDown,
                            height: 28.setHeight,
                            width: 28.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtFirstDayOfWeek,
                    widgets: FirstDayOfWeekBottomSheetDialog(onSave: () {}),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icFirstDayOfWeek,
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtFirstDayOfWeek,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "Sunday",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, ReminderScreen.route());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.setWidth),
                        child: Image.asset(
                          AppAssets.icSetupProfileNotification,
                          height: 22.setHeight,
                          width: 22.setWidth,
                        ),
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtSetReminder,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: Languages.of(context).txtEverydays,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Row(
                        children: [
                          CommonText(
                            text: "09:00 AM",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          ),
                          SizedBox(width: 5.setWidth),
                          Image.asset(
                            AppAssets.icArrowDropDown,
                            height: 28.setHeight,
                            width: 28.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _bedtimeScheduleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtBedTimeSchedule.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtBedTimeSchedule,
                    widgets: BedTimeBottomSheetDialog(onSave: () {}, isBedTime: true),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icGetInBed,
                        height: 22.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtGetInBed,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "11:00 PM",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              InkWell(
                onTap: () {
                  Utils.showBottomSheetDialog(
                    context,
                    title: Languages.of(context).txtBedTimeSchedule,
                    widgets: BedTimeBottomSheetDialog(onSave: () {}, isBedTime: false),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.setWidth, top: 4.setHeight, bottom: 4.setHeight),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icWakeUp,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtWakeUp,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "06:00 AM",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icArrowDropDown,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
