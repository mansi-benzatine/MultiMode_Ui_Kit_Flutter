import 'package:flutter/material.dart';
import 'package:run_tracker_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/constant.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/button/common_button.dart';
import 'package:run_tracker_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class ReminderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => ReminderScreen());
  }

  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TopBar(
                    this,
                    isShowBack: true,
                    isShowSimpleTitle: true,
                    simpleTitle: Languages.of(
                      context,
                    ).txtReminder.toUpperCase(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.setWidth,
                      vertical: 15.setHeight,
                    ),
                    child: ReminderView(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 42.setWidth,
                vertical: 20.setHeight,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  onTap: () => Navigator.pop(context),
                  text: Languages.of(context).txtSave,
                  radius: 30,
                  buttonTextColor: CustomAppColor.of(context).txtWhite,
                  buttonColor: CustomAppColor.of(context).primary,
                ),
              ),
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

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.setWidth,
        vertical: 14.setHeight,
      ),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).containerBgColor,
        border: Border.all(color: CustomAppColor.of(context).border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icAlarm,
                    height: 24.setHeight,
                    width: 24.setWidth,
                  ),
                  SizedBox(width: 16.setWidth),
                  GestureDetector(
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                      );
                      if (time != null) {
                        setState(() => startTime = time);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtReminder,
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        Row(
                          children: [
                            CommonText(
                              text: startTime.format(context),
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: 10.setWidth),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Divider(
              color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icRepeat,
                      height: 24.setHeight,
                      width: 24.setWidth,
                    ),
                    SizedBox(width: 16.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtRepeat,
                            fontSize: 18.setFontSize,
                            fontWeight: FontWeight.w400,
                          ),
                          GestureDetector(
                            onTap: () => showRepeatDaysBottomSheet(),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonText(
                                    text: "Sun, Mon, Tue, Wed, Thu, Fri, Sat",
                                    fontSize: 13.setFontSize,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showRepeatDaysBottomSheet() {
    final List<String> days = [
      Languages.of(context).txtSunday,
      Languages.of(context).txtMonday,
      Languages.of(context).txtTuesday,
      Languages.of(context).txtWednesday,
      Languages.of(context).txtThursday,
      Languages.of(context).txtFriday,
      Languages.of(context).txtSaturday,
    ];

    final List<bool> selected = [true, true, true, true, true, false, false];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bottomNavbar,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 4,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonText(
                      text: Languages.of(context).txtRepeat.toUpperCase(),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.setFontSize,
                    ),
                    SizedBox(height: 5.setHeight),

                    Divider(),

                    ...List.generate(days.length, (index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: selected[index],
                            onChanged: (value) {
                              setModalState(
                                () => selected[index] = value ?? false,
                              );
                            },
                            activeColor: CustomAppColor.of(context).primary,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(
                              color: CustomAppColor.of(context).grey,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          SizedBox(width: 8),
                          CommonText(
                            text: days[index],
                            textColor: selected[index]
                                ? CustomAppColor.of(context).primary
                                : CustomAppColor.of(context).txtDarkGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.setFontSize,
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 20),
                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            height: 40.setHeight,
                            buttonColor: CustomAppColor.of(context).transparent,
                            borderColor: CustomAppColor.of(context).primary,
                            text: Languages.of(context).txtCancel,
                            buttonTextSize: 14.setFontSize,
                            buttonTextColor: CustomAppColor.of(context).primary,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CommonButton(
                            buttonColor: CustomAppColor.of(context).primary,
                            height: 40.setHeight,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: Languages.of(context).txtSave,
                            buttonTextSize: 14.setFontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
