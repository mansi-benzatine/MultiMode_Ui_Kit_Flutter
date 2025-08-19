import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/my_earning_data.dart';

class MyEarningScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyEarningScreen());
  }

  const MyEarningScreen({super.key});

  @override
  State<MyEarningScreen> createState() => _MyEarningScreenState();
}

class _MyEarningScreenState extends State<MyEarningScreen> implements TopBarClickListener {
  String selectedRange = 'Week';
  final Map<String, List<double>> chartData = {
    'Week': [120, 200, 150, 80, 70, 110, 140],
    'Month': [800, 950, 720, 660, 880, 990, 1030],
    '6 Month': [4000, 4500, 5000, 4800, 5300, 4900, 5500],
    'Year': [12000, 15000, 13000, 14500, 15500, 16000, 17000],
  };

  final List<TransactionSection> transactionData = [
    TransactionSection(
      title: "Today",
      transactions: [
        TransactionItem(
          name: "Brayden",
          paymentMethod: "Cash Payment",
          amount: "\$25.00",
          distance: "2 km",
          imageUrl: AppAssets.imgDummyProfile,
        ),
        TransactionItem(
          name: "Brayden",
          paymentMethod: "UPI Payment",
          amount: "\$25.00",
          distance: "2 km",
          imageUrl: AppAssets.imgDummyProfile,
        ),
      ],
    ),
    TransactionSection(
      title: "Yesterday",
      transactions: [
        TransactionItem(
          name: "Brayden",
          paymentMethod: "Cash Payment",
          amount: "\$25.00",
          distance: "2 km",
          imageUrl: AppAssets.imgDummyProfile,
        ),
        TransactionItem(
          name: "Brayden",
          paymentMethod: "UPI Payment",
          amount: "\$25.00",
          distance: "2 km",
          imageUrl: AppAssets.imgDummyProfile,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtMyEarning),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10.setHeight),
                    EarningGraphView(chartData: chartData, selectedRange: selectedRange),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _totalView(image: AppAssets.icClock, title: Languages.of(context).txtTotalHour, data: "32"),
                          Container(
                            width: 2.setWidth,
                            height: 90.setHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.01),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.5),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.01),
                                ],
                              ),
                            ),
                          ),
                          _totalView(image: AppAssets.icMile, title: Languages.of(context).txtTotalMiles, data: "400"),
                          Container(
                            width: 2.setWidth,
                            height: 90.setHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.01),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.5),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                                  CustomAppColor.of(context).txtBlack.withValues(alpha: 0.01),
                                ],
                              ),
                            ),
                          ),
                          _totalView(image: AppAssets.icFillDollar, title: Languages.of(context).txtTotalEarning, data: "\$530"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    TransactionHistoryScreen(transactionData: transactionData)
                  ],
                ),
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

  _totalView({required String image, required String title, required String data}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).chatBubbleFromSender,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Image.asset(
            image,
            color: CustomAppColor.of(context).txtGray,
            height: 20.setHeight,
            width: 20.setWidth,
          ),
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: title,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtGray,
        ),
        SizedBox(height: 2.setHeight),
        CommonText(
          text: data,
          fontSize: 20.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        )
      ],
    );
  }
}

class EarningGraphView extends StatefulWidget {
  final Map<String, List<double>> chartData;
  String selectedRange;

  EarningGraphView({super.key, required this.chartData, required this.selectedRange});

  @override
  State<EarningGraphView> createState() => _EarningGraphViewState();
}

class _EarningGraphViewState extends State<EarningGraphView> {
  @override
  Widget build(BuildContext context) {
    final data = widget.chartData[widget.selectedRange] ?? [];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.chartData.keys.map((key) {
            final isSelected = widget.selectedRange == key;
            return GestureDetector(
              onTap: () {
                setState(() => widget.selectedRange = key);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 16.setWidth),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: CustomAppColor.of(context).txtGray),
                ),
                child: CommonText(
                  text: key,
                  textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 40.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
          height: 230.setHeight,
          child: BarChart(
            BarChartData(
              gridData: const FlGridData(drawHorizontalLine: true, drawVerticalLine: false),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(color: CustomAppColor.of(context).dividerColor),
                  left: BorderSide.none,
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTitlesWidget: (value, meta) {
                      const daysMap = {0: '0', 50: '50', 100: '100', 150: '150', 200: '200'};
                      return CommonText(
                        text: daysMap[value.toInt()] ?? '',
                        fontSize: 10.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 52,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                      return CommonText(
                        text: days[value.toInt()],
                        fontSize: 10.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      );
                    },
                  ),
                ),
              ),
              barGroups: data.asMap().entries.map((entry) {
                final index = entry.key;
                final value = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.green.withValues(alpha: 0.7), Colors.green.withValues(alpha: 0.4), Colors.yellow.withValues(alpha: 0.1)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      width: 30,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  final List<TransactionSection> transactionData;

  const TransactionHistoryScreen({super.key, required this.transactionData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      itemCount: transactionData.length,
      itemBuilder: (context, sectionIndex) {
        final section = transactionData[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CommonText(
                  text: section.title,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Divider(
                    height: 3,
                    color: CustomAppColor.of(context).dividerColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            Column(
              children: section.transactions.map((data) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            data.imageUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: data.name,
                                fontSize: 15.setFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 2.setHeight),
                              CommonText(
                                text: data.paymentMethod,
                                fontSize: 13.setFontSize,
                                textColor: CustomAppColor.of(context).txtGray,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonText(
                              text: data.amount,
                              fontSize: 15.setFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 2.setHeight),
                            CommonText(
                              text: data.distance,
                              fontSize: 13.setFontSize,
                              textColor: CustomAppColor.of(context).txtGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
