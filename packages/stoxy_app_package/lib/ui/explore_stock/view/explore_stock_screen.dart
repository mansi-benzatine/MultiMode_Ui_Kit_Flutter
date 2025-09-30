import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stoxy_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/ui/buy/view/buy_screen.dart';
import 'package:stoxy_app_package/ui/explore_stock/datamodel/explore_stock_data.dart';
import 'package:stoxy_app_package/ui/my_portfolio/view/my_portfolio_screen.dart';
import 'package:stoxy_app_package/ui/sell/view/sell_screen.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/utils/utils.dart';
import 'package:stoxy_app_package/widgets/button/common_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';

class ExploreStockScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => ExploreStockScreen(data: data));
  }

  const ExploreStockScreen({super.key, required this.data});

  @override
  State<ExploreStockScreen> createState() => _ExploreStockScreenState();
}

class _ExploreStockScreenState extends State<ExploreStockScreen> with SingleTickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<NFLXMarketData> nflxMarketList = [];
  List<NewsData> newsList = [];
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

  bool showCandleChart = false;

  void _fillData() {
    nflxMarketList = [
      NFLXMarketData(iconPath: AppAssets.icMarketCap, details: "Market Cap", data: "\$15.87B"),
      NFLXMarketData(iconPath: AppAssets.icEarning, details: "Price Earning Ratio"),
      NFLXMarketData(iconPath: AppAssets.icHigh, details: "1 Year High", data: "\$284.42"),
      NFLXMarketData(iconPath: AppAssets.icLow, details: "1 Year Low", data: "\$72.06"),
    ];

    newsList = [
      NewsData(iconPath: AppAssets.imgNew1, details: "Stock Analysis Mobile Application", data: "Latest Mobile Application For Stock Market"),
      NewsData(iconPath: AppAssets.imgNew2, details: "Trending High \nStocks", data: "Latest Trending High Stocks In Stock Market"),
    ];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () {
        setState(() {});
      },
    );
    _fillData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                isShowBack: true,
                isShowShare: true,
                title: '',
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                            child: _stockDetailsView(),
                          ),
                          showCandleChart ? const CandleChartExample() : graphView(),
                          SizedBox(height: 15.setHeight),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                            child: _expertSaysView(),
                          ),
                          SizedBox(height: 20.setHeight),
                          _tabbarView(),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height,
                            ),
                            child: _tabView(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.setWidth,
                  bottom: 10.setHeight,
                  right: 20.setWidth,
                  top: 5.setHeight,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        text: Languages.of(context).txtSell,
                        buttonColor: CustomAppColor.of(context).expertGraphBg,
                        buttonTextColor: CustomAppColor.of(context).txtDarkGray,
                        borderColor: CustomAppColor.of(context).borderTextFormFeild,
                        gradient: null,
                        onTap: () => Navigator.push(context, SellScreen.route(data: widget.data)),
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: CommonButton(
                        onTap: () => Navigator.push(context, BuyScreen.route(data: widget.data)),
                        text: Languages.of(context).txtBuy,
                        gradient: CustomAppColor.of(context).primaryGradient,
                        buttonColor: CustomAppColor.of(context).white,
                        borderColor: CustomAppColor.of(context).borderTextFormFeild,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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

  Widget _expertSaysView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "What Experts Says",
          fontSize: 17.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 15.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
          child: Wrap(
            spacing: 12.setWidth,
            runSpacing: 14.setHeight,
            children: [
              _buildGaugeCard("Buy", 75, "\$138.25", Icons.shopping_cart),
              _buildGaugeCard("Sell", 50, "\$749 (0.10%)", Icons.sell),
              _buildGaugeCard("Spot", 40, "\$374.75", Icons.wifi_tethering),
              _buildGaugeCard("Hold", 90, "\$749 (10%)", Icons.savings),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildGaugeCard(String title, double value, String subtitle, IconData icon) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 72) / 2,
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: title,
              fontSize: 14,
              fontFamily: Constant.fontFamilyMedium,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 96.setHeight,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 120,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 160,
                    endAngle: 380,
                    ticksPosition: ElementsPosition.outside,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.15,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.bothCurve,
                      color: CustomAppColor.of(context).expertGraphBg,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: value,
                        width: 0.15,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                        color: CustomAppColor.of(context).primary,
                      ),
                      MarkerPointer(
                        value: value,
                        markerHeight: 10.setHeight,
                        markerWidth: 10.setWidth,
                        enableDragging: true,
                        overlayRadius: 12,
                        borderColor: CustomAppColor.of(context).white,
                        borderWidth: 2,
                        color: CustomAppColor.of(context).primary2,
                        markerType: MarkerType.circle,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        positionFactor: 0,
                        angle: 0,
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 25.setHeight),
                            Icon(icon, size: 18, color: CustomAppColor.of(context).txtBlack),
                            SizedBox(height: 8.setHeight),
                            CommonText(
                              text: "${value.toInt()}%",
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 8.setHeight),
                            CommonText(
                              text: subtitle,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtDescriptionGray,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stockDetailsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              widget.data.stockIcon,
              width: 48.setWidth,
              height: 48.setHeight,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: widget.data.symbol,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 4.setHeight),
                  CommonText(
                    text: widget.data.company,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
            ChartToggleSwitch(
              showCandleChart: showCandleChart,
              onToggle: () {
                setState(() {
                  showCandleChart = !showCandleChart;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 12.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: widget.data.price,
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
                    color: widget.data.isPositive ? CustomAppColor.of(context).green.withOpacityPercent(0.1) : CustomAppColor.of(context).red.withOpacityPercent(0.1),
                    borderRadius: BorderRadius.circular(1000.setWidth),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        !widget.data.isPositive ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
                        color: widget.data.isPositive ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                      ),
                      CommonText(
                        text: widget.data.percentage,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constant.fontFamilyMedium,
                        textColor: (widget.data.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 7.setWidth),
                CommonText(
                  text: "\$9.13 Today",
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
    );
  }

  Widget _tabbarView() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3, color: CustomAppColor.of(context).primary),
        insets: EdgeInsets.symmetric(horizontal: 0.setWidth),
      ),
      labelPadding: EdgeInsets.symmetric(vertical: 10.setHeight),
      padding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        CommonText(
          text: "Overview",
          textColor: _tabController.index == 0 ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
          fontWeight: _tabController.index == 0 ? FontWeight.w600 : FontWeight.w500,
          fontFamily: _tabController.index == 0 ? Constant.fontFamily : Constant.fontFamilyMedium,
        ),
        CommonText(
          text: "NFLX Market",
          textColor: _tabController.index == 1 ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
          fontWeight: _tabController.index == 1 ? FontWeight.w600 : FontWeight.w500,
          fontFamily: _tabController.index == 1 ? Constant.fontFamily : Constant.fontFamilyMedium,
        ),
        CommonText(
          text: "News",
          textColor: _tabController.index == 2 ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
          fontWeight: _tabController.index == 2 ? FontWeight.w600 : FontWeight.w500,
          fontFamily: _tabController.index == 2 ? Constant.fontFamily : Constant.fontFamilyMedium,
        ),
      ],
    );
  }

  Widget _tabView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        _overviewTabView(),
        _nflxMarketTabView(),
        _newsTabView(),
      ],
    );
  }

  Widget _overviewTabView() {
    return Padding(
      padding: EdgeInsets.only(top: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry. Lorem Ipsum is simply dummy text of the  and typesetting industry. Lorem Ipsum has been the industry. Lorem Ipsum is simply dummy text of the printing and type industry. Lorem Ipsum has been the industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n Lorem Ipsum has been the industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.Lorem Ipsum is simply dummy text of the printing and  industry. Lorem Ipsum has been the industry. Lorem Ipsu /is simply dummy text of the printing and typesetting industry",
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20.setHeight),
                CommonText(
                  text: "Risk",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "Spot has 27% more risk then the market as a hole.",
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.setHeight),
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: CustomAppColor.of(context).bgCard,
          ),
          stocksView(),
        ],
      ),
    );
  }

  Widget _nflxMarketTabView() {
    return Column(
      children: [
        ListView.separated(
          itemCount: nflxMarketList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 18.setHeight),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const Divider(thickness: 0.5);
          },
          itemBuilder: (context, index) {
            final data = nflxMarketList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.setHeight, horizontal: 20.setWidth),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).primaryLight,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(15.setWidth),
                          child: Image.asset(
                            data.iconPath,
                            width: 20.setHeight,
                            height: 20.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(width: 15.setWidth),
                        CommonText(
                          text: data.details,
                          fontSize: 15.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                  CommonText(
                    text: data.data,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(height: 10.setHeight),
        stocksView(),
      ],
    );
  }

  Widget _newsTabView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.setWidth,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 20.setHeight),
            separatorBuilder: (context, index) {
              return const Divider(thickness: 0.5);
            },
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final data = newsList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Image.asset(
                        data.iconPath,
                        width: 87.setHeight,
                        height: 87.setHeight,
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: data.details,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            fontSize: 16.setFontSize,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: data.data,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            fontSize: 14.setFontSize,
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.setHeight),
        Divider(
          thickness: 5,
          color: CustomAppColor.of(context).bgCard,
        ),
        stocksView(),
      ],
    );
  }

  Widget stocksView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtMoreStockLikeThis,
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
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MyPortfolioScreen.route()),
              child: Container(
                width: 80.setWidth,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: CustomAppColor.of(context).bgCard,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonText(
                      fontSize: 11.setFontSize,
                      text: Languages.of(context).txtSeeAll,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(width: 6.setWidth),
                    Image.asset(
                      AppAssets.icArrowRight,
                      height: 12.setHeight,
                      width: 10.setWidth,
                      color: CustomAppColor.of(context).txtBlack,
                    )
                  ],
                ),
              ),
            ),
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
          height: 200.setHeight,
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
                      barWidth: 1.5,
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
                          /*     String time = _getTimeFromSpot(touchedSpot.x);*/
                          double price = _getPriceFromY(touchedSpot.y);

                          return LineTooltipItem(
                            '',
                            TextStyle(
                              color: CustomAppColor.of(context).txtBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilyMedium,
                              package: "stoxy_app_package",
                            ),
                            children: [
                              TextSpan(
                                text: '$day\n',
                                style: TextStyle(
                                  color: CustomAppColor.of(context).txtBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium,
                                  package: "stoxy_app_package",
                                ),
                              ),
                              TextSpan(
                                text: '\$${price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.8),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.setFontSize,
                                  fontFamily: Constant.fontFamily,
                                  package: "stoxy_app_package",
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
                    fontSize: 11.setFontSize,
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

/*  String _getTimeFromSpot(double x) {
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

class CandleChartExample extends StatefulWidget {
  const CandleChartExample({super.key});

  @override
  State<CandleChartExample> createState() => _CandleChartExampleState();
}

class _CandleChartExampleState extends State<CandleChartExample> {
  late List<CandleData> candles;
  String selectedRange = "1D";
  final List<String> ranges = ["1D", "1W", "1M", "3M", "6M", "1Y"];

  @override
  void initState() {
    super.initState();

    candles = [
      CandleData(timestamp: DateTime(2023, 1, 1).millisecondsSinceEpoch, open: 100, high: 120, low: 95, close: 115, volume: 5000),
      CandleData(timestamp: DateTime(2023, 1, 2).millisecondsSinceEpoch, open: 105, high: 130, low: 100, close: 125, volume: 3000),
      CandleData(timestamp: DateTime(2023, 1, 3).millisecondsSinceEpoch, open: 115, high: 125, low: 110, close: 112, volume: 2500),
      CandleData(timestamp: DateTime(2023, 1, 4).millisecondsSinceEpoch, open: 112, high: 118, low: 108, close: 116, volume: 2100),
      CandleData(timestamp: DateTime(2023, 1, 5).millisecondsSinceEpoch, open: 116, high: 130, low: 114, close: 125, volume: 2600),
      CandleData(timestamp: DateTime(2023, 1, 6).millisecondsSinceEpoch, open: 100, high: 110, low: 95, close: 105, volume: 2000),
      CandleData(timestamp: DateTime(2023, 1, 7).millisecondsSinceEpoch, open: 105, high: 120, low: 100, close: 115, volume: 3000),
      CandleData(timestamp: DateTime(2023, 1, 8).millisecondsSinceEpoch, open: 115, high: 125, low: 110, close: 112, volume: 2500),
      CandleData(timestamp: DateTime(2023, 1, 9).millisecondsSinceEpoch, open: 112, high: 118, low: 108, close: 116, volume: 2100),
      CandleData(timestamp: DateTime(2023, 1, 10).millisecondsSinceEpoch, open: 116, high: 130, low: 114, close: 125, volume: 2600),
      CandleData(timestamp: DateTime(2023, 1, 11).millisecondsSinceEpoch, open: 105, high: 120, low: 100, close: 115, volume: 3000),
      CandleData(timestamp: DateTime(2023, 1, 12).millisecondsSinceEpoch, open: 115, high: 125, low: 110, close: 112, volume: 2500),
      CandleData(timestamp: DateTime(2023, 1, 13).millisecondsSinceEpoch, open: 112, high: 118, low: 108, close: 116, volume: 2100),
      CandleData(timestamp: DateTime(2023, 1, 14).millisecondsSinceEpoch, open: 116, high: 130, low: 114, close: 125, volume: 2600),
      CandleData(timestamp: DateTime(2023, 1, 15).millisecondsSinceEpoch, open: 112, high: 118, low: 108, close: 116, volume: 2100),
      CandleData(timestamp: DateTime(2023, 1, 16).millisecondsSinceEpoch, open: 116, high: 130, low: 114, close: 125, volume: 2600),
      CandleData(timestamp: DateTime(2023, 1, 17).millisecondsSinceEpoch, open: 100, high: 110, low: 95, close: 105, volume: 2000),
      CandleData(timestamp: DateTime(2023, 1, 18).millisecondsSinceEpoch, open: 105, high: 120, low: 100, close: 115, volume: 3000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
      child: Column(
        children: [
          SizedBox(height: 18.setHeight),
          SizedBox(
            height: 220.setHeight,
            child: InteractiveChart(
              candles: candles,
              style: ChartStyle(
                priceGridLineColor: CustomAppColor.of(context).bgCard,
                priceGainColor: CustomAppColor.of(context).primary,
                priceLossColor: CustomAppColor.of(context).greyIndicator,
                volumeColor: CustomAppColor.of(context).primary.withValues(alpha: 0.8),
                priceLabelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  package: "stoxy_app_package",
                  fontFamily: Constant.fontFamily,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                ),
                volumeHeightFactor: 0.3,
                timeLabelStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  package: "stoxy_app_package",
                  fontFamily: Constant.fontFamily,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ranges.map((r) {
                final isSelected = r == selectedRange;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedRange = r);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 8.setHeight),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).bgCard,
                      shape: BoxShape.circle,
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
      ),
    );
  }
}

class ChartToggleSwitch extends StatelessWidget {
  final bool showCandleChart;
  final VoidCallback onToggle;

  const ChartToggleSwitch({
    super.key,
    required this.showCandleChart,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 6.setWidth),
        width: 80.setWidth,
        height: 40.setHeight,
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              alignment: !showCandleChart ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).transparent,
                ),
                padding: const EdgeInsets.all(7),
                child: Image.asset(
                  !showCandleChart ? AppAssets.icCandleChart : AppAssets.icDottedChart,
                  color: CustomAppColor.of(context).txtGray,
                  width: 18.setWidth,
                  height: 18.setHeight,
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              alignment: showCandleChart ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [CustomAppColor.of(context).primary2, CustomAppColor.of(context).primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(9),
                child: Image.asset(
                  showCandleChart ? AppAssets.icCandleChart : AppAssets.icDottedChart,
                  color: Colors.white,
                  width: 15.setWidth,
                  height: 15.setHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
