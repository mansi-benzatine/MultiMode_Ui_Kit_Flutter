import 'package:flutter/material.dart';
import 'package:step_counter_app_package/dialogs/bottom_sheet/set_bedtime_bottom_sheet_dialog.dart';
import 'package:step_counter_app_package/localization/language/languages.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../../widgets/clock_progress/clock_progress_widget.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class SetSleepTargetScreen extends StatefulWidget {
  const SetSleepTargetScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SetSleepTargetScreen());
  }

  @override
  State<SetSleepTargetScreen> createState() => _SetSleepTargetScreenState();
}

class _SetSleepTargetScreenState extends State<SetSleepTargetScreen> implements TopBarClickListener {
  // Bedtime and wake-up time variables
  int bedtimeHour = 11;
  int bedtimeMinute = 0;
  String bedtimeUnit = 'PM';

  int wakeUpHour = 6;
  int wakeUpMinute = 0;
  String wakeUpUnit = 'AM';

  String get formattedBedtime => "${bedtimeHour.toString().padLeft(2, '0')}:${bedtimeMinute.toString().padLeft(2, '0')} $bedtimeUnit";
  String get formattedWakeUpTime => "${wakeUpHour.toString().padLeft(2, '0')}:${wakeUpMinute.toString().padLeft(2, '0')} $wakeUpUnit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSetTarget,
            textAlign: Alignment.centerLeft,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 30.setHeight),

                    // Circular Sleep Progress Indicator
                    ClockProgressWidget(
                      startHour: bedtimeHour,
                      startMinute: bedtimeMinute,
                      startUnit: bedtimeUnit,
                      endHour: wakeUpHour,
                      endMinute: wakeUpMinute,
                      endUnit: wakeUpUnit,
                      width: 300.setWidth,
                      height: 300.setHeight,
                    ),

                    SizedBox(height: 30.setHeight),

                    // Bedtime and Wake up sections
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

                    SizedBox(height: 40.setHeight),

                    // Description text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: CommonText(
                        text: "If you've set a sleep period in-clock, Your target bedtime and wake-up time will be synced. Any changes you make will be reflected in both locations.",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontFamily: Constant.fontFamily,
                        textAlign: TextAlign.center,
                        maxLines: 4,
                      ),
                    ),

                    SizedBox(height: 30.setHeight),
                  ],
                ),
              ),
            ),
          ),
        ],
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
