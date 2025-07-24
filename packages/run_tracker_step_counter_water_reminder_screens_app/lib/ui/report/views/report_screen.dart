import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';

class ReportScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => ReportScreen());
  }

  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    implements TopBarClickListener {
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
              isShowSimpleTitle: true,
              simpleTitle: Languages.of(context).txtReport,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    children: [
                      ReportDetailsView(),
                      SizedBox(height: 20.setHeight),
                      GraphView(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.setWidth,
                vertical: 20.setHeight,
              ),

              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(text: Languages.of(context).txtWeek),
                  ),
                  SizedBox(width: 20.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtMonth,
                      buttonColor: CustomAppColor.of(context).containerBgPurple,
                      buttonTextColor: CustomAppColor.of(context).txtPurple,
                    ),
                  ),
                ],
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

class GraphView extends StatelessWidget {
  GraphView({super.key});

  final List<double> weekData = [10000, 8500, 7500, 6000, 4800, 3500, 2500];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonText(
          text: Languages.of(context).txtThisWeek.toUpperCase(),
          fontSize: 20.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        SizedBox(height: 40.setHeight),
        SizedBox(
          height: 400.setHeight,
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
                        BarChartRodStackItem(
                          0,
                          10000,
                          CustomAppColor.of(context).bgScaffold,
                        ),
                        BarChartRodStackItem(0, value, Color(0xFFFD86C9)),
                      ],
                      width: 27,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 25,
                    interval: 2000, // interval between titles
                    getTitlesWidget: (value, meta) {
                      final style = TextStyle(color: Colors.grey, fontSize: 12);

                      switch (value.toInt()) {
                        case 10000:
                          return Text('10k', style: style);
                        case 8000:
                          return Text('8k', style: style);
                        case 6000:
                          return Text('6k', style: style);
                        case 4000:
                          return Text('4k', style: style);
                        case 2000:
                          return Text('2k', style: style);
                        case 0:
                          return Text('0', style: style);
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final days = [
                        'Today',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun',
                      ];
                      String label = days[value.toInt()];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CommonText(
                          text: label,
                          fontSize: 12,
                          fontWeight: label == "Today"
                              ? FontWeight.w600
                              : FontWeight.w500,
                          textColor: label == "Today"
                              ? CustomAppColor.of(context).txtBlack
                              : CustomAppColor.of(context).txtGrey,
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
                show: true,
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
      ],
    );
  }
}

class ReportDetailsView extends StatelessWidget {
  const ReportDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CommonText(
              text: Languages.of(context).txtTotal.toUpperCase(),
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "250",
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Column(
          children: [
            CommonText(
              text: Languages.of(context).txtAverage.toUpperCase(),
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "50.25",
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
