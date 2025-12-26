import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/ui/history_about/view/history_about_screen.dart';
import 'package:bitx_app/ui/search/view/searh_screen.dart';
import 'package:bitx_app/ui/search_currency/view/search_currency_screen.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../home/view/home_screen.dart';

class WalletScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WalletScreen());
  }

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> implements TopBarClickListener {
  final marketItemsList = [
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
      company: "Ethereum",
      price: "\$25,180.76",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.orange,
      stockIcon: AppAssets.icBtEth,
    ),
    WishListItemData(
      symbol: "LTC",
      company: "Litecoin",
      price: "\$25,852.40",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icBtItc,
    ),
    WishListItemData(
      symbol: "USDT",
      company: "Tether",
      price: "\$25,584.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtUsdt,
    ),
    WishListItemData(
      symbol: "DASH",
      company: "DASH",
      price: "\$25,444.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "ZEC",
      company: "Zcash",
      price: "\$20,898.48",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtZec,
    ),
    WishListItemData(
      symbol: "MASH",
      company: "Mash",
      price: "\$14,668.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icBtMash,
    ),
    WishListItemData(
      symbol: "BNB",
      company: "Paypal Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBnb,
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
            title: Languages.of(context).txtWallet,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 5.setHeight,
                horizontal: 20.setWidth,
              ),
              child: Column(
                children: [
                  totalBalanceView(),
                  SizedBox(height: 70.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtRecentActivity,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.setFontSize,
                      ),
                      CommonText(
                        text: Languages.of(context).txtViewMore,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.setHeight),
                  Column(
                    children: marketItemsList
                        .map(
                          (item) => GestureDetector(
                            onTap: () => Navigator.push(context, HistoryAboutScreen.route(data: item)),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 12.setHeight),
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
                                    width: 80.setWidth,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            item.isPositive ? AppAssets.icArrowUp : AppAssets.icArrowDown,
                                            height: 17.setHeight,
                                            width: 17.setWidth,
                                          ),
                                          SizedBox(width: 8.setWidth),
                                          CommonText(
                                            text: item.percentage,
                                            fontSize: 12.setFontSize,
                                            fontWeight: FontWeight.w500,
                                            textColor: (item.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                                          ),
                                        ],
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalBalanceView() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 20.setWidth,
            bottom: 35.setHeight,
            right: 20.setWidth,
            top: 20.setHeight,
          ),
          decoration: BoxDecoration(
            gradient: CustomAppColor.of(context).linearGradiant,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              CommonText(
                text: Languages.of(context).txtMyTotalBalance,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: "\$21,920.95",
                fontWeight: FontWeight.w700,
                fontSize: 24.setFontSize,
              )
            ],
          ),
        ),
        Positioned(
          bottom: -50.setHeight,
          right: 30.setWidth,
          left: 30.setWidth,
          child: Row(
            children: [
              Expanded(
                child: _actionTile(
                  bgColor: CustomAppColor.of(context).depositBg,
                  icon: AppAssets.icDeposit,
                  title: Languages.of(context).txtDeposit,
                  index: 0,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: _actionTile(
                  bgColor: CustomAppColor.of(context).withdrawBg,
                  icon: AppAssets.icWithdraw,
                  title: Languages.of(context).txtWithdraw,
                  index: 1,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: _actionTile(
                  bgColor: CustomAppColor.of(context).exchangeBg,
                  icon: AppAssets.icExchange,
                  title: Languages.of(context).txtExchange,
                  index: 2,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: _actionTile(
                  bgColor: CustomAppColor.of(context).transferBg,
                  icon: AppAssets.icTransfer,
                  title: Languages.of(context).txtTransfer,
                  index: 3,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _actionTile({
    required int index,
    required Color bgColor,
    required String icon,
    required String title,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, SearchCurrencyScreen.route(currentIndex: index));
          },
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              gradient: RadialGradient(
                colors: [
                  bgColor,
                  bgColor,
                ],
                focalRadius: 2,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
            child: Image.asset(
              icon,
              width: 20.setHeight,
              height: 20.setHeight,
            ),
          ),
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: title,
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
