import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/my_portfolio/view/my_portfolio_screen.dart';
import 'package:bitx_app/ui/my_wishlist/view/my_wishlist_screen.dart';
import 'package:bitx_app/ui/notification/view/notification_screen.dart';
import 'package:bitx_app/ui/search/view/searh_screen.dart';
import 'package:bitx_app/ui/search_currency/view/search_currency_screen.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../explore_crypto/view/explore_crypto_screen.dart';

class WishListItemData {
  final String symbol;
  final String company;
  final String price;
  final String percentage;
  final bool isPositive;
  final Color color;
  final String stockIcon;
  bool isFavorite;

  WishListItemData({
    required this.symbol,
    required this.company,
    required this.price,
    required this.percentage,
    required this.isPositive,
    required this.color,
    required this.stockIcon,
    this.isFavorite = false,
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
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _topBar(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myBalanceView(),
                    SizedBox(height: 16.setHeight),
                    actionView(),
                    SizedBox(height: 16.setHeight),
                    _buildSectionHeader(Languages.of(context).txtMarketMovers, Languages.of(context).txtViewMore, () {
                      Navigator.push(context, MyWishlistScreen.route());
                    }),
                    SizedBox(height: 16.setHeight),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const WishListCard(
                            symbol: "BTC",
                            company: "Bitcoin",
                            price: "\$32,165.10",
                            percentage: "2.53%",
                            isPositive: true,
                            color: Colors.blue,
                            stockIcon: AppAssets.icBtBtc,
                          ),
                          const WishListCard(
                            symbol: "ETH",
                            company: "Ethereum",
                            price: "\$32,165.10",
                            percentage: "2.53%",
                            isPositive: true,
                            stockIcon: AppAssets.icBtEth,
                            color: Colors.black,
                          ),
                          const WishListCard(
                            symbol: "LTC",
                            company: "Litecoin",
                            price: "\$25,180.10",
                            percentage: "0.53%",
                            isPositive: false,
                            stockIcon: AppAssets.icBtItc,
                            color: Colors.black,
                          ),
                          const WishListCard(
                            symbol: "DASH",
                            company: "Dash",
                            price: "\$32,165.10",
                            percentage: "2.53%",
                            isPositive: true,
                            stockIcon: AppAssets.icBtDash,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.setWidth)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.setHeight),
                    _buildSectionHeader(
                      Languages.of(context).txtMyPortfolio,
                      Languages.of(context).txtViewMore,
                      () {
                        Navigator.push(context, MyPortfolioScreen.route());
                      },
                    ),
                    SizedBox(height: 10.setHeight),
                    _buildPortfolioList(),
                    SizedBox(height: 60.setHeight),
                  ],
                ),
              ),
            ),
          ],
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
          CircleAvatar(
            radius: 25,
            child: Image.asset(
              AppAssets.imgDummyGirl,
            ),
          ),
          SizedBox(width: 10.setWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Hello,",
                textColor: CustomAppColor.of(context).txtBlack,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 4.setHeight),
              CommonText(
                text: "John Masterson",
                fontWeight: FontWeight.w500,
                fontSize: 13.setFontSize,
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context, SearchScreen.route());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).icRoundBg,
                shape: BoxShape.circle,
                border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild),
              ),
              child: Image.asset(
                AppAssets.icSearch,
                width: 20.setWidth,
                height: 20.setHeight,
                color: CustomAppColor.of(context).icBlack,
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          GestureDetector(
            onTap: () => Navigator.push(context, NotificationScreen.route()),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).icRoundBg,
                shape: BoxShape.circle,
                border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild),
              ),
              child: Image.asset(
                AppAssets.icNotification,
                width: 20.setWidth,
                height: 20.setHeight,
                color: CustomAppColor.of(context).icBlack,
              ),
            ),
          ),
          SizedBox(width: 20.setWidth),
        ],
      ),
    );
  }

  Widget myBalanceView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtMyTotalBalance,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: "\$250,920.25",
            fontWeight: FontWeight.w600,
            fontSize: 25.setFontSize,
          )
        ],
      ),
    );
  }

  Widget _actionTile({
    required Color bgColor,
    required String icon,
    required String title,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SearchCurrencyScreen.route(currentIndex: index));
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          gradient: RadialGradient(
            colors: [
              bgColor,
              bgColor,
            ],
            radius: 25,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgScreen,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                icon,
                width: 18.setHeight,
                height: 18.setHeight,
                color: CustomAppColor.of(context).icBlack,
              ),
            ),
            SizedBox(width: 12.setWidth),
            CommonText(
              text: title,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).black,
            ),
          ],
        ),
      ),
    );
  }

  Widget actionView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: [
          Row(
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
                  bgColor: CustomAppColor.of(context).transferBg,
                  icon: AppAssets.icTransfer,
                  title: Languages.of(context).txtTransfer,
                  index: 3,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
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
                  bgColor: CustomAppColor.of(context).withdrawBg,
                  icon: AppAssets.icWithdraw,
                  title: Languages.of(context).txtWithdraw,
                  index: 1,
                ),
              ),
            ],
          ),
        ],
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

  Widget _buildSectionHeader(String title, String actionText, Function() onTap) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
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
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioList() {
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: portfolioItems
            .map(
              (item) => GestureDetector(
                onTap: () => Navigator.push(context, ExploreStockScreen.route(data: item)),
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
                        width: 110.setWidth,
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
            )
            .toList(),
      ),
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
    return Padding(
      padding: EdgeInsets.only(left: 20.setWidth),
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
          width: 0.screenWidth / 2.6,
          padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 15.setWidth),
          decoration: BoxDecoration(
            color: (Theme.of(context).brightness == Brightness.light) ? CustomAppColor.of(context).bgCard : null,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).borderTextFormFeild,
              width: 0.5,
            ),
            gradient: (Theme.of(context).brightness == Brightness.light) ? null : CustomAppColor.of(context).linearGradiant,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      stockIcon,
                      width: 35.setHeight,
                      height: 35.setHeight,
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: symbol,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        CommonText(
                          text: company,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              SizedBox(
                width: 120.setWidth,
                height: 40.setHeight,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    LineChart(
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
                  ],
                ),
              ),
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            isPositive ? AppAssets.icArrowUp : AppAssets.icArrowDown,
                            width: 14.setHeight,
                            height: 8.setHeight,
                          ),
                          SizedBox(width: 4.setWidth),
                          CommonText(
                            text: isPositive ? " +$percentage" : " -$percentage",
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Mini chart
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getWishlistChartData(String symbol) {
    if (symbol == "BTC") {
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
    } else if (symbol == "ETH") {
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
    } else if (symbol == "LTC") {
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
    } else if (symbol == "USDT") {
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
    } else if (symbol == "DASH") {
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
    } else if (symbol == "ZEC") {
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
    } else if (symbol == "BNB") {
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
