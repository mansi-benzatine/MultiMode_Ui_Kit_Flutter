import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/counter%20/views/counter_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

class StartRunTrackerScreen extends StatefulWidget {
  const StartRunTrackerScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => StartRunTrackerScreen());
  }

  @override
  State<StartRunTrackerScreen> createState() => _StartRunTrackerScreenState();
}

class _StartRunTrackerScreenState extends State<StartRunTrackerScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox.expand(
                child: Image.asset(AppAssets.imgMap, fit: BoxFit.cover),
              ),
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(
                        this,
                        iconColor: CustomAppColor.of(context).white,
                        appbarColor: CustomAppColor.of(context).transparent,
                        isShowSimpleTitle: true,
                        isShowBack: true,
                        shortHeading: "",
                        simpleTitle: Languages.of(
                          context,
                        ).txtRunTracker.toUpperCase(),
                        textColor: CustomAppColor.of(context).white,
                        isShowFilter: true,
                      ),
                      SizedBox(height: 12.setHeight),
                      Center(
                        child: CommonText(
                          text: "10:50:25",
                          textColor: CustomAppColor.of(context).white,
                          fontWeight: FontWeight.w400,
                          fontSize: 60.setFontSize,
                        ),
                      ),
                      Center(
                        child: CommonText(
                          text: "MIN",
                          textColor: CustomAppColor.of(context).black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStat("10:65", "KM"),
                          _buildStat("45:30", "PACE(MIN/KM)"),
                          _buildStat("88:23", "KCAL"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.setWidth,
                    vertical: 20.setHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Image.asset(
                        AppAssets.icGPS,
                        width: 32.setWidth,
                        height: 32.setHeight,
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 30.setHeight,
                      right: 105.setWidth,
                      left: 105.setWidth,
                    ),
                    child: InkWell(
                      onTap: () =>
                          Navigator.push(context, CountdownScreen.route()),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.setHeight,
                          horizontal: 16.setWidth,
                        ),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CommonText(
                              text: Languages.of(
                                context,
                              ).txtStart.toUpperCase(),
                              fontWeight: FontWeight.w900,
                              fontSize: 22.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                            ),
                            Image.asset(
                              AppAssets.icArrowSelect,
                              color: CustomAppColor.of(context).white,
                              height: 32.setHeight,
                              width: 32.setWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: CustomAppColor.of(context).white,
            fontFamily: "Oswald",
            fontWeight: FontWeight.w400,
            fontSize: 32.setFontSize,
          ),
        ),
        CommonText(
          text: label,
          textColor: CustomAppColor.of(context).black,
          fontWeight: FontWeight.w500,
          fontSize: 14.setFontSize,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
