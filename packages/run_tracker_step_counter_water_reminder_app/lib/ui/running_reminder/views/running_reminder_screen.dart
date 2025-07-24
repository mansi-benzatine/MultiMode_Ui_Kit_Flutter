import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';

class RunningReminderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => RunningReminderScreen());
  }

  const RunningReminderScreen({super.key});

  @override
  State<RunningReminderScreen> createState() => _RunningReminderScreenState();
}

class _RunningReminderScreenState extends State<RunningReminderScreen>
    implements TopBarClickListener {
  ValueNotifier<bool> isDailyReminder = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              simpleTitle: Languages.of(context).txtRunningReminder,
              isShowBack: true,
              isShowSimpleTitle: true,
            ),
            Column(
              children: [DailyReminderView(isDailyReminder: isDailyReminder)],
            ),
          ],
        ),
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

class DailyReminderView extends StatefulWidget {
  final ValueNotifier<bool> isDailyReminder;

  const DailyReminderView({super.key, required this.isDailyReminder});

  @override
  State<DailyReminderView> createState() => _DailyReminderViewState();
}

class _DailyReminderViewState extends State<DailyReminderView> {
  TimeOfDay selectedTime = TimeOfDay(hour: 5, minute: 0); // Default to 5:00 AM

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.setHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDailyReminder.toUpperCase(),
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: widget.isDailyReminder,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {},
                        activeColor: CustomAppColor.of(context).primary,
                        inactiveColor: CustomAppColor.of(
                          context,
                        ).grey.withValues(alpha: 0.5),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
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
              SizedBox(height: 10.setHeight),

              GestureDetector(
                onTap: () => _selectTime(context),
                child: Row(
                  children: [
                    CommonText(
                      text: "05:00 AM",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: CustomAppColor.of(context).primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),

          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 10.setHeight),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: Languages.of(context).txtDailyReminder.toUpperCase(),
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Sun, Mon, tue, Wed, thu".toUpperCase(),
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtPurple,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: CustomAppColor.of(context).primary,
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Divider(color: CustomAppColor.of(context).containerBorder),
            ],
          ),
        ],
      ),
    );
  }
}
