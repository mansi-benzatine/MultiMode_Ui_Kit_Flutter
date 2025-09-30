import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/view/home_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> implements TopBarClickListener {
  List<FlSpot> _getPortfolioChartData(String symbol) {
    // Generate realistic chart patterns with peaks and valleys matching the image
    switch (symbol) {
      case "TWTR":
        return const [FlSpot(0, 0.6), FlSpot(1, 1.3), FlSpot(2, 0.9), FlSpot(3, 1.7), FlSpot(4, 1.2), FlSpot(5, 1.8)];
      case "AWS":
        return const [FlSpot(0, 1.8), FlSpot(1, 1.2), FlSpot(2, 1.6), FlSpot(3, 0.9), FlSpot(4, 1.3), FlSpot(5, 0.7)];
      case "MDM":
        return const [FlSpot(0, 1.6), FlSpot(1, 1.0), FlSpot(2, 1.4), FlSpot(3, 0.8), FlSpot(4, 1.1), FlSpot(5, 0.5)];
      case "NFLX":
        return const [FlSpot(0, 0.4), FlSpot(1, 1.1), FlSpot(2, 0.7), FlSpot(3, 1.5), FlSpot(4, 1.0), FlSpot(5, 1.9)];
      case "MCST":
        return const [FlSpot(0, 0.8), FlSpot(1, 1.4), FlSpot(2, 1.0), FlSpot(3, 1.6), FlSpot(4, 1.2), FlSpot(5, 1.8)];
      case "PNTS":
        return const [FlSpot(0, 0.5), FlSpot(1, 1.2), FlSpot(2, 0.8), FlSpot(3, 1.5), FlSpot(4, 1.1), FlSpot(5, 1.7)];
      case "HST":
        return const [FlSpot(0, 1.7), FlSpot(1, 1.1), FlSpot(2, 1.5), FlSpot(3, 0.8), FlSpot(4, 1.2), FlSpot(5, 0.6)];
      case "PYPL":
        return const [FlSpot(0, 0.7), FlSpot(1, 1.3), FlSpot(2, 0.9), FlSpot(3, 1.6), FlSpot(4, 1.1), FlSpot(5, 1.8)];
      case "YUTB":
        return const [FlSpot(0, 1.8), FlSpot(1, 1.2), FlSpot(2, 1.6), FlSpot(3, 0.9), FlSpot(4, 1.4), FlSpot(5, 0.7)];
      case "ADB":
        return const [FlSpot(0, 1.5), FlSpot(1, 0.9), FlSpot(2, 1.3), FlSpot(3, 0.7), FlSpot(4, 1.1), FlSpot(5, 0.6)];
      case "SPOT":
        return const [FlSpot(0, 0.6), FlSpot(1, 1.2), FlSpot(2, 0.8), FlSpot(3, 1.5), FlSpot(4, 1.0), FlSpot(5, 1.7)];
      default:
        return const [FlSpot(0, 0.8), FlSpot(1, 1.4), FlSpot(2, 1.0), FlSpot(3, 1.6), FlSpot(4, 1.2), FlSpot(5, 1.5)];
    }
  }

  final portfolioItems = [
    WishListItemData(
      symbol: "TWTR",
      company: "Twitter Inc.",
      price: "\$131.58",
      percentage: "2.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockTwitter,
    ),
    WishListItemData(
      symbol: "AWS",
      company: "Amazon Inc.",
      price: "\$126.76",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icStockAmazon,
    ),
    WishListItemData(
      symbol: "MDM",
      company: "Medium Inc",
      price: "\$148.40",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icStockMedium,
    ),
    WishListItemData(
      symbol: "NFLX",
      company: "Netflix Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icStockNetflix,
    ),
    WishListItemData(
      symbol: "MCST",
      company: "Microsoft Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockMicrosoft,
    ),
    WishListItemData(
      symbol: "PNTS",
      company: "Pinterest Inc.",
      price: "\$204.48",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icStockPintrest,
    ),
    WishListItemData(
      symbol: "HST",
      company: "Hotstar Inc.",
      price: "\$148.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icStockDisney,
    ),
    WishListItemData(
      symbol: "PYPL",
      company: "Paypal Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockPayPal,
    ),
    WishListItemData(
      symbol: "YUTB",
      company: "Youtube Inc.",
      price: "\$148.40",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icStockYoutube,
    ),
    WishListItemData(
      symbol: "ADB",
      company: "Adobe Inc.",
      price: "\$148.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icStockAdobe,
    ),
    WishListItemData(
      symbol: "SPOT",
      company: "Spotify Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.green,
      stockIcon: AppAssets.icStockSpotify,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
              ? null
              : DecorationImage(
                  image: AssetImage(AppAssets.imgCommonBackground),
                  fit: BoxFit.fill,
                ),
        ),
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtMyPortfolio.replaceAll("My", ""),
              isShowMore: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 5.setHeight),
                    _stockDetailsView(),
                    graphView(),
                    SizedBox(height: 5.setHeight),
                    _detailsContainerView(),
                    SizedBox(height: 5.setHeight),
                    stocksView(),
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

  Widget _stockDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "\$25,901",
                fontSize: 30.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(height: 8.setHeight),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 1.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).green.withOpacityPercent(0.1),
                      borderRadius: BorderRadius.circular(1000.setWidth),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          color: CustomAppColor.of(context).green,
                        ),
                        CommonText(
                          text: "8.10%",
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamilyMedium,
                          textColor: CustomAppColor.of(context).green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 7.setWidth),
                  CommonText(
                    text: "\$12,26.8",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constant.fontFamilyMedium,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget graphView() {
    String selectedRange = "1D";
    final List<String> ranges = ["1D", "1W", "1M", "3M", "6M", "1Y"];

    return Column(
      children: [
        SizedBox(
          height: 220.setHeight,
          width: double.infinity,
          child: Stack(
            children: [
              LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
                        dashArray: [5, 5],
                        strokeWidth: 0.5,
                      );
                    },
                  ),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                    border: Border(
                      bottom: BorderSide(
                        color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                        width: 1, // line thickness
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _generateStockData(),
                      isCurved: true,
                      curveSmoothness: 0,
                      color: CustomAppColor.of(context).primary2,
                      barWidth: 1,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            CustomAppColor.of(context).primary.withOpacityPercent(0.9),
                            CustomAppColor.of(context).primary.withOpacityPercent(0.6),
                            CustomAppColor.of(context).primary.withOpacityPercent(0.3),
                            CustomAppColor.of(context).primary.withOpacityPercent(0.02),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => CustomAppColor.of(context).white.withOpacityPercent(0.4),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((touchedSpot) {
                          String day = _getDayFromSpot(touchedSpot.x);
                          /* String time = _getTimeFromSpot(touchedSpot.x);*/
                          double price = _getPriceFromY(touchedSpot.y);

                          return LineTooltipItem(
                            '',
                            TextStyle(
                              color: CustomAppColor.of(context).txtBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilyMedium,
                              package: "stoxy_screens_app_package",
                            ),
                            children: [
                              TextSpan(
                                text: '$day\n',
                                style: TextStyle(
                                  color: CustomAppColor.of(context).txtBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium,
                                  package: "stoxy_screens_app_package",
                                ),
                              ),
                              TextSpan(
                                text: '\$${price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.8),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.setFontSize,
                                  fontFamily: Constant.fontFamily,
                                  package: "stoxy_screens_app_package",
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                  ),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 15.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ranges.map((r) {
              final isSelected = r == selectedRange;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedRange = r);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).bgCard,
                  ),
                  child: CommonText(
                    text: r,
                    fontSize: 12.setFontSize,
                    textColor: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtGray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _detailsContainerView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgCard,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 16.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Today Gains",
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 15.setHeight),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).notificationImageBg,
                      ),
                      child: Image.asset(
                        AppAssets.icHigh,
                        height: 21.setHeight,
                        width: 21.setWidth,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: "\$2403.36",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 17.setWidth),
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgCard,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 16.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Overall Loss",
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 15.setHeight),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).notificationImageBg,
                      ),
                      child: Image.asset(
                        AppAssets.icLow,
                        height: 21.setHeight,
                        width: 21.setWidth,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: "\$5400.11",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stocksView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "My Stock",
            fontSize: 17.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 8.setHeight),
          Column(
            children: portfolioItems
                .map(
                  (item) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 10.setHeight),
                    child: Row(
                      children: [
                        Image.asset(
                          item.stockIcon,
                          width: 43.setWidth,
                          height: 43.setHeight,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 13.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: item.symbol,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                              SizedBox(height: 4.setHeight),
                              CommonText(
                                text: item.company,
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70.setWidth,
                          height: 30.setHeight,
                          child: Stack(
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                                child: LineChart(
                                  LineChartData(
                                    gridData: const FlGridData(show: false),
                                    titlesData: const FlTitlesData(show: false),
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: _getPortfolioChartData(item.symbol),
                                        isCurved: false,
                                        curveSmoothness: 0.2,
                                        gradient: item.isPositive
                                            ? LinearGradient(
                                                colors: [
                                                  CustomAppColor.of(context).green.withOpacityPercent(0.1),
                                                  CustomAppColor.of(context).green,
                                                  CustomAppColor.of(context).green,
                                                  CustomAppColor.of(context).green.withOpacityPercent(0.1),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                stops: const [0.0, 0.2, 0.6, 1.0],
                                              )
                                            : LinearGradient(
                                                colors: [
                                                  CustomAppColor.of(context).red.withOpacityPercent(0.1),
                                                  CustomAppColor.of(context).red,
                                                  CustomAppColor.of(context).red,
                                                  CustomAppColor.of(context).red.withOpacityPercent(0.1),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                stops: const [0.0, 0.2, 0.6, 1.0],
                                              ),
                                        barWidth: 1.5,
                                        isStrokeCapRound: true,
                                        dotData: const FlDotData(show: false),
                                        belowBarData: BarAreaData(show: false),
                                      ),
                                    ],
                                    lineTouchData: const LineTouchData(enabled: false),
                                    minX: 0,
                                    maxX: 5,
                                    minY: 0,
                                    maxY: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonText(
                              text: item.price,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 4.setHeight),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 1.setHeight),
                              decoration: BoxDecoration(
                                color: item.isPositive ? CustomAppColor.of(context).green.withOpacityPercent(0.1) : CustomAppColor.of(context).red.withOpacityPercent(0.1),
                                borderRadius: BorderRadius.circular(1000.setWidth),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    !item.isPositive ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
                                    color: item.isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                                  ),
                                  CommonText(
                                    text: item.percentage,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: (item.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 8.setHeight),
        ],
      ),
    );
  }

  List<FlSpot> _generateStockData() {
    return [
      // Sunday
      const FlSpot(0, 2.2),

      const FlSpot(0.2, 2.6),

      // Monday - Recovery
      const FlSpot(1, 2.6),

      const FlSpot(1.3, 2.2),
      const FlSpot(1.4, 2.6),

      const FlSpot(1.7, 3.6),
      // Tuesday - Volatile
      const FlSpot(2, 3.8),

      const FlSpot(2.2, 4.2),

      const FlSpot(2.6, 3.8),
      const FlSpot(2.7, 3.0),
      // Wednesday - Strong uptrend
      const FlSpot(3, 2.5),

      const FlSpot(3.5, 3.5),

      const FlSpot(3.8, 3.2),
      // Thursday - Peak with pullback
      const FlSpot(4, 3.5),

      const FlSpot(4.5, 3.8),
      const FlSpot(4.8, 3.6),
      // Friday - Consolidation
      const FlSpot(5, 3.4),

      const FlSpot(5.2, 4.2),
      const FlSpot(5.3, 4.0),

      const FlSpot(5.6, 3.8),
      const FlSpot(5.7, 3.0),
      // Saturday
      const FlSpot(6, 2.8),
    ];
  }

  String _getDayFromSpot(double x) {
    const days = ['Apr 14,2022', 'Apr 15,2022', 'Apr 16,2022', 'Apr 17,2022', 'Apr 18,2022', 'Apr 19,2022', 'Apr 20,2022'];
    int dayIndex = x.floor().clamp(0, 6);
    return days[dayIndex];
  }

  /* String _getTimeFromSpot(double x) {
    double timeInDay = x - x.floor();
    int hour = (9 + (timeInDay * 7)).round(); // Market hours 9am-4pm
    String period = hour >= 12 ? 'PM' : 'AM';
    int displayHour = hour > 12 ? hour - 12 : hour;
    return '$displayHour:00 $period';
  }*/

  double _getPriceFromY(double y) {
    return 25700 + (y * 150);
  }
}
