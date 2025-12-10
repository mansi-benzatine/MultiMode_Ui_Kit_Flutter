import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/edit_medicine/view/edit_medicine_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../datamodel/pill_reminder_data.dart';

class PillReminderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PillReminderScreen());
  }

  const PillReminderScreen({super.key});

  @override
  State<PillReminderScreen> createState() => _PillReminderScreenState();
}

class _PillReminderScreenState extends State<PillReminderScreen> implements TopBarClickListener {
  final List<PillReminder> _reminders = [
    PillReminder(name: 'Folic Acid', time: '10:00 AM', days: ['S', 'T', 'W', 'T', 'F', 'S'], isReminderOn: false),
    PillReminder(name: 'Folic Acid', time: '10:00 AM', days: ['S', 'M', 'F', 'S'], isReminderOn: true),
    PillReminder(name: 'Folic Acid', time: '10:00 AM', days: ['T', 'W', 'T', 'F', 'S'], isReminderOn: false),
    PillReminder(name: 'Folic Acid', time: '10:00 AM', days: ['S', 'M', 'T', 'W', 'T'], isReminderOn: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: "Pill Reminder",
            isShowBack: true,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              itemCount: _reminders.length,
              itemBuilder: (context, index) {
                final reminder = _reminders[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 15.setHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      border: Border.all(
                        color: CustomAppColor.of(context).grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).btnGrey,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AppAssets.icMedicine,
                                      height: 20.setHeight,
                                      width: 20.setWidth,
                                    ),
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: reminder.name,
                                        fontFamily: Constant.fontFamilySemiBold600,
                                        fontSize: 16.setFontSize,
                                      ),
                                      CommonText(
                                        text: reminder.time,
                                        fontSize: 12.setFontSize,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IgnorePointer(
                              ignoring: true,
                              child: GestureDetector(
                                child: Image.asset(
                                  AppAssets.icEdit,
                                  color: CustomAppColor.of(context).icBlackWhite,
                                  width: 16.setWidth,
                                  height: 16.setHeight,
                                ),
                                onTap: () => Navigator.push(context, EditMedicineScreen.route()),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 25.setHeight,
                          color: CustomAppColor.of(context).border,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].asMap().entries.map((entry) {
                                  final day = entry.value;
                                  final bool isSelected = reminder.days.contains(day);
                                  return Padding(
                                    padding: EdgeInsets.only(right: 4.setWidth),
                                    child: Container(
                                      height: 20.setHeight,
                                      width: 20.setWidth,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).bgScreen,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGrey,
                                        ),
                                      ),
                                      child: CommonText(
                                        text: day,
                                        height: 0,
                                        textColor: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGrey,
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Row(
                              children: [
                                CommonText(
                                  text: Languages.of(context).txtReminder.replaceAll("s", ""),
                                  fontSize: 12.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                ),
                                SizedBox(width: 5.setWidth),
                                FlutterSwitch(
                                  value: reminder.isReminderOn,
                                  onToggle: (bool newValue) {
                                    setState(() {
                                      _reminders[index].isReminderOn = newValue;
                                    });
                                  },
                                  activeColor: Colors.green,
                                  inactiveColor: CustomAppColor.of(context).grey,
                                  activeToggleColor: CustomAppColor.of(context).white,
                                  inactiveToggleColor: CustomAppColor.of(context).white,
                                  width: 40.setWidth,
                                  height: 22.setHeight,
                                  toggleSize: 16.0,
                                  borderRadius: 16.0,
                                  padding: 2.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          /*   Navigator.push(context, AddMedicineScreen.route());*/
        },
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add, color: Colors.white),
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
