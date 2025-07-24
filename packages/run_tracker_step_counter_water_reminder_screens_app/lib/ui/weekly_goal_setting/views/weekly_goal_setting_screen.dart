import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../fill_information/datamodels/fill_information_data.dart';

class WeeklyGoalSettingScreen extends StatefulWidget {
  const WeeklyGoalSettingScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => WeeklyGoalSettingScreen());
  }

  @override
  State<WeeklyGoalSettingScreen> createState() =>
      _WeeklyGoalSettingScreenState();
}

class _WeeklyGoalSettingScreenState extends State<WeeklyGoalSettingScreen>
    with SingleTickerProviderStateMixin
    implements TopBarClickListener {
  late TabController _tabController;
  UnitType distanceUnit = UnitType.km;
  int selectedDistance = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    selectedDistance = distanceUnit == UnitType.km ? 1 : 3;
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
        child: Column(
          children: [
            TopBar(
              this,
              isShowSimpleTitle: true,
              isShowBack: true,
              simpleTitle: Languages.of(context).txtWeeklyGoalSetting,
            ),
            SizedBox(height: 30.setHeight),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3.0,
                          color: CustomAppColor.of(context).txtPurple,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 60.setWidth),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: CustomAppColor.of(context).txtPurple,
                      unselectedLabelColor: CustomAppColor.of(context).txtGrey,
                      labelStyle: TextStyle(
                        fontSize: 20.setFontSize,
                        fontWeight: FontWeight.w700,
                        fontFamily: Constant.fontFamily,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 20.setFontSize,
                        fontWeight: FontWeight.w700,
                        fontFamily: Constant.fontFamily,
                      ),
                      tabs: [
                        Tab(text: Languages.of(context).txtHeartHealth),
                        Tab(text: Languages.of(context).txtDistance),
                      ],
                    ),
                    SizedBox(height: 24.setHeight),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [_buildHeartHealthTab(), _buildDistanceTab()],
                      ),
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
        SizedBox(height: 20.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.amber, width: 2),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icYellowWalk,
                          width: 20.setWidth,
                          height: 20.setHeight,
                        ),
                        CommonText(
                          text: "300",
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                        ),
                        CommonText(
                          text: "min",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.setHeight),

                  CommonText(
                    text: Languages.of(context).txtModerateIntensity,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setHeight,
                vertical: 70.setHeight,
              ),
              child: CommonText(
                text: Languages.of(context).txtOr.toLowerCase(),
                fontWeight: FontWeight.w700,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icRedWalk,
                          width: 20.setWidth,
                          height: 20.setHeight,
                        ),
                        CommonText(
                          text: "150",
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                        ),
                        CommonText(
                          text: "min",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.setHeight),
                  CommonText(
                    text: Languages.of(context).txtHighIntensity,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 58.setHeight),
        CustomRangeSlider(),
        SizedBox(height: 58.setHeight),

        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtSetAsMyGoal,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDistanceTab() {
    final List<int> distances = List.generate(
      96,
      (index) => distanceUnit == UnitType.km ? index + 5 : index + 3,
    );

    return Column(
      children: [
        SizedBox(height: 40.setHeight),

        _buildUnitSwitch(
          selectedUnit: distanceUnit,
          firstUnit: UnitType.km,
          secondUnit: UnitType.mi,
          firstLabel: "KM",
          secondLabel: "MI",
          onUnitChanged: (unit) => setState(() => distanceUnit = unit),
        ),
        SizedBox(height: 58.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.icArrowSelect,
              height: 24.setHeight,
              width: 24.setWidth,
            ),
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
                    scrollController: FixedExtentScrollController(
                      initialItem: distances.contains(selectedDistance)
                          ? distances.indexOf(selectedDistance)
                          : 0,
                    ),
                    onSelectedItemChanged: (index) =>
                        setState(() => selectedDistance = distances[index]),
                    children: distances
                        .map(
                          (d) => Center(
                            child: CommonText(
                              text: "$d",
                              fontSize: 40.setFontSize,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColor.of(context).txtPurple,
                            ),
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
        SizedBox(height: 69.setHeight),
        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtSetAsMyGoal,
              onTap: () => Navigator.pop(context),
            ),
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
          Container(
            width: 83.setWidth,
            height: 1.setHeight,
            color: CustomAppColor.of(context).divider,
          ),
          Spacer(flex: 1),
          Container(
            width: 83.setWidth,
            height: 1.setHeight,
            color: CustomAppColor.of(context).divider,
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildUnitSwitch({
    required UnitType selectedUnit,
    required UnitType firstUnit,
    required UnitType secondUnit,
    required String firstLabel,
    required String secondLabel,
    required ValueChanged<UnitType> onUnitChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 35.setWidth,
        vertical: 15.setHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor.of(context).greyDivider),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onUnitChanged(firstUnit),
            child: CommonText(
              text: firstLabel,
              fontSize: 18.setFontSize,
              textColor: selectedUnit == firstUnit
                  ? CustomAppColor.of(context).primary
                  : Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
            child: Container(
              width: 1,
              height: 23.setHeight,
              color: CustomAppColor.of(context).greyDivider,
            ),
          ),
          GestureDetector(
            onTap: () => onUnitChanged(secondUnit),
            child: CommonText(
              text: secondLabel,
              fontSize: 18.setFontSize,
              textColor: selectedUnit == secondUnit
                  ? CustomAppColor.of(context).primary
                  : Colors.grey,
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

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  double _value = 1.0;

  void _increment() {
    setState(() {
      _value = (_value + 1).clamp(0.0, 5.0);
    });
  }

  void _decrement() {
    setState(() {
      _value = (_value - 1).clamp(0.0, 5.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          color: Colors.deepPurple,
          onPressed: _decrement,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  overlayShape: SliderComponentShape.noOverlay,
                  activeTrackColor: Colors.deepPurple,
                  inactiveTrackColor: CustomAppColor.of(
                    context,
                  ).containerBgPurple,
                  thumbColor: Colors.deepPurple,

                  overlayColor: Colors.deepPurple.withValues(alpha: 0.2),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8.0,
                  ),
                  trackHeight: 2,
                ),
                child: Slider(
                  value: _value,
                  min: 0,
                  max: 5,
                  divisions: 6,
                  onChanged: (newValue) {
                    setState(() => _value = newValue);
                  },
                ),
              ),
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        if (index == 0 || index == 4) {
                          return const SizedBox();
                        }
                        return Container(
                          width: 4.setWidth,
                          height: 4.setHeight,
                          color: CustomAppColor.of(context).primary,
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Plus button
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.deepPurple,
          onPressed: _increment,
        ),
      ],
    );
  }
}
