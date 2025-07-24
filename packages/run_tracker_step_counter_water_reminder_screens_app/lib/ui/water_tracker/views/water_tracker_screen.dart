import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/water_tracker_setting/views/water_tracker_setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodels/water_tracker_data.dart';

class WaterTrackerScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => WaterTrackerScreen());
  }

  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen>
    implements TopBarClickListener {
  int currentWater = 300;
  int waterGoal = 2000;
  int selectedAmount = 100;
  final List<int> allowedAmounts = [100, 150, 250, 500];
  WaterRecord? reminderStatus = WaterRecord(time: "Turned Off", amount: 100);

  List<WaterRecord> records = [
    WaterRecord(time: "12:06 PM", amount: 100),
    WaterRecord(time: "11:00 PM", amount: 150),
    WaterRecord(time: "10:05 PM", amount: 100),
    WaterRecord(time: "10:30 PM", amount: 100),
  ];

  String getContainerIcon(int amount) {
    switch (amount) {
      case 100:
        return AppAssets.icFill100;
      case 150:
        return AppAssets.icFill150;
      case 250:
        return AppAssets.icFill250;
      case 500:
        return AppAssets.icFill500;
      default:
        return AppAssets.icFill100;
    }
  }

  String getRecordIcon(int amount) {
    switch (amount) {
      case 100:
        return AppAssets.icFill100;
      case 150:
        return AppAssets.icFill150;
      case 250:
        return AppAssets.icFill250;
      case 500:
        return AppAssets.icFill500;
      default:
        return AppAssets.icEmpty100;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
  }

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
              isShowBack: true,
              isShowSetting: true,
              simpleTitle: Languages.of(context).txtToday,
              shortHeading: Languages.of(context).txtDrinkWater,
              isShowSimpleTitle: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.setHeight),
                    buildCircularIndicator(currentWater, waterGoal),
                    SizedBox(height: 20.setHeight),
                    buildIncrementSelector(),
                    SizedBox(height: 20.setHeight),
                    buildContainerSelector(),
                    SizedBox(height: 24.setHeight),
                    buildWeeklyGraphPlaceholder(),
                    SizedBox(height: 24.setHeight),
                    buildRecordList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircularIndicator(int current, int goal) {
    double value = current / goal;
    return SizedBox(
      height: 245.setHeight,
      width: 245.setWidth,
      child: LiquidCircularProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        borderColor: CustomAppColor.of(context).greyDivider,
        borderWidth: 1.0,
        direction: Axis.vertical,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 26.setHeight),
            Image.asset(
              AppAssets.icWaterBottle,
              height: 60.setHeight,
              width: 60.setWidth,
            ),
            CommonText(
              text: '$current',
              fontSize: 48.setFontSize,
              fontWeight: FontWeight.w700,
            ),
            CommonText(
              text: '/$waterGoal ml',
              fontSize: 16,
              textColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainerSelector() {
    final List<int> amounts = [100, 150, 250, 500];
    final List<String> emptyIcons = [
      AppAssets.icEmpty100,
      AppAssets.icEmpty150,
      AppAssets.icEmpty250,
      AppAssets.icEmpty500,
    ];
    final List<String> fillIcons = [
      AppAssets.icFill100,
      AppAssets.icFill150,
      AppAssets.icFill250,
      AppAssets.icFill500,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(amounts.length, (index) {
          final amount = amounts[index];
          final isSelected = selectedAmount == amount;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedAmount = amount;
                currentWater += amount;
                records.insert(
                  0,
                  WaterRecord(time: getCurrentTime(), amount: amount),
                );
              });
            },
            child: Column(
              children: [
                Image.asset(
                  isSelected ? fillIcons[index] : emptyIcons[index],
                  height: 48.setHeight,
                ),
                SizedBox(height: 4),
                CommonText(
                  text: '$amount ml',
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? "PM" : "AM";
    return "${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period";
  }

  Widget buildRecordList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12.setHeight),
          child: CommonText(
            text: Languages.of(context).txtTodayRecords,
            fontSize: 17.setFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        buildTurnedOffRow(),
        Column(
          children: records.asMap().entries.map((entry) {
            final index = entry.key;
            final record = entry.value;
            final showDivider = index < records.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: 10.setHeight),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        getRecordIcon(record.amount),
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      if (showDivider)
                        Container(
                          margin: EdgeInsets.only(top: 6.setHeight),
                          width: 2.setWidth,
                          height: 30.setHeight,
                          color: Color(0xFF9195B6),
                        ),
                    ],
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: record.time,
                          fontSize: 17.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                  // Amount + more icon
                  Row(
                    children: [
                      CommonText(
                        text: "${record.amount} ml",
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(width: 10.setWidth),
                      Icon(
                        Icons.more_vert,
                        color: CustomAppColor.of(context).txtGrey,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildTurnedOffRow() {
    return Stack(
      children: [
        Positioned(
          left: 12.setWidth,
          top: 28.setHeight,
          bottom: 6.setHeight,
          child: Container(
            width: 2.setWidth,
            height: 26.setHeight,
            color: Color(0xFF9195B6),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 26.setHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.access_time,
                size: 24.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Turned Off",
                      fontSize: 17.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    CommonText(
                      text: "Next time",
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(width: 12.setWidth),
                  ],
                ),
              ),
              Row(
                children: [
                  CommonText(
                    text: "100 ml",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  SizedBox(width: 10.setWidth),
                  Icon(
                    Icons.more_vert,
                    color: CustomAppColor.of(context).txtGrey,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildWeeklyGraphPlaceholder() {
    final List<double> weekData = [10000, 8500, 7500, 6000, 4800, 3500, 2500];

    return Column(
      children: [
        CommonText(
          text: Languages.of(context).txtWeek,
          fontWeight: FontWeight.w700,
          fontSize: 24.setFontSize,
        ),
        SizedBox(height: 10.setHeight),
        Container(
          height: 3.setHeight,
          width: 30.setWidth,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: "April 03 - April 09",
          fontWeight: FontWeight.w400,
          fontSize: 14.setFontSize,
        ),
        SizedBox(height: 20.setHeight),
        SizedBox(
          height: 150.setHeight,
          child: BarChart(
            BarChartData(
              barGroups: weekData.asMap().entries.map((entry) {
                int index = entry.key;
                double value = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: 10000,
                      rodStackItems: [
                        BarChartRodStackItem(0, 10000, Colors.grey.shade200),
                        BarChartRodStackItem(0, value, Color(0xFF37E1FF)),
                      ],
                      width: 30,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final days = [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                      ];
                      String label = days[value.toInt()];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CommonText(
                          text: label,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: false,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: CustomAppColor.of(context).grey,
                  ),
                ),
              ),
              gridData: FlGridData(show: false),
              barTouchData: BarTouchData(enabled: false),
            ),
          ),
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: "Weekly Average: 2,000 ml",
          fontWeight: FontWeight.w500,
          fontSize: 14.setFontSize,
          textColor: Colors.lightBlueAccent,
        ),
      ],
    );
  }

  Widget buildIncrementSelector() {
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        Image.asset(
          AppAssets.icUpArrow,
          height: 15.setHeight,
          width: 15.setWidth,
        ),
        SizedBox(height: 20.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  final currentIndex = allowedAmounts.indexOf(selectedAmount);
                  if (currentIndex > 0) {
                    selectedAmount = allowedAmounts[currentIndex - 1];
                  }
                });
              },
              child: Icon(
                Icons.remove,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
            SizedBox(width: 20.setWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  getContainerIcon(selectedAmount),
                  height: 48.setHeight,
                ),
                SizedBox(height: 4),
                Text(
                  "$selectedAmount ml",
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomAppColor.of(context).txtGrey,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.setWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  final currentIndex = allowedAmounts.indexOf(selectedAmount);
                  if (currentIndex < allowedAmounts.length - 1) {
                    selectedAmount = allowedAmounts[currentIndex + 1];
                  }
                });
              },
              child: Icon(
                Icons.add,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSetting) {
      Navigator.push(context, WaterTrackerSettingScreen.route());
    }
  }
}
