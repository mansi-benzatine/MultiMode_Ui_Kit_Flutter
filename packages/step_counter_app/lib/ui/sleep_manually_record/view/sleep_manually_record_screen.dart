import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/set_bedtime_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/sleep_date_selection_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/utils/utils.dart';
import 'package:step_counter_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/clock_progress/clock_progress_widget.dart';
import '../../../widgets/text/common_text.dart';

class SleepManuallyRecordScreen extends StatefulWidget {
  const SleepManuallyRecordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SleepManuallyRecordScreen());
  }

  @override
  State<SleepManuallyRecordScreen> createState() => _SleepManuallyRecordScreenState();
}

class _SleepManuallyRecordScreenState extends State<SleepManuallyRecordScreen> implements TopBarClickListener {
  // Bedtime and wake-up time variables
  int bedtimeHour = 11;
  int bedtimeMinute = 0;
  String bedtimeUnit = 'PM';

  int wakeUpHour = 6;
  int wakeUpMinute = 0;
  String wakeUpUnit = 'AM';

  String get formattedBedtime => "${bedtimeHour.toString().padLeft(2, '0')}:${bedtimeMinute.toString().padLeft(2, '0')} $bedtimeUnit";
  String get formattedWakeUpTime => "${wakeUpHour.toString().padLeft(2, '0')}:${wakeUpMinute.toString().padLeft(2, '0')} $wakeUpUnit";

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtRecordManually,
              textAlign: Alignment.centerLeft,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Utils.showBottomSheetDialog(
                          context,
                          title: Languages.of(context).txtSetTime,
                          widgets: SleepDateSelectionBottomSheetDialog(
                            onSave: (selectedDate) {
                              setState(() {
                                this.selectedDate = selectedDate;
                              });
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.setWidth,
                          vertical: 10.setHeight,
                        ),
                        margin: EdgeInsets.only(bottom: 25.setHeight),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.setWidth),
                          border: Border.all(
                            color: CustomAppColor.of(context).borderColor,
                            width: 1,
                          ),
                        ),
                        child: CommonText(
                          text: DateFormat('dd MMM yyyy, EEEE').format(selectedDate),
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).colorTimes,
                          fontFamily: Constant.fontFamily,
                        ),
                      ),
                    ),
                    ClockProgressWidget(
                      startHour: bedtimeHour,
                      startMinute: bedtimeMinute,
                      startUnit: bedtimeUnit,
                      endHour: wakeUpHour,
                      endMinute: wakeUpMinute,
                      endUnit: wakeUpUnit,
                      width: 270.setWidth,
                      height: 270.setHeight,
                    ),
                    SizedBox(height: 25.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Utils.showBottomSheetDialog(
                                context,
                                title: Languages.of(context).txtSetTime,
                                widgets: SetBedTimeBottomSheetDialog(
                                  onSave: (isBedTime, hour, minute, unit) {
                                    _onTimeSelected(isBedTime: isBedTime, hour: hour, minute: minute, unit: unit);
                                  },
                                  isBedTime: true,
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 15.setHeight, top: 20.setHeight),
                                  margin: EdgeInsets.only(top: 25.setHeight),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                                    borderRadius: BorderRadius.circular(16.setWidth),
                                    border: Border.all(
                                      color: CustomAppColor.of(context).borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16.setHeight),
                                      CommonText(
                                        text: Languages.of(context).txtBedTime,
                                        fontSize: 14.setFontSize,
                                        fontWeight: FontWeight.w500,
                                        textColor: CustomAppColor.of(context).txtBlack,
                                        fontFamily: Constant.fontFamily,
                                      ),
                                      CommonText(
                                        text: formattedBedtime,
                                        fontSize: 20.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        textColor: CustomAppColor.of(context).colorTimes,
                                        fontFamily: Constant.fontFamily,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).colorTimes,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 50.setHeight,
                                    width: 50.setHeight,
                                    padding: EdgeInsets.all(10.setHeight),
                                    child: Image.asset(
                                      AppAssets.icBedTime,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.setWidth),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Utils.showBottomSheetDialog(
                                context,
                                title: Languages.of(context).txtSetTime,
                                widgets: SetBedTimeBottomSheetDialog(
                                  onSave: (isBedTime, hour, minute, unit) {
                                    _onTimeSelected(isBedTime: isBedTime, hour: hour, minute: minute, unit: unit);
                                  },
                                  isBedTime: false,
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 15.setHeight, top: 20.setHeight),
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 25.setHeight),
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                                    borderRadius: BorderRadius.circular(16.setWidth),
                                    border: Border.all(
                                      color: CustomAppColor.of(context).borderColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16.setHeight),
                                      CommonText(
                                        text: "Wakeup Time",
                                        fontSize: 14.setFontSize,
                                        fontWeight: FontWeight.w500,
                                        textColor: CustomAppColor.of(context).txtBlack,
                                        fontFamily: Constant.fontFamily,
                                      ),
                                      CommonText(
                                        text: formattedWakeUpTime,
                                        fontSize: 20.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        textColor: CustomAppColor.of(context).colorTimes,
                                        fontFamily: Constant.fontFamily,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).colorTimes,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 50.setHeight,
                                    width: 50.setHeight,
                                    padding: EdgeInsets.all(10.setHeight),
                                    child: Image.asset(
                                      AppAssets.icWakeUp,
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: CustomAppColor.of(context).white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtCancel,
                      mLeft: 15.setWidth,
                      mRight: 8.setWidth,
                      buttonColor: CustomAppColor.of(context).transparent,
                      buttonTextColor: CustomAppColor.of(context).colorTimes,
                      borderColor: CustomAppColor.of(context).colorTimes,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: CommonButton(
                      mLeft: 8.setWidth,
                      mRight: 15.setWidth,
                      text: Languages.of(context).txtSave,
                      buttonColor: CustomAppColor.of(context).colorTimes,
                      borderColor: CustomAppColor.of(context).colorTimes,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTimeSelected({required bool isBedTime, required int hour, required int minute, required String unit}) {
    if (isBedTime) {
      bedtimeHour = hour;
      bedtimeMinute = minute;
      bedtimeUnit = unit;
    } else {
      wakeUpHour = hour;
      wakeUpMinute = minute;
      wakeUpUnit = unit;
    }
    if (bedtimeHour == wakeUpHour && bedtimeMinute == wakeUpMinute && bedtimeUnit == wakeUpUnit) {
      Utils.showToast(
        context,
        Languages.of(context).txtBedTimeCannotBeSameAsWakeUpTime,
      );
      return;
    }
    setState(() {});
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
