import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

// Chart data model
class ChartData {
  final String period;
  final double minValue;
  final double yogaValue;
  final double kcalValue;

  ChartData(this.period, this.minValue, this.yogaValue, this.kcalValue);
}

// Weight data model
class WeightData {
  final String period;
  final double weight;

  WeightData(this.period, this.weight);
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  ValueNotifier<String> selectedPeriod = ValueNotifier("Year");
  ValueNotifier<String> selectedWeightPeriod = ValueNotifier("Month");

  Map<String, List<ChartData>> chartDataMap = {
    "Day": [
      ChartData("6 AM", 60, 100, 80),
      ChartData("9 AM", 80, 60, 100),
      ChartData("12 PM", 40, 80, 60),
      ChartData("3 PM", 40, 60, 40),
      ChartData("6 PM", 60, 100, 80),
      ChartData("9 PM", 80, 60, 100),
    ],
    "Week": [
      ChartData("Mon", 60, 100, 80),
      ChartData("Tue", 80, 60, 100),
      ChartData("Wed", 40, 80, 60),
      ChartData("Thu", 40, 60, 40),
      ChartData("Fri", 60, 100, 80),
      ChartData("Sat", 80, 60, 100),
      ChartData("Sun", 40, 80, 60),
    ],
    "Month": [
      ChartData("W1", 60, 100, 80),
      ChartData("W2", 80, 60, 100),
      ChartData("W3", 40, 80, 60),
      ChartData("W4", 40, 60, 40),
    ],
    "Year": [
      ChartData("Ja", 60, 100, 80),
      ChartData("Fe", 80, 60, 100),
      ChartData("Ma", 40, 80, 60),
      ChartData("Ap", 40, 60, 40),
      ChartData("My", 60, 100, 80),
      ChartData("Ju", 80, 60, 100),
      ChartData("Ju", 40, 80, 60),
      ChartData("Au", 40, 60, 40),
      ChartData("Se", 60, 100, 80),
      ChartData("Oc", 80, 60, 100),
      ChartData("No", 40, 80, 60),
      ChartData("De", 40, 60, 40),
    ],
  };

