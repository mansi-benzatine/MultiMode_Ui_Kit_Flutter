import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stoxy_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/ui/select_exchange_stocks/views/select_exchange_stocks_screen.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/utils/utils.dart';
import 'package:stoxy_app_package/widgets/text/common_text.dart';
import 'package:stoxy_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../home/view/home_screen.dart';

class ExchangeStockScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ExchangeStockScreen());
  }

  const ExchangeStockScreen({super.key});

  @override
  State<ExchangeStockScreen> createState() => _ExchangeStockScreenState();
}

class _ExchangeStockScreenState extends State<ExchangeStockScreen> implements TopBarClickListener {
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
              title: Languages.of(context).txtExchangeStock,
              isShowMore: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: 10.setHeight,
                  horizontal: 20.setWidth,
                ),
                child: Column(
                  children: portfolioItems
                      .map(
                        (item) => GestureDetector(
                          onTap: () => Navigator.push(context, SelectExchangeStocksScreen.route()),
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
                        ),
                      )
                      .toList(),
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
    if (name == Constant.strMore) {}
  }
}
