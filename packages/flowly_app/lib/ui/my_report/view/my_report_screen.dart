import 'dart:math';

import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/cycle_history/view/cycle_history_screen.dart';
import 'package:flowly_app/ui/edit_period_date/view/edit_period_date_screen.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/app_assets.dart';

class WeightData {
  final String day;
  final double value;
  WeightData(this.day, this.value);
}

class MyReportScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyReportScreen());
  }

  const MyReportScreen({super.key});

  @override
  State<MyReportScreen> createState() => _MyReportScreenState();
}

class _MyReportScreenState extends State<MyReportScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyReport,
            isShowBack: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.setHeight),
                    myCycleView(),
                    SizedBox(height: 20.setHeight),
                    cycleHistoryView(),
                    SizedBox(height: 20.setHeight),
                    weightView(),
                    SizedBox(height: 100.setHeight),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myCycleView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtMyCycles,
            fontFamily: Constant.fontFamilyMulishBold700,
            fontSize: 16.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 15.setHeight),
          const Center(
            child: CycleRingWidget(),
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).textFormFieldBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "5 Days",
                        fontFamily: Constant.fontFamilyMulishBold700,
                        fontSize: 18.setFontSize,
                      ),
                      SizedBox(height: 4.setHeight),
                      CommonText(
                        text: Languages.of(context).txtAveragePeriod,
                        fontSize: 12.setFontSize,
                      ),
                      SizedBox(height: 10.setHeight),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          AppAssets.icWaterDropPrimary,
                          height: 26.setWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).textFormFieldBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "28 Days",
                        fontFamily: Constant.fontFamilyMulishBold700,
                        fontSize: 18.setFontSize,
                      ),
                      SizedBox(height: 4.setHeight),
                      CommonText(
                        text: Languages.of(context).txtAverageCycle,
                        fontSize: 12.setFontSize,
                      ),
                      SizedBox(height: 10.setHeight),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.autorenew_rounded,
                          color: Color(0xFFF3D71A),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(
            text: Languages.of(context).txtAddPeriod,
            onTap: () => Navigator.push(context, EditPeriodDateScreen.route()),
          )
        ],
      ),
    );
  }

  Widget cycleHistoryView() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtCycleHistory,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              legendDot(color: Colors.pinkAccent, text: Languages.of(context).txtPeriod),
              SizedBox(width: 16.setWidth),
              legendDot(color: Colors.amber, text: Languages.of(context).txtFertileWindow),
              SizedBox(width: 16.setWidth),
              legendDot(color: Colors.green, text: Languages.of(context).txtOvulation),
            ],
          ),
          SizedBox(height: 15.setHeight),
          buildCycleItem(
            date: "Aug 15 - Now",
            periodDays: 2,
            cycleDays: 2,
            fertileStartPercent: 0.70,
            fertileEndPercent: 0.90,
            ovulationPercent: 0.4,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "Jul 12 - Jul 15",
            periodDays: 4,
            cycleDays: 28,
            fertileStartPercent: 0.30,
            fertileEndPercent: 0.62,
            ovulationPercent: 0.60,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "Jun 10 - Jun 15",
            periodDays: 5,
            cycleDays: 30,
            fertileStartPercent: 0.35,
            fertileEndPercent: 0.65,
            ovulationPercent: 0.60,
          ),
          const SizedBox(height: 12),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.push(context, CycleHistoryScreen.route()),
              child: CommonText(
                text: "${Languages.of(context).txtViewAll} →",
                fontSize: 16,
                textColor: Colors.pinkAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget legendDot({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.setWidth),
        CommonText(
          text: text,
        ),
      ],
    );
  }

  Widget buildCycleItem({
    required String date,
    required int periodDays,
    required int cycleDays,
    required double fertileStartPercent,
    required double fertileEndPercent,
    required double ovulationPercent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: date,
            fontSize: 13.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.water_drop,
                    color: periodDays > i ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                    size: 22,
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double totalWidth = constraints.maxWidth;

                    const int totalDays = 31;

                    int gapDays = 10;
                    int fertileStartDay = periodDays + gapDays;
                    int fertileEndDay = fertileStartDay + 8;
                    int ovulationDay = fertileStartDay + 3;

                    double fertileStartPercent = fertileStartDay / totalDays;
                    double fertileEndPercent = fertileEndDay / totalDays;
                    double ovulationPercent = ovulationDay / totalDays;

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          children: List.generate(
                            totalDays,
                            (i) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.setWidth),
                                child: Container(
                                  height: 10,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: fertileStartPercent * totalWidth,
                          width: (fertileEndPercent - fertileStartPercent) * totalWidth,
                          child: Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: ovulationPercent * totalWidth - 10,
                          top: -2.setHeight,
                          child: Container(
                            height: 12.setHeight,
                            width: 12.setWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green, width: 1),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "$periodDays days - period, $cycleDays days - cycle",
            fontSize: 13.setFontSize,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }

  Widget weightView() {
    List<WeightData> chartData = [
      WeightData("10", 40),
      WeightData("11", 50),
      WeightData("12", 55),
      WeightData("13", 60),
      WeightData("14", 63),
      WeightData("15", 45),
      WeightData("16", 38),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.08),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Weight(kg)",
            fontFamily: Constant.fontFamilyMulishBold700,
            fontSize: 16.setFontSize,
          ),
          SizedBox(height: 12.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Aug 10 - Aug 16, 2025",
                fontSize: 15.setFontSize,
                fontFamily: Constant.fontFamilyMulishSemiBold600,
              ),
              const Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 20),
                  Icon(Icons.arrow_forward_ios, size: 20),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          SizedBox(
            height: 260,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                interval: 20,
                minimum: 0,
                maximum: 80,
                majorGridLines: MajorGridLines(
                  width: 1,
                  dashArray: <double>[4, 4],
                ),
                majorTickLines: MajorTickLines(width: 0),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                color: Colors.transparent,
                builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 4.setHeight),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade50,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: CommonText(
                      text: "${point.y} kg",
                      fontSize: 10.setFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              series: <CartesianSeries<WeightData, String>>[
                ColumnSeries<WeightData, String>(
                  dataSource: chartData,
                  xValueMapper: (WeightData data, _) => data.day,
                  yValueMapper: (WeightData data, _) => data.value,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  pointColorMapper: (WeightData data, index) {
                    return data.day == "14" ? Colors.deepPurple : Colors.deepPurple.withValues(alpha: 0.25);
                  },
                  width: 0.8,
                  spacing: 0.1,
                )
              ],
              plotAreaBorderWidth: 0,
              plotAreaBorderColor: Colors.transparent,
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

  Offset getOffsetOnCircle({required double radius, required double angleDegree}) {
    final rad = angleDegree * 3.141592 / 180;

    final dx = radius * cos(rad);
    final dy = radius * sin(rad);

    return Offset(dx, dy);
  }
}

class CycleRingWidget extends StatelessWidget {
  const CycleRingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.setHeight,
      width: 200.setWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(180, 180),
            painter: CycleRingPainter(),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).btnGrey,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AppAssets.icWaterDropPrimary,
              width: 90.setWidth,
              height: 90.setHeight,
            ),
          ),
          Transform.translate(
            offset: getOffsetOnCircle(
              radius: 90,
              angleDegree: 220,
            ),
            child: pointer(color: Colors.green),
          ),
          Transform.translate(
            offset: getOffsetOnCircle(
              radius: 90,
              angleDegree: 110,
            ),
            child: pointer(color: CustomAppColor.of(context).primary),
          ),
        ],
      ),
    );
  }

  Widget pointer({required Color color}) {
    return Container(
      height: 16.setHeight,
      width: 16.setWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: color, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        margin: const EdgeInsets.all(1),
      ),
    );
  }

  Offset getOffsetOnCircle({
    required double radius,
    required double angleDegree,
  }) {
    final rad = angleDegree * pi / 180;
    return Offset(radius * cos(rad), radius * sin(rad));
  }
}

class CycleRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double stroke = 8;

    final rect = Offset.zero & size;

    Paint bgCircle = Paint()
      ..color = const Color(0xFFF5F5F5)
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint pinkPaint = Paint()
      ..color = const Color(0xFFFD8599)
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint yellowPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * 3.14, false, bgCircle);

    canvas.drawArc(rect, -0.5, 2.4, false, pinkPaint);

    canvas.drawArc(rect, 3.14 / 1.2, 1.8, false, yellowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
