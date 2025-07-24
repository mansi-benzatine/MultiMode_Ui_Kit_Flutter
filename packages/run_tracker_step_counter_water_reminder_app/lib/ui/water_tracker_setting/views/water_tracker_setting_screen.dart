import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../water_drink_reminder/views/water_drink_reminder_screen.dart';

class WaterTrackerSettingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WaterTrackerSettingScreen());
  }

  const WaterTrackerSettingScreen({super.key});

  @override
  State<WaterTrackerSettingScreen> createState() =>
      _WaterTrackerSettingScreenState();
}

class _WaterTrackerSettingScreenState extends State<WaterTrackerSettingScreen>
    implements TopBarClickListener {
  int target = 2000;

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
              isShowBack: true,
              simpleTitle: Languages.of(context).txtSettings,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: Column(
                  children: [
                    TargetView(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                      child: Divider(
                        thickness: 1,
                        color: CustomAppColor.of(context).containerGreyBorder,
                      ),
                    ),

                    DrinkReminderNavigationView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}

class TargetView extends StatelessWidget {
  const TargetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtTarget,
              fontSize: 18.setFontSize,
              fontWeight: FontWeight.w500,
            ),
            InkWell(
              onTap: () => showSetTargetBottomSheet(context),
              child: Row(
                children: [
                  CommonText(
                    text: "2000 ml",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
        CommonText(
          text: Languages.of(context).txtMostPeopleNeed2000MlADay,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
      ],
    );
  }

  void showSetTargetBottomSheet(BuildContext context) {
    final List<String> volumeOptions = [
      "1000 ml",
      "1500 ml",
      "2000 ml",
      "250 ml",
      "300 ml",
      "350 ml",
      "500 ml",
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
                          text: Languages.of(context).txtSetTarget,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.icSetTarget,
                          height: 96.setHeight,
                          width: 96.setWidth,
                        ),
                        SizedBox(width: 40.setWidth),
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
                                      (selectedIndex -
                                          1 +
                                          volumeOptions.length) %
                                      volumeOptions.length;
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
                              text: volumeOptions[selectedIndex],
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
                                  selectedIndex =
                                      (selectedIndex + 1) %
                                      volumeOptions.length;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
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
}

class DrinkReminderNavigationView extends StatelessWidget {
  const DrinkReminderNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, DrinkWaterReminder.route()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: Languages.of(context).txtDrinkWaterReminder,
            fontSize: 18.setFontSize,
          ),
          Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}
