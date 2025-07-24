import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/app/my_app.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/languages/views/languages_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/reminder/views/reminder_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';

class SettingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => SettingScreen());
  }

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    implements TopBarClickListener {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowSimpleTitle: true,
              simpleTitle: Languages.of(context).txtSettings,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.setWidth,
                    vertical: 12.setHeight,
                  ),
                  child: Column(
                    children: [
                      ReminderView(),
                      SizedBox(height: 16.setHeight),
                      UnitSettingsView(),
                      SizedBox(height: 16.setHeight),
                      GeneralSettingsView(isDarkMode: isDarkMode),
                      SizedBox(height: 16.setHeight),
                      SupportUsView(),
                    ],
                  ),
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

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(context, ReminderScreen.route()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icNotifications,
                    width: 22.setHeight,
                    height: 22.setHeight,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                  SizedBox(width: 18.setWidth),
                  CommonText(
                    text: Languages.of(context).txtReminder,
                    fontSize: 18.setFontSize,
                  ),
                ],
              ),
              Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
        SizedBox(height: 15.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
      ],
    );
  }
}

class SupportUsView extends StatelessWidget {
  const SupportUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtSupportUs.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            Image.asset(
              AppAssets.icEmail,
              width: 22.setHeight,
              height: 22.setHeight,
              color: CustomAppColor.of(context).icBlack,
            ),
            SizedBox(width: 18.setWidth),
            CommonText(
              text: Languages.of(context).txtFeedback,
              fontSize: 18.setFontSize,
            ),
          ],
        ),
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            Image.asset(
              AppAssets.icStar,
              width: 22.setHeight,
              height: 22.setHeight,
              color: CustomAppColor.of(context).icBlack,
            ),
            SizedBox(width: 18.setWidth),
            CommonText(
              text: Languages.of(context).txtRateUs,
              fontSize: 18.setFontSize,
            ),
          ],
        ),
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            Image.asset(
              AppAssets.icPrivacy,
              width: 22.setHeight,
              height: 22.setHeight,
              color: CustomAppColor.of(context).icBlack,
            ),
            SizedBox(width: 18.setWidth),
            CommonText(
              text: Languages.of(context).txtPrivacyPolicy,
              fontSize: 18.setFontSize,
            ),
          ],
        ),
      ],
    );
  }
}

class GeneralSettingsView extends StatelessWidget {
  final ValueNotifier<bool> isDarkMode;
  const GeneralSettingsView({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtGeneralSettings.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: 25.setHeight),
        GestureDetector(
          onTap: () => Navigator.push(context, LanguageScreen.route()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icTranslate,
                    width: 22.setHeight,
                    height: 22.setHeight,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                  SizedBox(width: 18.setWidth),
                  CommonText(
                    text: Languages.of(context).txtLanguageOptions,
                    fontSize: 18.setFontSize,
                  ),
                ],
              ),
              CommonText(text: "English", fontSize: 16.setFontSize),
            ],
          ),
        ),
        SizedBox(height: 25.setHeight),
        GestureDetector(
          onTap: () => showDaySelectBottomSheet(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icCalender,
                    width: 22.setHeight,
                    height: 22.setHeight,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                  SizedBox(width: 18.setWidth),
                  CommonText(
                    text: Languages.of(context).txtFirstFayOfWeek,
                    fontSize: 18.setFontSize,
                  ),
                ],
              ),
              Row(
                children: [
                  CommonText(text: "Monday", fontSize: 16.setFontSize),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 25.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.icMode,
                  width: 22.setHeight,
                  height: 22.setHeight,
                  color: CustomAppColor.of(context).icBlack,
                ),
                SizedBox(width: 18.setWidth),
                CommonText(
                  text: Languages.of(context).txtDarkMode,
                  fontSize: 18.setFontSize,
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isDarkMode,
              builder: (context, value, child) {
                return FlutterSwitch(
                  value: value,
                  onToggle: (bool newValue) {
                    isDarkMode.value = newValue;

                    getIt.get<LocalStorageService>().setBool(
                      LocalStorageService.isLightTheme,
                      !newValue,
                    );
                    final newTheme = newValue
                        ? ThemeData.dark()
                        : ThemeData.light();
                    RunTrackerStepCounterWaterReminderApp.changeTheme(
                      context,
                      newTheme,
                    );
                  },
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
        SizedBox(height: 15.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
      ],
    );
  }

  void showDaySelectBottomSheet(BuildContext context) {
    int currentDayIndex = 0;
    List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

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
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtFirstFayOfWeek,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.setHeight),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_drop_up,
                        size: 50,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          currentDayIndex =
                              (currentDayIndex - 1 + daysOfWeek.length) %
                              daysOfWeek.length;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.setHeight),
                      height: 1.setHeight,
                      width: 120.setWidth,
                      color: CustomAppColor.of(context).primary,
                    ),
                    CommonText(
                      text: daysOfWeek[currentDayIndex],
                      fontSize: 20.setFontSize,
                      fontWeight: FontWeight.bold,
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.setHeight),
                      height: 1.setHeight,
                      width: 120.setWidth,
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
                          currentDayIndex =
                              (currentDayIndex + 1) % daysOfWeek.length;
                        });
                      },
                    ),
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
                            ).txtPurple,
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
}

class UnitSettingsView extends StatelessWidget {
  const UnitSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtUnitSettings.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: 25.setHeight),
        GestureDetector(
          onTap: () => showUnitPickerBottomSheet(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icSwap,
                    width: 24.setHeight,
                    height: 24.setHeight,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                  SizedBox(width: 18.setWidth),
                  CommonText(
                    text: Languages.of(context).txtMetricAndImperialUnit,
                    fontSize: 18.setFontSize,
                  ),
                ],
              ),
              Row(
                children: [
                  CommonText(text: "KM", fontSize: 14.setFontSize),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
      ],
    );
  }

  void showUnitPickerBottomSheet(BuildContext context) {
    String tempUnit = "KM";

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
                          text: Languages.of(context).txtSetUnit,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.setHeight),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_drop_up,
                        size: 50,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          tempUnit = (tempUnit == "KG") ? "LBS" : "KG";
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.setHeight),
                      height: 1.setHeight,
                      width: 80.setWidth,
                      color: CustomAppColor.of(context).primary,
                    ),
                    CommonText(
                      text: tempUnit,
                      fontSize: 20.setFontSize,
                      fontWeight: FontWeight.bold,
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.setHeight),
                      height: 1.setHeight,
                      width: 80.setWidth,
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
                          tempUnit = (tempUnit == "KG") ? "LBS" : "KG";
                        });
                      },
                    ),
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
                            ).txtBlack,
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
                              // Pass the selected unit back if needed
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
}
