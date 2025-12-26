import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/deposite_coin/view/deposite_coin_screen.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/ui/select_exchange_stocks/views/select_exchange_stocks_screen.dart';
import 'package:bitx_screens_app/ui/transfer_coin/view/transfer_coin_screen.dart';
import 'package:bitx_screens_app/ui/withdraw_coin/view/withdraw_coin_screen.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:bitx_screens_app/widgets/text_field/text_form_field.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SearchCurrencyScreen extends StatefulWidget {
  final int currentIndex;
  final bool forEmptyScreen;

  static Route<void> route({int currentIndex = 0, bool forEmptyScreen = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchCurrencyScreen(
        currentIndex: currentIndex,
        forEmptyScreen: forEmptyScreen,
      ),
    );
  }

  const SearchCurrencyScreen({
    super.key,
    this.currentIndex = 0,
    this.forEmptyScreen = false,
  });

  @override
  State<SearchCurrencyScreen> createState() => _SearchCurrencyScreenState();
}

class _SearchCurrencyScreenState extends State<SearchCurrencyScreen> implements TopBarClickListener {
  final TextEditingController controller = TextEditingController();
  final portfolioItems = [
    WishListItemData(
      symbol: "BTC",
      company: "Bitcoin",
      price: "\$32,165.58",
      percentage: "2.52%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBtc,
    ),
    WishListItemData(
      symbol: "ETH",
      company: "Ethereuim",
      price: "\$25,180.10",
      percentage: "2.53%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icBtEth,
    ),
    WishListItemData(
      symbol: "LTC",
      company: "Lithcoin",
      price: "\$25,180.10",
      percentage: "0.32%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icBtItc,
    ),
    WishListItemData(
      symbol: "USDT",
      company: "Tether",
      price: "\$25,180.48",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtUsdt,
    ),
    WishListItemData(
      symbol: "DASH",
      company: "Dash",
      price: "\$25,180.48",
      percentage: "0.32%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "ZEC",
      company: "Zcash",
      price: "\$25,180.48",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icBtZec,
    ),
    WishListItemData(
      symbol: "MASH",
      company: "Mash",
      price: "\$25,180.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icBtMash,
    ),
    WishListItemData(
      symbol: "BNB",
      company: "Binance Coin",
      price: "\$25,180.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBnb,
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<WishListItemData> get filteredMarketItems {
    List<WishListItemData> list = portfolioItems;
    if (controller.text.isEmpty) {
      list = list;
    } else {
      list = list.where((element) => element.symbol.toUpperCase().contains(controller.text.toUpperCase())).toList();
    }
    return list;
  }

  void onChanged(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSearchCurrency,
            isShowBack: true,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonTextFormField(
                      controller: controller,
                      hintText: "Search",
                      prefixIcon: AppAssets.icSearch,
                      onTextChanged: (p0) {
                        onChanged(p0);
                      },
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  !widget.forEmptyScreen ? _buildPortfolioList() : emptyListView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget emptyListView() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 130.setHeight),
          Image.asset(
            AppAssets.imgMarketEmpty,
            height: 220.setHeight,
            width: 220.setWidth,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtSearchNotFound,
            fontWeight: FontWeight.w600,
            fontSize: 20.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtSearchNotFoundSub,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: filteredMarketItems
            .map(
              (item) => IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () {
                    if (widget.currentIndex == 0) {
                      Navigator.push(context, DepositeCoinScreen.route(data: item));
                    } else if (widget.currentIndex == 1) {
                      Navigator.push(context, WithdrawCoinScreen.route(data: item));
                    } else if (widget.currentIndex == 2) {
                      Navigator.push(context, SelectExchangeStocksScreen.route());
                    } else {
                      Navigator.push(context, TransferCoinScreen.route(data: item));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 10.setHeight),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
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
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 2.setHeight),
                            CommonText(
                              text: item.company,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGray,
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
                        const Spacer(),
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  item.isPositive ? AppAssets.icArrowUp : AppAssets.icArrowDown,
                                  height: 8.setHeight,
                                  width: 16.setHeight,
                                ),
                                SizedBox(width: 5.setWidth),
                                CommonText(
                                  text: item.isPositive ? "+${item.percentage}" : "-${item.percentage}",
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
              ),
            )
            .toList(),
      ),
    );
  }

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
      case "BNB":
        return const [FlSpot(0, 0.7), FlSpot(1, 1.3), FlSpot(2, 0.9), FlSpot(3, 1.6), FlSpot(4, 0.1), FlSpot(5, 0.8)];
      default:
        return const [FlSpot(0, 0.8), FlSpot(1, 1.4), FlSpot(2, 1.0), FlSpot(3, 1.6), FlSpot(4, 1.2), FlSpot(5, 1.5)];
    }
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
