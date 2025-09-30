import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:step_counter_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/calories_report/pages/calories_result_screen.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../step_report/datamodel/step_report_data.dart';
import '../pages/calories_all_records_screen.dart';

class DayChartData {
  DayChartData(this.x, this.y);

  final double x;
  final double y;
}

class WeekChartData {
  WeekChartData(this.dayLabel, this.x, this.y);

  final String dayLabel;
  final double x;
  final double y;
}

class CaloriesReportScreen extends StatefulWidget {
  final String periodName;
  final bool isForEmptyView;
  const CaloriesReportScreen({super.key, this.periodName = "Day", this.isForEmptyView = false});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const CaloriesReportScreen());
  }

  @override
  State<CaloriesReportScreen> createState() => _CaloriesReportScreenState();
}

class _CaloriesReportScreenState extends State<CaloriesReportScreen> implements TopBarClickListener {
  final ValueNotifier<String> periodName = ValueNotifier<String>("Day");

  // Sample data for day chart - representing hourly Calories counts
  final List<DayChartData> dayChartData = [
    DayChartData(0, 1500),
    DayChartData(4, 3500),
    DayChartData(8, 5800),
    DayChartData(12, 10000),
    DayChartData(16, 7000),
    DayChartData(20, 1500),
    DayChartData(24, 8500),
  ];

