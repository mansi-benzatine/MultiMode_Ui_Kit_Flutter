import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/explore_crypto/view/explore_crypto_screen.dart';
import 'package:bitx_app/ui/home/view/home_screen.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/text_field/text_form_field.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MarketScreen());
  }

  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> implements TopBarClickListener {
  late TextEditingController searchController;

  final marketItemsList = [
    WishListItemData(
      symbol: "BTC",
      company: "Bitcoin",
      price: "\$32,165.58",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBtc,
      isFavorite: true,
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
      isFavorite: true,
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
      isFavorite: true,
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

  final category = ["All", "Gainers", "Loser", "Favorite"];
  String selectedCategory = "All";

  late var filterCategoryList = [];

  List<WishListItemData> get filteredMarketItems {
    List<WishListItemData> list = marketItemsList;

    switch (selectedCategory) {
      case "Gainers":
        list = list.where((e) => e.isPositive).toList();
        break;

      case "Loser":
        list = list.where((e) => !e.isPositive).toList();
        break;

      case "Favorite":
        list = list.where((e) => e.isFavorite).toList();
        break;

      case "All":
      default:
        break;
    }

    if (searchController.text.isNotEmpty) {
      list = list
          .where(
            (e) => e.symbol.toLowerCase().contains(searchController.text.toLowerCase()),
          )
          .toList();
    }

    return list;
  }

  void onSubmitted(String value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    filterCategoryList = marketItemsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMarket,
            isShowMore: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 10.setHeight,
                left: 20.setWidth,
                right: 20.setWidth,
                bottom: 80.setHeight,
              ),
              child: Column(
                children: [
                  CommonTextFormField(
                    controller: searchController,
                    hintText: Languages.of(context).txtSearch,
                    prefixIcon: AppAssets.icSearch,
                    onTextChanged: (p0) => onSubmitted(p0),
                  ),
                  SizedBox(height: 15.setHeight),
                  horizontalList(),
                  SizedBox(height: 15.setHeight),
                  filteredMarketItems.isNotEmpty
                      ? Column(
                          children: filteredMarketItems
                              .map(
                                (item) => GestureDetector(
                                  onTap: () => Navigator.push(context, ExploreStockScreen.route(data: item)),
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
                              .toList())
                      : emptyListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontalList() {
    return Row(
      children: category.map(
        (e) {
          return Padding(
            padding: EdgeInsets.only(right: 12.setWidth),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = e;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 6.setHeight),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: selectedCategory == e ? CustomAppColor.of(context).primary : CustomAppColor.of(context).expertGraphBg,
                ),
                child: CommonText(
                  text: e,
                  textColor: selectedCategory == e ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget emptyListView() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50.setHeight),
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strMore) {}
  }
}
