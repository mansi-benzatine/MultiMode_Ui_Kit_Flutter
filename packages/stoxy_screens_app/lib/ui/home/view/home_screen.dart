import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/ui/explore_stock/view/explore_stock_screen.dart';
import 'package:stoxy_screens_app_package/ui/my_portfolio/view/my_portfolio_screen.dart';
import 'package:stoxy_screens_app_package/ui/my_wishlist/view/my_wishlist_screen.dart';
import 'package:stoxy_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:stoxy_screens_app_package/ui/search/view/searh_screen.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';

class WishListItemData {
  final String symbol;
  final String company;
  final String price;
  final String percentage;
  final bool isPositive;
  final Color color;
  final String stockIcon;

  WishListItemData({
    required this.symbol,
    required this.company,
    required this.price,
    required this.percentage,
    required this.isPositive,
    required this.color,
    required this.stockIcon,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _topBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                  child: Column(
                    children: [
                      _searchBar(),
                      SizedBox(height: 30.setHeight),
                      _chartView(),
                      SizedBox(height: 26.setHeight),

                      // My Wishlist Section
                      _buildSectionHeader(Languages.of(context).txtMyWishlist, Languages.of(context).txtSeeAll, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyWishlistScreen(),
                          ),
                        );
                      }),
                      SizedBox(height: 16.setHeight),

                      Row(
                        children: [
                          const Expanded(
                            child: WishListCard(
                              symbol: "GOOG",
                              company: "Google Inc.",
                              price: "\$131.58",
                              percentage: "2.5%",
                              isPositive: true,
                              color: Colors.blue,
                              stockIcon: AppAssets.icGoogle,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          const Expanded(
                            child: WishListCard(
                              symbol: "AAPL",
                              company: "Apple, Inc.",
                              price: "\$206.20",
                              percentage: "3.7%",
                              isPositive: false,
                              stockIcon: AppAssets.icApple,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.setHeight),

                      // My Portfolio Section
                      _buildSectionHeader(Languages.of(context).txtMyPortfolio, Languages.of(context).txtSeeAll, () {
                        Navigator.push(context, MyPortfolioScreen.route());
                      }),
                      SizedBox(height: 10.setHeight),
                      _buildPortfolioList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.setHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 15.setWidth),
          Image.asset(
            AppAssets.icHomeTop,
            height: 26.setHeight,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: Languages.of(context).txtAppName.toUpperCase(),
            textColor: CustomAppColor.of(context).txtBlack,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
              child: Image.asset(
                AppAssets.icNotification,
                width: 24.setWidth,
                height: 24.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
        ],
      ),
    );
  }

  List<FlSpot> _generateStockData() {
    // Generate realistic stock market data with proper scaling
    return [
      // Sunday
      const FlSpot(0, 2.2),
      const FlSpot(0.1, 2.1),

      const FlSpot(0.2, 2.6),
      const FlSpot(0.3, 2.2),
      const FlSpot(0.4, 2.6),
      const FlSpot(0.5, 2.9),
      const FlSpot(0.6, 2.6),
      const FlSpot(0.7, 2.5),
      // Monday - Recovery
      const FlSpot(1, 2.6),
      const FlSpot(1.1, 2.1),
      const FlSpot(1.2, 2.6),
      const FlSpot(1.3, 2.2),
      const FlSpot(1.4, 2.6),
      const FlSpot(1.5, 2.9),
      const FlSpot(1.6, 2.3),
      const FlSpot(1.7, 3.6),
      // Tuesday - Volatile
      const FlSpot(2, 3.8),
      const FlSpot(2.1, 4),
      const FlSpot(2.2, 4.2),
      const FlSpot(2.3, 4.0),
      const FlSpot(2.4, 3.8),
      const FlSpot(2.5, 3.6),
      const FlSpot(2.6, 3.8),
      const FlSpot(2.7, 3.0),
      // Wednesday - Strong uptrend
      const FlSpot(3, 2.5),
      const FlSpot(3.1, 3.5),
      const FlSpot(3.3, 2.5),
      const FlSpot(3.4, 2.5),
      const FlSpot(3.5, 3.5),
      const FlSpot(3.6, 2.5),
      const FlSpot(3.8, 3.2),
      // Thursday - Peak with pullback
      const FlSpot(4, 3.5),
      const FlSpot(4.2, 4.0),
      const FlSpot(4.5, 3.8),
      const FlSpot(4.8, 3.6),
      // Friday - Consolidation
      const FlSpot(5, 3.4),

      const FlSpot(5.2, 4.2),
      const FlSpot(5.3, 4.0),
      const FlSpot(5.4, 3.8),
      const FlSpot(5.5, 3.6),
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
    // Convert chart Y coordinate back to actual price
    return 25700 + (y * 150);
  }

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

  Widget _searchBar() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 15.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: BorderRadius.circular(25.setWidth),
          border: Border.all(
            color: CustomAppColor.of(context).searchFieldBorder,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              AppAssets.icSearch,
              height: 20.setHeight,
              fit: BoxFit.contain,
              color: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(width: 10.setWidth),
            CommonText(
              text: Languages.of(context).txtSearchdot,
              textColor: CustomAppColor.of(context).txtBlack,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _chartView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 18.setHeight, bottom: 10.setHeight, right: 2.setWidth, left: 2.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).homeGraph.withOpacityPercent(0.2),
        borderRadius: BorderRadius.circular(16.setWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Total Balance",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: Constant.fontFamily,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.setWidth, top: 2.setHeight, bottom: 2.setHeight, right: 2.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgCard,
                    borderRadius: BorderRadius.circular(1000.setWidth),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "This Week",
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: CustomAppColor.of(context).txtBlack,
                        size: 25.setWidth,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
            child: Row(
              children: [
                CommonText(
                  text: "\$25,901",
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 6.setWidth),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 2.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary.withOpacityPercent(0.5),
                    borderRadius: BorderRadius.circular(12.setWidth),
                  ),
                  child: CommonText(
                    text: "▲ 8.10%",
                    fontSize: 10.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ],
            ),
          ),

          // Interactive Line Chart
          SizedBox(
            height: 170.setHeight,
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
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const days = ['\u00A0       S', 'M', 'T', 'W', 'T', 'F', "S        \u00A0"];
                            int dayIndex = value.toInt();
                            if (dayIndex >= 0 && dayIndex < days.length) {
                              return Padding(
                                padding: EdgeInsets.only(top: 8.setHeight),
                                child: CommonText(
                                  text: days[dayIndex],
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        bottom: BorderSide(
                          color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.1),
                          width: 1, // line thickness
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _generateStockData(),
                        isCurved: true,
                        curveSmoothness: 0.2,
                        color: CustomAppColor.of(context).txtBlack,
                        barWidth: 1,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
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

                // Navigation arrows
                // Positioned(
                //   bottom: 20.setHeight,
                //   right: 20.setWidth,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20.setWidth),
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Icon(
                //           Icons.chevron_left,
                //           color: Color(0xFF8B5CF6),
                //           size: 16.setWidth,
                //         ),
                //         SizedBox(width: 4.setWidth),
                //         Icon(
                //           Icons.chevron_right,
                //           color: Color(0xFF8B5CF6),
                //           size: 16.setWidth,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText, Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          fontSize: 18.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        InkWell(
          onTap: onTap,
          child: CommonText(
            text: actionText,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            fontFamily: Constant.fontFamilyMedium,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildPortfolioList() {
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

    return Column(
      children: portfolioItems
          .map(
            (item) => GestureDetector(
              onTap: () => Navigator.push(context, ExploreStockScreen.route(data: item)),
              child: Container(
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
                    // Mini chart for portfolio item
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
                                    gradient: (item.isPositive)
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
                                    color: (item.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
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
            ),
          )
          .toList(),
    );
  }
}

class WishListCard extends StatelessWidget {
  const WishListCard({
    super.key,
    required this.symbol,
    required this.company,
    required this.price,
    required this.percentage,
    required this.isPositive,
    required this.color,
    required this.stockIcon,
  });

  final String symbol;
  final String company;
  final String price;
  final String percentage;
  final bool isPositive;
  final Color color;
  final String stockIcon;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            data: WishListItemData(
              symbol: symbol,
              company: company,
              price: price,
              percentage: percentage,
              isPositive: isPositive,
              color: color,
              stockIcon: stockIcon,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 10.setHeight,
            bottom: 10.setHeight,
            left: 12.setWidth,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgCard,
            borderRadius: BorderRadius.circular(7.setWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      stockIcon,
                      width: 28.setHeight,
                      height: 28.setHeight,
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: symbol,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        SizedBox(height: 2.setHeight),
                        CommonText(
                          text: company,
                          fontSize: 10.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: price,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 8.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 2.setHeight),
                        decoration: BoxDecoration(
                          color: isPositive ? CustomAppColor.of(context).green.withOpacityPercent(0.1) : CustomAppColor.of(context).red.withOpacityPercent(0.1),
                          borderRadius: BorderRadius.circular(1000.setWidth),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              !isPositive ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
                              color: isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                            ),
                            CommonText(
                              text: percentage,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Mini chart
                  SizedBox(
                    width: 75.setWidth,
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
                                  spots: _getWishlistChartData(symbol),
                                  isCurved: false,
                                  curveSmoothness: 0.2,
                                  gradient: isPositive
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
                                  color: isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                              lineTouchData: const LineTouchData(enabled: false),
                              minX: 0,
                              maxX: 6,
                              minY: 0,
                              maxY: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getWishlistChartData(String symbol) {
    if (symbol == "GOOG") {
      // Google - positive trend with peaks and valleys
      return const [
        FlSpot(0, 0.8),
        FlSpot(1, 1.2),
        FlSpot(2, 0.9),
        FlSpot(3, 1.6),
        FlSpot(4, 1.1),
        FlSpot(5, 1.4),
        FlSpot(6, 2.0),
      ];
    } else if (symbol == "TWTR") {
      // Apple - negative trend with volatility
      return const [
        FlSpot(0, 2.2),
        FlSpot(1, 1.8),
        FlSpot(2, 2.1),
        FlSpot(3, 1.5),
        FlSpot(4, 2.9),
        FlSpot(5, 2.3),
        FlSpot(6, 2.0),
      ];
    } else if (symbol == "BMW") {
      // Apple - negative trend with volatility
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.8),
        FlSpot(2, 0.1),
        FlSpot(3, 1.5),
        FlSpot(4, 1.9),
        FlSpot(5, 0.3),
        FlSpot(6, 0.0),
      ];
    } else if (symbol == "META") {
      // META - positive trend with volatility
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.8),
        FlSpot(2, 0.1),
        FlSpot(3, 1.5),
        FlSpot(4, 2.9),
        FlSpot(5, 2.3),
        FlSpot(6, 2.0),
      ];
    } else if (symbol == "NFLX") {
      // NFLX - positive trend with volatility
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.8),
        FlSpot(2, 0.1),
        FlSpot(3, 1.5),
        FlSpot(4, 0.9),
        FlSpot(5, 2.3),
        FlSpot(6, 2.0),
      ];
    } else if (symbol == "MCD") {
      // MCD - positive trend with volatility
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.8),
        FlSpot(2, 3.1),
        FlSpot(3, 0.5),
        FlSpot(4, 1.9),
        FlSpot(5, 1.3),
        FlSpot(6, 2.0),
      ];
    } else if (symbol == "AWS") {
      // AWS - negative trend with volatility
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.8),
        FlSpot(2, 3.1),
        FlSpot(3, 0.5),
        FlSpot(4, 1.9),
        FlSpot(5, 1.3),
        FlSpot(6, 0.4),
      ];
    } else {
      return const [
        FlSpot(0, 2.2),
        FlSpot(1, 1.8),
        FlSpot(2, 2.1),
        FlSpot(3, 1.5),
        FlSpot(4, 1.9),
        FlSpot(5, 1.3),
        FlSpot(6, 1.0),
      ];
    }
  }
}
