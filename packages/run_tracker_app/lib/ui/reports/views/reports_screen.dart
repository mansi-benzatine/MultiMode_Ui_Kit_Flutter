import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/text/common_text.dart';
import 'package:run_tracker_app/widgets/top_bar/topbar.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            isShowSimpleTitle: true,
            simpleTitle: Languages.of(context).txtAppName.toUpperCase(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyProgressView(),
                  StatisticsView(),
                  SizedBox(height: 60.setHeight),
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
    // TODO: implement onTopBarClick
  }
}

class MyProgressView extends StatelessWidget {
  const MyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.setWidth,
        vertical: 20.setHeight,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtMyProgress,
                    fontSize: 17.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonText(
                    text: "0.00",
                    fontSize: 48.setFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonText(
                    text: Languages.of(context).txtTotalKm.toUpperCase(),
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtDarkGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Image.asset(
                  AppAssets.icRunShoes,
                  height: 45.setHeight,
                  color: CustomAppColor.of(context).primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "0.01",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.setFontSize,
                  ),
                  CommonText(
                    text: Languages.of(context).txtTotalHours.toUpperCase(),
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtDarkGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "4.9",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.setFontSize,
                  ),
                  CommonText(
                    text: Languages.of(context).txtTotalKcal.toUpperCase(),
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtDarkGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "0.00",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.setFontSize,
                  ),
                  CommonText(
                    text: Languages.of(context).txtAvgPace.toUpperCase(),
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtDarkGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.setWidth,
              vertical: 4.setHeight,
            ),
            color: CustomAppColor.of(context).primary,
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: Languages.of(context).txtSeeMore.toUpperCase(),
                    textColor: CustomAppColor.of(context).txtWhite,
                  ),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: CustomAppColor.of(context).txtWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  bool isWeekSelected = true;
  int tabIndex = 0;

  final List<String> tabs = ['Distance', 'Duration', 'Kcal'];
  final Map<String, List<double>> chartData = {
    'Distance': [3, 7, 4, 0, 0, 0, 0],
    'Duration': [1, 4, 2, 0, 0, 0, 0],
    'Kcal': [3, 5, 6, 0, 0, 0, 0],
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtStatistics,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10.setHeight),
          _buildToggleSwitch(),
          SizedBox(height: 20.setHeight),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.navigate_before,
                  color: CustomAppColor.of(context).primary,
                ),
                CommonText(
                  text: 'June 5 - June 11',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).primary,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.navigate_next,
                  color: CustomAppColor.of(context).primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.setHeight),
          SizedBox(height: 250.setHeight, child: _buildBarChart()),
          SizedBox(height: 16.setHeight),
          buildMetricsToggle(context),
        ],
      ),
    );
  }

  Widget buildMetricsToggle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).greyShadow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabs.length, (index) {
          final isSelected = tabIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => tabIndex = index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? CustomAppColor.of(context).lime
                      : CustomAppColor.of(context).toggleBg,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? CustomAppColor.of(context).lime
                        : CustomAppColor.of(context).transparent,
                  ),
                ),
                child: Center(
                  child: CommonText(
                    text: tabs[index],
                    fontWeight: FontWeight.w600,
                    textColor: isSelected
                        ? CustomAppColor.of(context).black
                        : CustomAppColor.of(context).txtDarkGrey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      height: 40.setHeight,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).greyShadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _toggleButton(Languages.of(context).txtWeek, isWeekSelected),
          _toggleButton(Languages.of(context).txtMonth, !isWeekSelected),
        ],
      ),
    );
  }

  Widget _toggleButton(String label, bool selected) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => isWeekSelected = label == 'Week'),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? Color(0xFFD8F366)
                : CustomAppColor.of(context).toggleBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: CommonText(
              text: label,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              textColor: selected ? Colors.black : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    final currentTab = tabs[tabIndex];
    final currentData = chartData[currentTab]!;

    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 25),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: _bottomTitles,
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: CustomAppColor.of(context).txtDarkGrey,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        barGroups: List.generate(
          currentData.length,
          (i) => _barGroup(i, currentData[i]),
        ),
      ),
    );
  }

  BarChartGroupData _barGroup(int x, double y) {
    const double maxY = 10;

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: maxY,
          width: 25.setWidth,
          rodStackItems: [
            BarChartRodStackItem(0, y, CustomAppColor.of(context).lime),
            BarChartRodStackItem(y, maxY, CustomAppColor.of(context).toggleBg),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
      ],
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final dayIndex = value.toInt();

    final currentTab = tabs[tabIndex];
    final currentData = chartData[currentTab]!;

    final dayHasData =
        dayIndex < currentData.length && currentData[dayIndex] > 0;

    return SideTitleWidget(
      space: 6,
      meta: meta,
      child: CommonText(
        text: days[dayIndex % days.length],
        fontSize: 12.setFontSize,
        fontWeight: FontWeight.w500,
        textColor: dayHasData
            ? CustomAppColor.of(context).txtPrimary
            : CustomAppColor.of(context).txtDarkGrey,
      ),
    );
  }
}