  // Sample data for week chart - representing hourly Calories counts
  final List<WeekChartData> weekChartData = [
    WeekChartData("Mon", 0, 1500),
    WeekChartData("Tue", 1, 3500),
    WeekChartData("Wed", 2, 5800),
    WeekChartData("Thu", 3, 10000),
    WeekChartData("Fri", 4, 7000),
    WeekChartData("Sat", 5, 1500),
    WeekChartData("Sun", 6, 8500),
  ];
  final List<StepHistory> dayHistoryList = [
    StepHistory(
      title: "Morning",
      duration: "8h 05m 15s",
      timeRange: "04:00 AM To 10:00 PM",
      steps: 450,
    ),
    StepHistory(
      title: "Afternoon",
      duration: "1h 45m 40s",
      timeRange: "10:04 PM To 04:00 AM",
      steps: 480,
    ),
    StepHistory(
      title: "Evening",
      duration: "5h 15m 15s",
      timeRange: "04:00 AM To 10:00 PM",
      steps: 250,
    ),
    StepHistory(
      title: "Late Night",
      duration: "5h 15m 15s",
      timeRange: "10:04 PM To 04:00 AM",
      steps: 350,
    ),
  ];
  final List<WeekHistory> weekHistoryList = [
    WeekHistory(date: "Sunday, June 19", steps: 1569),
    WeekHistory(date: "Saturday, June 18", steps: 2000),
    WeekHistory(date: "Friday, June 17", steps: 1800),
    WeekHistory(date: "Thursday, June 16", steps: 2200),
    WeekHistory(date: "Wednesday, June 15", steps: 1750),
    WeekHistory(date: "Tuesday, June 14", steps: 1950),
    WeekHistory(date: "Monday, June 13", steps: 2100),
  ];
  final List<MonthHistory> monthHistoryList = [
    MonthHistory(weekRange: "Sep 26 - Oct 02", steps: 5000),
    MonthHistory(weekRange: "Sep 19 - Sep 25", steps: 7000),
    MonthHistory(weekRange: "Sep 12 - Sep 18", steps: 9000),
    MonthHistory(weekRange: "Sep 05 - Sep 11", steps: 11000),
    MonthHistory(weekRange: "Aug 29 - Sep 04", steps: 13000),
  ];
  final ValueNotifier<DateTime> selectedDate = ValueNotifier(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    periodName.value = widget.periodName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtReport,
            textAlign: Alignment.centerLeft,
          ),
          _topBarView(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(bottom: 0.bottomPadding, top: 20.setHeight),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: periodName,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          if (value == "Day") ...[
                            _dayChartView(),
                          ] else if (value == "Week") ...[
                            _weekChartView(),
                          ] else if (value == "Month") ...[
                            _monthChartView(),
                          ],
                        ],
                      );
                    },
                  ),
                  Divider(
                    height: 40.setHeight,
                    color: CustomAppColor.of(context).borderColor,
                    thickness: 0.5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: periodName,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          if (value == "Day") ...[
                            widget.isForEmptyView ? _emptyDataView() : _dayHistoryListView(),
                          ] else if (value == "Week") ...[
                            // _emptyDataView(),
                            _weekHistoryListView(),
                          ] else if (value == "Month") ...[
                            // _emptyDataView(),
                            _monthHistoryListView(),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _topBarView() {
    return ValueListenableBuilder(
      valueListenable: periodName,
      builder: (context, value, child) {
        return IgnorePointer(
          ignoring: true,
          child: Container(
            height: 44.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgContainerColorCalories,
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(
                color: CustomAppColor.of(context).bgContainerBorderColorCalories,
                width: 0.2,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      periodName.value = "Day";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: value == "Day" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: value == "Day" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtDay,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: value == "Day" ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorCalories,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      periodName.value = "Week";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: value == "Week" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: value == "Week" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtWeek,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: value == "Week" ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorCalories,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      periodName.value = "Month";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: value == "Month" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: value == "Month" ? CustomAppColor.of(context).colorCalories : CustomAppColor.of(context).transparent),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtMonth,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: value == "Month" ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorCalories,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _dayChartView() {
    return Container(
      margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 0.setHeight),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30.setHeight, left: 5.setWidth, right: 5.setWidth),
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    AppAssets.icArrowRight,
                    width: 20.setHeight,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Expanded(
                  child: CommonText(
                    text: 'Wednesday, April 6',
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Image.asset(
                  AppAssets.icArrowRight,
                  width: 20.setHeight,
                  height: 20.setHeight,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250.setHeight,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              backgroundColor: CustomAppColor.of(context).transparent,
              margin: const EdgeInsets.all(0),
              primaryXAxis: NumericAxis(
                minimum: 0,
                maximum: 24.5,
                interval: 4,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0.2),
                majorTickLines: MajorTickLines(size: 5.setHeight, color: CustomAppColor.of(context).borderColor),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 10000,
                interval: 5000,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: CustomAppColor.of(context).borderColor,
                ),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constant.fontFamily,
                  package: 'step_counter_app_package',
                ),
                labelFormat: '{value}',
                numberFormat: NumberFormat.compact(),
              ),
              series: <CartesianSeries<DayChartData, double>>[
                ColumnSeries<DayChartData, double>(
                  dataSource: dayChartData,
                  xValueMapper: (DayChartData data, _) => data.x,
                  yValueMapper: (DayChartData data, _) => data.y,
                  gradient: LinearGradient(
                    colors: [
                      CustomAppColor.of(context).colorCalories,
                      CustomAppColor.of(context).colorCalories.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(0),
                  width: 0.35,
                  spacing: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _dayHistoryListView() {
    return ListView.builder(
      itemCount: dayHistoryList.length + 1,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == dayHistoryList.length) {
          return IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.push(context, CaloriesAllRecordsScreen.route()),
              child: Container(
                margin: EdgeInsets.only(bottom: 12.setHeight),
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: CustomAppColor.of(context).borderColorDark),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtSeeAllRecords,
                        fontSize: 14.setFontSize,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    Image.asset(
                      AppAssets.icArrowRight,
                      width: 22.setWidth,
                      height: 22.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final item = dayHistoryList[index];
        return IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () => Navigator.push(context, CaloriesResultScreen.route()),
            child: Container(
              margin: EdgeInsets.only(bottom: 12.setHeight),
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CustomAppColor.of(context).borderColorDark),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.icCalories, width: 18.setWidth, height: 18.setHeight),
                      SizedBox(width: 3.setWidth),
                      Expanded(
                        child: CommonText(
                          text: item.duration,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: item.title,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 4.setHeight),
                  Row(
                    children: [
                      Expanded(
                        child: CommonText(
                          text: item.timeRange,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                        ),
                      ),
                      CommonText(
                        text: "${item.steps} kcal",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _weekChartView() {
    return Container(
      margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30.setHeight, left: 5.setWidth, right: 5.setWidth),
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    AppAssets.icArrowRight,
                    width: 20.setHeight,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CommonText(
                        text: 'June 13 - 19',
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      CommonText(
                        text: '6,166 Calories',
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppAssets.icArrowRight,
                  width: 20.setHeight,
                  height: 20.setHeight,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250.setHeight,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              backgroundColor: CustomAppColor.of(context).transparent,
              margin: const EdgeInsets.all(0),
              primaryXAxis: NumericAxis(
                minimum: 0,
                maximum: 6,
                interval: 1,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0.5),
                majorTickLines: MajorTickLines(size: 5.setHeight, color: CustomAppColor.of(context).borderColor),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontSize: 11.setFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constant.fontFamily,
                  package: 'step_counter_app_package',
                ),
                axisLabelFormatter: (AxisLabelRenderDetails details) {
                  final dayLabels = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Sun'];
                  int index = details.value.toInt();
                  if (index >= 0 && index < dayLabels.length) {
                    return ChartAxisLabel(dayLabels[index], details.textStyle);
                  }
                  return ChartAxisLabel(details.text, details.textStyle);
                },
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 10000,
                interval: 5000,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: CustomAppColor.of(context).borderColor,
                ),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontSize: 11.setFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constant.fontFamily,
                  package: 'step_counter_app_package',
                ),
                labelFormat: '{value}',
                numberFormat: NumberFormat.compact(),
              ),
              series: <CartesianSeries<WeekChartData, double>>[
                ColumnSeries<WeekChartData, double>(
                  dataSource: weekChartData,
                  xValueMapper: (WeekChartData data, _) => data.x,
                  yValueMapper: (WeekChartData data, _) => data.y,
                  gradient: LinearGradient(
                    colors: [
                      CustomAppColor.of(context).colorCalories,
                      CustomAppColor.of(context).colorCalories.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(0),
                  width: 0.35,
                  spacing: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _weekHistoryListView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: CustomAppColor.of(context).bgContainerColorCalories, width: 1.5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: ListView.builder(
        itemCount: weekHistoryList.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 5.setHeight),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = weekHistoryList[index];

          return IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(context, CaloriesResultScreen.route());
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: "${item.steps} kcal",
                            fontSize: 18.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CommonText(
                          text: item.date,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  if (index != 6) ...[
                    Divider(
                      height: 10.setHeight,
                      thickness: 1.5,
                      color: CustomAppColor.of(context).bgContainerColorCalories,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _monthChartView() {
    TextStyle defaultTextStyle = TextStyle(
      fontSize: 12.setFontSize,
      fontWeight: FontWeight.w500,
      fontFamily: Constant.fontFamily,
      color: CustomAppColor.of(context).txtBlack,
      package: 'step_counter_app_package',
    );

    BoxDecoration defaultDecoration = BoxDecoration(
      color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
      border: Border.all(color: CustomAppColor.of(context).bgContainerBlackAndCaloriesColor, width: 3),
      shape: BoxShape.circle,
    );

    return ValueListenableBuilder(
      valueListenable: selectedDate,
      builder: (context, value, child) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.setHeight, left: 25.setWidth, right: 25.setWidth, top: 10.setHeight),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      AppAssets.icArrowRight,
                      width: 20.setHeight,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CommonText(
                          text: 'Sep 2022',
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        CommonText(
                          text: '6,166 Calories',
                          fontSize: 11.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icArrowRight,
                    width: 20.setHeight,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
              child: TableCalendar(
                firstDay: DateTime.utc(2025, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: selectedDate.value,
                selectedDayPredicate: (day) => isSameDay(day, selectedDate.value),
                onDaySelected: (DateTime date, DateTime focusedDay) {
                  selectedDate.value = date;
                },
                calendarStyle: CalendarStyle(
                  cellMargin: EdgeInsets.all(9.setHeight),
                  cellPadding: EdgeInsets.zero,
                  defaultTextStyle: defaultTextStyle,
                  holidayTextStyle: defaultTextStyle,
                  todayTextStyle: defaultTextStyle,
                  isTodayHighlighted: false,
                  disabledTextStyle: defaultTextStyle.copyWith(
                    color: CustomAppColor.of(context).colorDisabledDays,
                  ),
                  outsideTextStyle: defaultTextStyle.copyWith(
                    color: CustomAppColor.of(context).colorDisabledDays,
                  ),
                  withinRangeTextStyle: defaultTextStyle,
                  weekendTextStyle: defaultTextStyle,
                  rangeStartTextStyle: defaultTextStyle,
                  rangeEndTextStyle: defaultTextStyle,
                  selectedTextStyle: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.setFontSize,
                  ),
                  selectedDecoration: defaultDecoration,
                  defaultDecoration: defaultDecoration,
                  disabledDecoration: defaultDecoration.copyWith(
                    border: Border.all(color: CustomAppColor.of(context).transparent),
                  ),
                  outsideDecoration: defaultDecoration.copyWith(
                    border: Border.all(color: CustomAppColor.of(context).transparent),
                  ),
                  weekendDecoration: defaultDecoration.copyWith(
                    border: Border.all(color: CustomAppColor.of(context).borderColor, width: 3),
                  ),
                  holidayDecoration: defaultDecoration,
                  todayDecoration: defaultDecoration,
                  rangeStartDecoration: defaultDecoration,
                  rangeEndDecoration: defaultDecoration,
                ),
                daysOfWeekHeight: 25.setHeight,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamily,
                    package: 'step_counter_app_package',
                    color: CustomAppColor.of(context).colorDisabledDays,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    color: CustomAppColor.of(context).colorDisabledDays,
                    fontFamily: Constant.fontFamily,
                    package: 'step_counter_app_package',
                  ),
                ),
                headerVisible: false,
                // headerStyle: HeaderStyle(
                //   titleCentered: true,
                //   formatButtonVisible: false,
                //   rightChevronMargin: EdgeInsets.only(right: 5.setWidth),
                //   leftChevronMargin: EdgeInsets.only(left: 5.setWidth),
                //   rightChevronIcon: Image.asset(
                //     AppAssets.icArrowRight,
                //     width: 20.setHeight,
                //     height: 20.setHeight,
                //     color: CustomAppColor.of(context).txtBlack,
                //   ),
                //   leftChevronIcon: RotatedBox(
                //     quarterTurns: 2,
                //     child: Image.asset(
                //       AppAssets.icArrowRight,
                //       width: 20.setHeight,
                //       height: 20.setHeight,
                //       color: CustomAppColor.of(context).txtBlack,
                //     ),
                //   ),
                //   titleTextStyle: TextStyle(
                //     fontSize: 16.setFontSize,
                //     fontWeight: FontWeight.w600,
                //     color: CustomAppColor.of(context).txtBlack,
                //   ),
                // ),
              ),
            ),
          ],
        );
      },
    );
  }

  _monthHistoryListView() {
    return ListView.builder(
      itemCount: monthHistoryList.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = monthHistoryList[index];

        return IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.push(context, CaloriesResultScreen.route());
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CustomAppColor.of(context).borderColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: item.weekRange,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 2.setHeight),
                          CommonText(
                            text: "${item.steps} kcal",
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 70.setWidth,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).black,
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(10)),
                      border: Border.all(color: CustomAppColor.of(context).borderColor),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppAssets.icCalender,
                      width: 28.setWidth,
                      height: 28.setHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ignore: unused_element
  _emptyDataView() {
    return Column(
      children: [
        SizedBox(height: 60.setHeight),
        Image.asset(
          AppAssets.imgEmptyCaloriesHistory,
          height: 150.setHeight,
          width: 150.setWidth,
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSorryNoDataFound,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).colorCalories,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60.setHeight),
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
