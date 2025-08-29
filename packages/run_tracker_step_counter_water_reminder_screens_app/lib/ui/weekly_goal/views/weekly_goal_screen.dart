import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/dashboard/views/dashboard_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../fill_information/datamodels/fill_information_data.dart';

class WeeklyGoalScreen extends StatefulWidget {
  final int currentIndex;
  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (_) => WeeklyGoalScreen(currentIndex: currentIndex));
  }

  const WeeklyGoalScreen({super.key, this.currentIndex = 0});

  @override
  State<WeeklyGoalScreen> createState() => _WeeklyGoalScreenState();
}

class _WeeklyGoalScreenState extends State<WeeklyGoalScreen> with SingleTickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  UnitType distanceUnit = UnitType.km;
  int selectedDistance = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: widget.currentIndex, length: 2, vsync: this);

    selectedDistance = distanceUnit == UnitType.km ? 5 : 3;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(this, isShowBack: true),
            SizedBox(height: 30.setHeight),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    CommonText(text: Languages.of(context).txtYourWeeklyGoalIsReady, fontWeight: FontWeight.w700, fontSize: 24.setFontSize, textColor: CustomAppColor.of(context).txtPurple),
                    SizedBox(height: 50.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: TabBar(
                        controller: _tabController,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3.0, color: CustomAppColor.of(context).txtPurple),
                          insets: EdgeInsets.symmetric(horizontal: 60.setWidth),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: CustomAppColor.of(context).txtPurple,
                        unselectedLabelColor: CustomAppColor.of(context).txtGrey,
                        labelStyle: TextStyle(fontSize: 20.setFontSize, fontWeight: FontWeight.w700, fontFamily: Constant.fontFamily),
                        unselectedLabelStyle: TextStyle(fontSize: 18.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily),
                        tabs: [
                          Tab(text: Languages.of(context).txtHeartHealth),
                          Tab(text: Languages.of(context).txtDistance),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.setHeight),

                    Expanded(
                      child: TabBarView(physics: NeverScrollableScrollPhysics(), controller: _tabController, children: [_buildHeartHealthTab(), _buildDistanceTab()]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartHealthTab() {
    return Column(
      children: [
        SizedBox(height: 49.setHeight),
        Row(
          children: [
            Image.asset(AppAssets.icGreenWalking, height: 49.setHeight, width: 49.setWidth),
            SizedBox(width: 17.setWidth),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: "150 Min Brisk walking".toUpperCase(), fontSize: 18.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPurple),
                  CommonText(text: "Pace between 9:00 - 15:00 min/km", fontSize: 16.setFontSize, fontWeight: FontWeight.w500, textColor: CustomAppColor.of(context).txtGrey, textAlign: TextAlign.start),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.setHeight),
          child: CommonText(text: Languages.of(context).txtOr.toUpperCase(), fontWeight: FontWeight.w700, fontSize: 15.setFontSize, textColor: CustomAppColor.of(context).txtGrey),
        ),
        Row(
          children: [
            Image.asset(AppAssets.icRedWalking, height: 49.setHeight, width: 49.setWidth),
            SizedBox(width: 17.setWidth),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: "75 min running".toUpperCase(), fontSize: 18.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPurple),
                CommonText(text: "Pace over 9:00 min/km", fontSize: 16.setFontSize, fontWeight: FontWeight.w500, textColor: CustomAppColor.of(context).txtGrey),
              ],
            ),
          ],
        ),
        SizedBox(height: 55.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.setHeight),
              child: Image.asset(AppAssets.icInfo, height: 24.setHeight, width: 24.setWidth),
            ),
            SizedBox(width: 13.setWidth),
            Expanded(
              child: CommonText(
                text: Languages.of(context).txtYouCanCombineTheseTwoKindsOfExerciseTogether,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtGrey,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(height: 58.setHeight),
        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
            child: CommonButton(text: Languages.of(context).txtSetAsMyGoal, onTap: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0))),
          ),
        ),
      ],
    );
  }

  Widget _buildDistanceTab() {
    final List<int> distances = List.generate(96, (index) => distanceUnit == UnitType.km ? index + 5 : index + 3);

    return Column(
      children: [
        SizedBox(height: 38.setHeight),

        _buildUnitSwitch(selectedUnit: distanceUnit, firstUnit: UnitType.km, secondUnit: UnitType.mi, firstLabel: "KM", secondLabel: "MILE", onUnitChanged: (unit) => setState(() => distanceUnit = unit)),
        SizedBox(height: 30.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.icArrowSelect, height: 24.setHeight, width: 24.setWidth),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 180.setHeight,
                  width: 100.setWidth,
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.1,
                    looping: true,
                    selectionOverlay: Container(),
                    itemExtent: 95.0,
                    scrollController: FixedExtentScrollController(initialItem: distances.contains(selectedDistance) ? distances.indexOf(selectedDistance) : 0),
                    onSelectedItemChanged: (index) => setState(() => selectedDistance = distances[index]),
                    children: distances
                        .map(
                          (d) => Center(
                            child: CommonText(text: "$d", fontSize: 40.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPurple),
                          ),
                        )
                        .toList(),
                  ),
                ),
                _buildPickerDivider(),
              ],
            ),
          ],
        ),
        SizedBox(height: 50.setHeight),
        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
            child: CommonButton(text: Languages.of(context).txtSetAsMyGoal, onTap: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0))),
          ),
        ),
      ],
    );
  }

  Widget _buildPickerDivider() {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          Container(width: 83.setWidth, height: 1.setHeight, color: CustomAppColor.of(context).divider),
          Spacer(flex: 1),
          Container(width: 83.setWidth, height: 1.setHeight, color: CustomAppColor.of(context).divider),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildUnitSwitch({required UnitType selectedUnit, required UnitType firstUnit, required UnitType secondUnit, required String firstLabel, required String secondLabel, required ValueChanged<UnitType> onUnitChanged}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 15.setHeight),
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor.of(context).greyDivider),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onUnitChanged(firstUnit),
            child: CommonText(text: firstLabel, fontSize: 18.setFontSize, textColor: selectedUnit == firstUnit ? CustomAppColor.of(context).primary : Colors.grey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
            child: Container(width: 1, height: 23.setHeight, color: CustomAppColor.of(context).greyDivider),
          ),
          GestureDetector(
            onTap: () => onUnitChanged(secondUnit),
            child: CommonText(text: secondLabel, fontSize: 18.setFontSize, textColor: selectedUnit == secondUnit ? CustomAppColor.of(context).primary : Colors.grey),
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
