import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:step_counter_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/sleep_report/pages/sleep_result_screen.dart';
import 'package:step_counter_screens_app_package/ui/step_report/datamodel/step_report_data.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class WeekChartData {
  WeekChartData(this.dayLabel, this.x, this.y);
  final String dayLabel;
  final double x;
  final double y;
}

class SleepReportScreen extends StatefulWidget {
  final String periodName;
  final bool isForEmptyView;
  const SleepReportScreen({super.key, this.periodName = "Week", this.isForEmptyView = false});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SleepReportScreen());
  }

  @override
  State<SleepReportScreen> createState() => _SleepReportScreenState();
}

class _SleepReportScreenState extends State<SleepReportScreen> implements TopBarClickListener {
  final ValueNotifier<String> periodName = ValueNotifier<String>("Week");

  // Sample data for week chart - representing hourly distance counts
  final List<WeekChartData> weekChartData = [
    WeekChartData("Mon", 0, 11),
    WeekChartData("Tue", 1, 7.3),
    WeekChartData("Wed", 2, 12),
    WeekChartData("Thu", 3, 9),
    WeekChartData("Fri", 4, 1.9),
    WeekChartData("Sat", 5, 10.5),
    WeekChartData("Sun", 6, 3),
  ];
  final List<WeekHistory> weekHistoryList = [
    WeekHistory(date: "Sunday, June 19", steps: 07),
    WeekHistory(date: "Saturday, June 18", steps: 05),
    WeekHistory(date: "Friday, June 17", steps: 06),
    WeekHistory(date: "Thursday, June 16", steps: 01),
    WeekHistory(date: "Wednesday, June 15", steps: 11),
    WeekHistory(date: "Tuesday, June 14", steps: 06),
    WeekHistory(date: "Monday, June 13", steps: 03),
  ];
  final List<MonthHistory> monthHistoryList = [
    MonthHistory(weekRange: "Sep 26 - Oct 02", steps: 50),
    MonthHistory(weekRange: "Sep 19 - Sep 25", steps: 70),
    MonthHistory(weekRange: "Sep 12 - Sep 18", steps: 90),
    MonthHistory(weekRange: "Sep 05 - Sep 11", steps: 110),
    MonthHistory(weekRange: "Aug 29 - Sep 04", steps: 130),
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
                          if (value == "Week") ...[
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
                          if (value == "Week") ...[
                            widget.isForEmptyView ? _emptyDataView() : _weekHistoryListView(),
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
              color: CustomAppColor.of(context).bgContainerColorSleep,
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(
                color: CustomAppColor.of(context).bgContainerBorderColorSleep,
                width: 0.2,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      periodName.value = "Week";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: value == "Week" ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: value == "Week" ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtWeek,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: value == "Week" ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorTimes,
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
                        color: value == "Month" ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: value == "Month" ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: Languages.of(context).txtMonth,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: value == "Month" ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorTimes,
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
                        text: 'This Week',
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
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
                majorTickLines: MajorTickLines(size: 10.setHeight, color: CustomAppColor.of(context).borderColor),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtDarkGray,
                  fontSize: 11.setFontSize,
                  fontWeight: FontWeight.w400,
                ),
                axisLabelFormatter: (AxisLabelRenderDetails details) {
                  final dayLabels = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Sun'];
                  int index = details.value.toInt();
                  if (index >= 0 && index < dayLabels.length) {
                    return ChartAxisLabel("${dayLabels[index]}\n$index/08", details.textStyle);
                  }
                  return ChartAxisLabel(details.text, details.textStyle);
                },
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 12,
                interval: 2,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  dashArray: const [6, 6],
                  color: CustomAppColor.of(context).borderColor,
                ),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontSize: 11.setFontSize,
                  fontWeight: FontWeight.w600,
                ),
                labelFormat: '{value}h',
                numberFormat: NumberFormat.compact(),
              ),
              series: <CartesianSeries<WeekChartData, double>>[
                ColumnSeries<WeekChartData, double>(
                  dataSource: weekChartData,
                  xValueMapper: (WeekChartData data, _) => data.x,
                  yValueMapper: (WeekChartData data, _) => data.y,
                  gradient: LinearGradient(
                    colors: [
                      CustomAppColor.of(context).colorTimes,
                      CustomAppColor.of(context).colorTimes.withValues(alpha: 0.0),
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
        border: Border.all(
          color: CustomAppColor.of(context).bgContainerColorSleep,
          width: 1.5,
        ),
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
                Navigator.push(context, SleepResultScreen.route());
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: "${item.steps}h 00m",
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
                      color: CustomAppColor.of(context).bgContainerColorSleep,
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
      package: 'step_counter_screens_app_package',
    );

    BoxDecoration defaultDecoration = BoxDecoration(
      color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
      border: Border.all(color: CustomAppColor.of(context).bgContainerBlackAndSleepColor, width: 3),
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
                          text: '6,166 Km',
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
                    package: 'step_counter_screens_app_package',
                    fontFamily: Constant.fontFamily,
                    color: CustomAppColor.of(context).colorDisabledDays,
                  ),
                  outsideTextStyle: defaultTextStyle.copyWith(
                    package: 'step_counter_app_package',
                    fontFamily: Constant.fontFamily,
                    color: CustomAppColor.of(context).colorDisabledDays,
                  ),
                  withinRangeTextStyle: defaultTextStyle,
                  weekendTextStyle: defaultTextStyle,
                  rangeStartTextStyle: defaultTextStyle,
                  rangeEndTextStyle: defaultTextStyle,
                  selectedTextStyle: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamily,
                    package: 'step_counter_app_package',
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
                    fontFamily: Constant.fontFamily,
                    fontWeight: FontWeight.w400,
                    color: CustomAppColor.of(context).colorDisabledDays,
                    package: 'step_counter_app_package',
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 13.setFontSize,
                    fontFamily: Constant.fontFamily,
                    fontWeight: FontWeight.w400,
                    color: CustomAppColor.of(context).colorDisabledDays,
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
      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = monthHistoryList[index];

        return IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.push(context, SleepResultScreen.route());
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
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 8.setHeight),
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
                            text: "${item.steps}h 50m",
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
          AppAssets.imgEmptyDistanceHistory,
          height: 150.setHeight,
          width: 150.setWidth,
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSorryNoDataFound,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).colorTimes,
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
