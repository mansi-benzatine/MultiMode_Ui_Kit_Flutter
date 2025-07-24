import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';

class DrinkWaterReminder extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => DrinkWaterReminder());
  }

  const DrinkWaterReminder({super.key});

  @override
  State<DrinkWaterReminder> createState() => _DrinkWaterReminderState();
}

class _DrinkWaterReminderState extends State<DrinkWaterReminder>
    implements TopBarClickListener {
  bool isNotificationOn = true;
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 21, minute: 0);
  double interval = 1.0;
  ValueNotifier<bool> isRunningReminder = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            simpleTitle: Languages.of(context).txtDrinkWaterReminder,
            isShowSimpleTitle: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtNotifications,
                        fontSize: 18.setFontSize,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: isRunningReminder,
                        builder: (context, value, child) {
                          return FlutterSwitch(
                            value: value,
                            onToggle: (bool newValue) {},
                            activeColor: CustomAppColor.of(context).primary,
                            inactiveColor: CustomAppColor.of(
                              context,
                            ).grey.withValues(alpha: 0.5),
                            activeToggleColor: CustomAppColor.of(context).white,
                            inactiveToggleColor: CustomAppColor.of(
                              context,
                            ).white,
                            width: 40.setWidth,
                            height: 22.setHeight,
                            toggleSize: 16.0,
                            borderRadius: 16.0,
                            padding: 2.5,
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: const Divider(),
                  ),
                  CommonText(
                    text: Languages.of(context).txtSchedule,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  ListTile(
                    minTileHeight: 1.setHeight,
                    contentPadding: EdgeInsets.zero,
                    title: CommonText(
                      text: Languages.of(context).txtStart,
                      textAlign: TextAlign.start,
                      fontSize: 18.setFontSize,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(text: startTime.format(context)),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                      );
                      if (time != null) {
                        setState(() => startTime = time);
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    minTileHeight: 1.setHeight,
                    contentPadding: EdgeInsets.zero,
                    title: CommonText(
                      text: Languages.of(context).txtEnd,
                      textAlign: TextAlign.start,
                      fontSize: 18.setFontSize,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(text: endTime.format(context)),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: endTime,
                      );
                      if (time != null) {
                        setState(() => endTime = time);
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    minTileHeight: 1.setHeight,
                    contentPadding: EdgeInsets.zero,
                    title: CommonText(
                      text: Languages.of(context).txtInterval,
                      textAlign: TextAlign.start,
                      fontSize: 18.setFontSize,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(
                          text:
                              "Every $interval hour${interval == 1 ? '' : 's'}",
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                    onTap: () => showSetTargetBottomSheet(context),
                  ),
                  Divider(),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: Languages.of(context).txtMessage,
                    textColor: CustomAppColor(context).txtGrey,
                  ),
                  SizedBox(height: 10.setHeight),

                  CommonText(
                    text: Languages.of(context).txtItIsTimeToDrinkWater,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.setFontSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSetTargetBottomSheet(BuildContext context) {
    final List<String> volumeOptions = [
      "Every 0.5 hours",
      "Every 1 hours",
      "Every 1.5 hours",
      "Every 2 hours",
    ];
    int selectedIndex = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          bottom: true,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.all(20.setWidth),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScaffold,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtSetInterval,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 50,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex =
                                  (selectedIndex - 1 + volumeOptions.length) %
                                  volumeOptions.length;
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.setHeight),
                          height: 1.setHeight,
                          width: 170.setWidth,
                          color: CustomAppColor.of(context).primary,
                        ),
                        CommonText(
                          text: volumeOptions[selectedIndex],
                          fontSize: 20.setFontSize,
                          fontWeight: FontWeight.bold,
                          textColor: CustomAppColor.of(context).txtPurple,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.setHeight),
                          height: 1.setHeight,
                          width: 170.setWidth,
                          color: CustomAppColor.of(context).primary,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 50,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex =
                                  (selectedIndex + 1) % volumeOptions.length;
                            });
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 8.setHeight),

                    SizedBox(height: 10.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtCancel,
                            buttonColor: CustomAppColor.of(
                              context,
                            ).containerBgPurple,
                            buttonTextColor: CustomAppColor.of(
                              context,
                            ).txtPurpleWhite,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(width: 15.setWidth),
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtSet,
                            buttonColor: CustomAppColor.of(context).primary,
                            buttonTextColor: Colors.white,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
