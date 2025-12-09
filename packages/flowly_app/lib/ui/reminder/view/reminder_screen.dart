import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ReminderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReminderScreen());
  }

  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> implements TopBarClickListener {
  bool periodStart = true;
  bool fertileWindow = false;
  bool ovulation = true;
  bool periodEnd = false;

  bool medicine = true;
  bool logWeight = true;
  bool logHeight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtReminders,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  reminderCard(
                    title: "Cycle",
                    rows: [
                      reminderRow(
                        "Period start",
                        value: periodStart,
                        onChanged: (v) => setState(() => periodStart = v),
                      ),
                      Divider(color: CustomAppColor.of(context).dividerColor),
                      reminderRow(
                        "Fertile window",
                        value: fertileWindow,
                        onChanged: (v) => setState(() => fertileWindow = v),
                      ),
                      Divider(color: CustomAppColor.of(context).dividerColor),
                      reminderRow(
                        "Ovulation",
                        value: ovulation,
                        onChanged: (v) => setState(() => ovulation = v),
                      ),
                      Divider(color: CustomAppColor.of(context).dividerColor),
                      reminderRow(
                        "Period end",
                        value: periodEnd,
                        onChanged: (v) => setState(() => periodEnd = v),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  reminderCard(
                    title: "Life style",
                    rows: [
                      reminderRow(
                        "Medicine",
                        value: medicine,
                        onChanged: (v) => setState(() => medicine = v),
                      ),
                      Divider(color: CustomAppColor.of(context).dividerColor),
                      reminderRow(
                        "Log weight",
                        value: logWeight,
                        onChanged: (v) => setState(() => logWeight = v),
                      ),
                      Divider(color: CustomAppColor.of(context).dividerColor),
                      reminderRow(
                        "Log height",
                        value: logHeight,
                        onChanged: (v) => setState(() => logHeight = v),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reminderCard({required String title, required List<Widget> rows}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 12.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          const SizedBox(height: 5),
          ...rows,
        ],
      ),
    );
  }

  Widget reminderRow(String title, {required bool value, required ValueChanged<bool> onChanged}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontFamily: Constant.fontFamilyMulishMedium500,
          ),
          FlutterSwitch(
            value: value,
            onToggle: onChanged,
            activeColor: CustomAppColor.of(context).primary,
            inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
            activeToggleColor: CustomAppColor.of(context).white,
            inactiveToggleColor: CustomAppColor.of(context).white,
            width: 40.setWidth,
            height: 22.setHeight,
            toggleSize: 20.0,
            borderRadius: 16.0,
            padding: 2.5,
          ),
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
