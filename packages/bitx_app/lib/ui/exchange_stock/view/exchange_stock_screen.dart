import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/search/view/searh_screen.dart';
import 'package:bitx_app/ui/select_exchange_stocks/views/select_exchange_stocks_screen.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
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
      symbol: "BTC",
      company: "Bitcoin",
      price: "\$32,165.58",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBtc,
    ),
    WishListItemData(
      symbol: "ETH",
      company: "Ethereium",
      price: "\$25,180.76",
      percentage: "2.52%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icBtEth,
    ),
    WishListItemData(
      symbol: "LTC",
      company: "Litecoin",
      price: "\$14,840",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icBtItc,
    ),
    WishListItemData(
      symbol: "USDT",
      company: "Tether",
      price: "\$25,448",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtUsdt,
    ),
    WishListItemData(
      symbol: "DASH",
      company: "Dash",
      price: "\$25,448",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "ZEC",
      company: "Zcash",
      price: "\$20,648",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtZec,
    ),
    WishListItemData(
      symbol: "MASH",
      company: "Mash",
      price: "\$14,540",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icBtMash,
    ),
    WishListItemData(
      symbol: "BNB",
      company: "Binance Coin",
      price: "\$25,448",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBnb,
    ),
    WishListItemData(
      symbol: "NEO",
      company: "Neo",
      price: "\$14,540",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icBtMash,
    ),
  ];
  List<FlSpot> _getPortfolioChartData(String symbol) {
    // Generate realistic chart patterns with peaks and valleys matching the image
    switch (symbol) {
      case "BTC":
        return const [FlSpot(0, 0.6), FlSpot(1, 1.3), FlSpot(2, 0.9), FlSpot(3, 1.7), FlSpot(4, 1.2), FlSpot(5, 1.8)];
      case "ETH":
        return const [FlSpot(0, 1.8), FlSpot(1, 1.2), FlSpot(2, 1.6), FlSpot(3, 0.9), FlSpot(4, 1.3), FlSpot(5, 0.7)];
      case "LTC":
        return const [FlSpot(0, 1.6), FlSpot(1, 1.0), FlSpot(2, 1.4), FlSpot(3, 0.8), FlSpot(4, 1.1), FlSpot(5, 0.5)];
      case "USDT":
        return const [FlSpot(0, 0.4), FlSpot(1, 1.1), FlSpot(2, 0.7), FlSpot(3, 1.5), FlSpot(4, 1.0), FlSpot(5, 1.9)];
      case "DASH":
        return const [FlSpot(0, 0.8), FlSpot(1, 1.4), FlSpot(2, 1.0), FlSpot(3, 1.6), FlSpot(4, 1.2), FlSpot(5, 1.8)];
      case "ZEC":
        return const [FlSpot(0, 0.5), FlSpot(1, 1.2), FlSpot(2, 0.8), FlSpot(3, 1.5), FlSpot(4, 1.1), FlSpot(5, 1.7)];
      case "MASH":
        return const [FlSpot(0, 1.7), FlSpot(1, 1.1), FlSpot(2, 1.5), FlSpot(3, 0.8), FlSpot(4, 1.2), FlSpot(5, 0.6)];
      case "BNB":
        return const [FlSpot(0, 0.7), FlSpot(1, 1.3), FlSpot(2, 0.9), FlSpot(3, 1.6), FlSpot(4, 1.1), FlSpot(5, 1.8)];
      case "NEO":
        return const [FlSpot(0, 1.8), FlSpot(1, 1.2), FlSpot(2, 1.6), FlSpot(3, 0.9), FlSpot(4, 1.4), FlSpot(5, 0.7)];
      default:
        return const [FlSpot(0, 0.8), FlSpot(1, 1.4), FlSpot(2, 1.0), FlSpot(3, 1.6), FlSpot(4, 1.2), FlSpot(5, 1.5)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtExchange,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20.setWidth),
              child: Column(
                children: portfolioItems
                    .map(
                      (item) => GestureDetector(
                        onTap: () => Navigator.push(context, SelectExchangeStocksScreen.route()),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 10.setHeight),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: CustomAppColor.of(context).border,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                item.stockIcon,
                                width: 43.setWidth,
                                height: 43.setHeight,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 13.setWidth),
                              Column(
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
                              const Spacer(),
                              SizedBox(
                                width: 85.setWidth,
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
                              const Spacer(),
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
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