  Map<String, List<WeightData>> weightDataMap = {
    "Day": [
      WeightData("6 AM", 70.2),
      WeightData("9 AM", 70.0),
      WeightData("12 PM", 69.8),
      WeightData("3 PM", 69.9),
      WeightData("6 PM", 70.1),
      WeightData("9 PM", 70.3),
    ],
    "Week": [
      WeightData("Mon", 70.5),
      WeightData("Tue", 70.2),
      WeightData("Wed", 69.8),
      WeightData("Thu", 69.5),
      WeightData("Fri", 69.3),
      WeightData("Sat", 69.1),
      WeightData("Sun", 69.0),
    ],
    "Month": [
      WeightData("W1", 71.0),
      WeightData("W2", 70.5),
      WeightData("W3", 70.0),
      WeightData("W4", 69.5),
    ],
    "Year": [
      WeightData("Ja", 75.0),
      WeightData("Fe", 74.5),
      WeightData("Ma", 74.0),
      WeightData("Ap", 73.2),
      WeightData("My", 72.5),
      WeightData("Ju", 70.0),
      WeightData("Jl", 69.5),
      WeightData("Au", 69.8),
      WeightData("Se", 70.2),
      WeightData("Oc", 70.5),
      WeightData("No", 70.8),
      WeightData("De", 71.0),
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _overallReportView(),
                _statisticsView(),
                _weightView(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _topBarView() {
    return Container(
      padding: EdgeInsets.only(
        left: 15.setWidth,
        right: 15.setWidth,
        top: 10.setHeight,
      ),
      child: CommonText(
        text: Languages.of(context).txtAnalysis,
        fontSize: 18.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        textColor: CustomAppColor.of(context).txtBlack,
        height: 1,
      ),
    );
  }

  _overallReportView() {
    return Container(
      padding: EdgeInsets.only(top: 20.setHeight, bottom: 10.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtOverallReport,
            textAlign: TextAlign.start,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icClockRound,
                        width: 35.setHeight,
                        height: 35.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtTotalTime,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "1550",
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icMeditationRound,
                        width: 35.setHeight,
                        height: 35.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtTotalYoga,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "148",
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icKcalBurnedRound,
                        width: 35.setHeight,
                        height: 35.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtKcalBurned,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "14,000",
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _statisticsView() {
    return Container(
      padding: EdgeInsets.only(top: 15.setHeight, bottom: 20.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonText(
                text: Languages.of(context).txtStatistics,
                textAlign: TextAlign.start,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w700,
                fontFamily: Constant.fontFamilyBold700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).dividerColor,
                  thickness: 1,
                  indent: 10.setWidth,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              _periodButton(Languages.of(context).txtDay, "Day"),
              SizedBox(width: 10.setWidth),
              _periodButton(Languages.of(context).txtWeek, "Week"),
              SizedBox(width: 10.setWidth),
              _periodButton(Languages.of(context).txtMonth, "Month"),
              SizedBox(width: 10.setWidth),
              _periodButton(Languages.of(context).txtYear, "Year"),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _legendItem(CustomAppColor.of(context).minColor, Languages.of(context).txtMin),
              SizedBox(width: 20.setWidth),
              _legendItem(CustomAppColor.of(context).yogaColor, Languages.of(context).txtYoga),
              SizedBox(width: 20.setWidth),
              _legendItem(CustomAppColor.of(context).kcalColor, Languages.of(context).txtKcal),
            ],
          ),
          SizedBox(height: 15.setHeight),
          ValueListenableBuilder(
            valueListenable: selectedPeriod,
            builder: (context, value, child) {
              List<ChartData> currentData = chartDataMap[selectedPeriod.value] ?? [];

              return SizedBox(
                height: 250.setHeight,
                width: 0.screenWidth,
                child: SfCartesianChart(
                  backgroundColor: CustomAppColor.of(context).bgScreen,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    majorGridLines: const MajorGridLines(width: 0),
                    labelStyle: TextStyle(
                      color: CustomAppColor.of(context).txtBlack,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constant.fontFamilyMedium500,
                    ),
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: false,
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  series: <CartesianSeries>[
                    // Min series
                    ColumnSeries<ChartData, String>(
                      dataSource: currentData,
                      xValueMapper: (ChartData data, _) => data.period,
                      yValueMapper: (ChartData data, _) => data.minValue,
                      color: CustomAppColor.of(context).minColor,
                      borderRadius: BorderRadius.zero,
                      width: 0.4,
                      spacing: 0,
                    ),
                    // Yoga series
                    ColumnSeries<ChartData, String>(
                      dataSource: currentData,
                      xValueMapper: (ChartData data, _) => data.period,
                      yValueMapper: (ChartData data, _) => data.yogaValue,
                      color: CustomAppColor.of(context).yogaColor,
                      borderRadius: BorderRadius.zero,
                      width: 0.4,
                      spacing: 0,
                    ),
                    // Kcal series
                    ColumnSeries<ChartData, String>(
                      dataSource: currentData,
                      xValueMapper: (ChartData data, _) => data.period,
                      yValueMapper: (ChartData data, _) => data.kcalValue,
                      color: CustomAppColor.of(context).kcalColor,
                      borderRadius: BorderRadius.zero,
                      width: 0.4,
                      spacing: 0,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          _circularProgressView(),
        ],
      ),
    );
  }

  Widget _circularProgressView() {
    return ValueListenableBuilder(
      valueListenable: selectedPeriod,
      builder: (context, value, child) {
        List<ChartData> currentData = chartDataMap[selectedPeriod.value] ?? [];

        double totalMin = currentData.fold(0, (sum, data) => sum + data.minValue);
        double totalYoga = currentData.fold(0, (sum, data) => sum + data.yogaValue);
        double totalKcal = currentData.fold(0, (sum, data) => sum + data.kcalValue);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _circularProgressItem(
              value: totalMin,
              maxValue: 600,
              color: CustomAppColor.of(context).minColor,
              label: Languages.of(context).txtMin,
              valueText: "${totalMin.toInt()} ${Languages.of(context).txtMin}",
              icon: AppAssets.icClock,
            ),
            _circularProgressItem(
              value: totalYoga,
              maxValue: 100,
              color: CustomAppColor.of(context).yogaColor,
              label: Languages.of(context).txtYoga,
              valueText: "${totalYoga.toInt()} ${Languages.of(context).txtYoga}",
              icon: AppAssets.icMeditation,
            ),
            _circularProgressItem(
              value: totalKcal,
              maxValue: 10000,
              color: CustomAppColor.of(context).kcalColor,
              label: Languages.of(context).txtKcal,
              valueText: "${totalKcal.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ${Languages.of(context).txtKcal}",
              icon: AppAssets.icKcalBurned,
            ),
          ],
        );
      },
    );
  }

  Widget _circularProgressItem({
    required double value,
    required double maxValue,
    required Color color,
    required String label,
    required String valueText,
    required String icon,
  }) {
    double percentage = (value / maxValue * 100).clamp(0, 100);

    return Expanded(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100.setHeight,
                height: 100.setHeight,
                child: SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: [
                        ChartData("Progress", percentage, 0, 0),
                        ChartData("Remaining", 100 - percentage, 0, 0),
                      ],
                      xValueMapper: (ChartData data, _) => data.period,
                      yValueMapper: (ChartData data, _) => data.minValue,
                      pointColorMapper: (ChartData data, index) {
                        return index == 0 ? color : CustomAppColor.of(context).disabledProgressColor;
                      },
                      innerRadius: '85%',
                      radius: '100%',
                      cornerStyle: CornerStyle.bothCurve,
                      enableTooltip: false,
                      animationDuration: 1000,
                    ),
                  ],
                  margin: EdgeInsets.zero,
                  backgroundColor: CustomAppColor.of(context).bgScreen,
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    icon,
                    width: 20.setHeight,
                    height: 20.setHeight,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: label,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constant.fontFamilyMedium500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: valueText,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamilyMedium500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _periodButton(String title, String period) {
    return ValueListenableBuilder(
      valueListenable: selectedPeriod,
      builder: (context, value, child) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              selectedPeriod.value = period;
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.setHeight),
              decoration: BoxDecoration(
                color: value == period ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: value == period ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                  width: value == period ? 2 : 1,
                ),
              ),
              child: CommonText(
                text: title,
                textAlign: TextAlign.center,
                fontSize: value == period ? 14.setFontSize : 12.setFontSize,
                fontWeight: value == period ? FontWeight.w600 : FontWeight.w500,
                fontFamily: value == period ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
                textColor: value == period ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10.setHeight,
          height: 10.setHeight,
          decoration: BoxDecoration(color: color),
        ),
        SizedBox(width: 5.setWidth),
        CommonText(
          text: label,
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w500,
          fontFamily: Constant.fontFamilyMedium500,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
      ],
    );
  }

  _weightView() {
    return Container(
      padding: EdgeInsets.only(top: 10.setHeight, bottom: 20.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonText(
                text: Languages.of(context).txtWeight,
                textAlign: TextAlign.start,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w700,
                fontFamily: Constant.fontFamilyBold700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).dividerColor,
                  thickness: 1,
                  indent: 10.setWidth,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              _weightPeriodButton(Languages.of(context).txtDay, "Day"),
              SizedBox(width: 10.setWidth),
              _weightPeriodButton(Languages.of(context).txtWeek, "Week"),
              SizedBox(width: 10.setWidth),
              _weightPeriodButton(Languages.of(context).txtMonth, "Month"),
              SizedBox(width: 10.setWidth),
              _weightPeriodButton(Languages.of(context).txtYear, "Year"),
            ],
          ),
          SizedBox(height: 20.setHeight),
          ValueListenableBuilder(
            valueListenable: selectedWeightPeriod,
            builder: (context, value, child) {
              List<WeightData> currentWeightData = weightDataMap[selectedWeightPeriod.value] ?? [];

              return SizedBox(
                height: 200.setHeight,
                width: 0.screenWidth,
                child: SfCartesianChart(
                  backgroundColor: CustomAppColor.of(context).bgScreen,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    majorGridLines: const MajorGridLines(width: 0),
                    labelStyle: TextStyle(
                      color: CustomAppColor.of(context).txtBlack,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constant.fontFamilyMedium500,
                    ),
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: false,
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0),
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    shouldAlwaysShow: true,
                    color: CustomAppColor.of(context).tooltipColor,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 5.setHeight),
                        child: CommonText(
                          text: '${(data as WeightData).weight} ${Languages.of(context).txtKg}',
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: Constant.fontFamilyBold700,
                          textColor: CustomAppColor.of(context).txtWhite,
                        ),
                      );
                    },
                  ),
                  series: <CartesianSeries>[
                    // Area series
                    AreaSeries<WeightData, String>(
                      dataSource: currentWeightData,
                      xValueMapper: (WeightData data, _) => data.period,
                      yValueMapper: (WeightData data, _) => data.weight,
                      color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                      borderColor: CustomAppColor.of(context).primary,
                      borderWidth: 2,
                      animationDuration: 1000,
                    ),
                    // Line series with markers
                    LineSeries<WeightData, String>(
                      dataSource: currentWeightData,
                      xValueMapper: (WeightData data, _) => data.period,
                      yValueMapper: (WeightData data, _) => data.weight,
                      color: CustomAppColor.of(context).primary,
                      width: 2,
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        shape: DataMarkerType.circle,
                        width: 6.setHeight,
                        height: 6.setHeight,
                        color: CustomAppColor.of(context).white,
                        borderColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                        borderWidth: 1,
                      ),
                      animationDuration: 1000,
                    ),
                    // Highlighted current point
                    LineSeries<WeightData, String>(
                      // dataSource: [currentWeightData.last],
                      xValueMapper: (WeightData data, _) => data.period,
                      yValueMapper: (WeightData data, _) => data.weight,
                      color: CustomAppColor.of(context).bgScreen,
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        shape: DataMarkerType.circle,
                        width: 6.setHeight,
                        height: 6.setHeight,
                        color: CustomAppColor.of(context).white,
                        borderColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                        borderWidth: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _weightPeriodButton(String title, String period) {
    return ValueListenableBuilder(
      valueListenable: selectedWeightPeriod,
      builder: (context, value, child) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              selectedWeightPeriod.value = period;
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.setHeight),
              decoration: BoxDecoration(
                color: value == period ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: value == period ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                  width: value == period ? 2 : 1,
                ),
              ),
              child: CommonText(
                text: title,
                textAlign: TextAlign.center,
                fontSize: value == period ? 14.setFontSize : 12.setFontSize,
                fontWeight: value == period ? FontWeight.w600 : FontWeight.w500,
                fontFamily: value == period ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
                textColor: value == period ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
              ),
            ),
          ),
        );
      },
    );
  }
}
