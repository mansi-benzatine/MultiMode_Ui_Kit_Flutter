import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/dialogs/bottom_sheet/repeat_bottom_sheet_dialog.dart';
import 'package:step_counter_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/constant.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../dialogs/bottom_sheet/daily_reminder_bottom_sheet_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class ReminderScreen extends StatefulWidget {
  final bool isShowDailyReminderBs;
  final bool isShowRepeat;
  const ReminderScreen({super.key, this.isShowDailyReminderBs = false, this.isShowRepeat = false});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ReminderScreen());
  }

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> implements TopBarClickListener {
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowDailyReminderBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          context,
          isScrollControlled: false,
          isDismissible: false,
          title: Languages.of(context).txtDailyReminder,
          widgets: DailyReminderBottomSheetDialog(onSave: () {}),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }

    if (widget.isShowRepeat) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          context,
          isScrollControlled: false,
          isDismissible: false,
          title: Languages.of(context).txtRepeat,
          widgets: RepeatBottomSheetDialog(onSave: () {}),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtReminder,
            textAlign: Alignment.centerLeft,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 30.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: CustomAppColor.of(context).borderColor),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 16.setHeight),
                    child: Column(
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () {
                              Utils.showBottomSheetDialog(
                                context,
                                title: Languages.of(context).txtDailyReminder,
                                widgets: DailyReminderBottomSheetDialog(onSave: () {}),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.icAlarmClock,
                                    height: 24.setHeight,
                                    width: 24.setWidth,
                                  ),
                                  SizedBox(width: 15.setWidth),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: Languages.of(context).txtDailyReminder,
                                          fontSize: 16.setFontSize,
                                          fontWeight: FontWeight.w500,
                                          textColor: CustomAppColor.of(context).txtBlack,
                                          textAlign: TextAlign.start,
                                          height: 1,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CommonText(
                                              text: "08:30 AM",
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              textColor: CustomAppColor.of(context).txtPrimary,
                                            ),
                                            SizedBox(width: 5.setWidth),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 4.setHeight),
                                              child: Image.asset(
                                                AppAssets.icArrowDropDown,
                                                height: 28.setHeight,
                                                width: 28.setHeight,
                                                color: CustomAppColor.of(context).txtBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.setHeight),
                        Divider(
                          color: CustomAppColor.of(context).dividerColor,
                          thickness: 1,
                        ),
                        SizedBox(height: 10.setHeight),
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () {
                              Utils.showBottomSheetDialog(
                                context,
                                title: Languages.of(context).txtRepeat,
                                widgets: RepeatBottomSheetDialog(onSave: () {}),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.icRepeat,
                                    height: 24.setHeight,
                                    width: 24.setWidth,
                                  ),
                                  SizedBox(width: 15.setWidth),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: Languages.of(context).txtRepeat,
                                          fontSize: 16.setFontSize,
                                          fontWeight: FontWeight.w500,
                                          textColor: CustomAppColor.of(context).txtBlack,
                                          textAlign: TextAlign.start,
                                          height: 1,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CommonText(
                                              text: "Sun, Mon, Tue, Wed, Thu, Fri, Sat",
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              textColor: CustomAppColor.of(context).txtPrimary,
                                            ),
                                            SizedBox(width: 5.setWidth),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 4.setHeight),
                                              child: Image.asset(
                                                AppAssets.icArrowDropDown,
                                                height: 28.setHeight,
                                                width: 28.setHeight,
                                                color: CustomAppColor.of(context).txtBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
