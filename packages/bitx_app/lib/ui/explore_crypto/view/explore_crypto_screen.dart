import 'package:bitx_app/dialogs/bottom_sheet/share_bottom_sheet.dart';
import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/buy/view/buy_screen.dart';
import 'package:bitx_app/ui/sell/view/sell_screen.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';
import '../datamodel/explore_crypto_data.dart';

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
  List<OrderModel> orders = [
    OrderModel("1,013", "15,195.85", "15,195.85", "1,013"),
    OrderModel("2,004", "15,195.06", "15,195.06", "2,004"),
    OrderModel("1,035", "15,195.78", "15,195.78", "1,035"),
    OrderModel("1,009", "15,195.85", "15,195.85", "1,009"),
    OrderModel("1,013", "15,195.06", "15,195.06", "1,013"),
    OrderModel("1,035", "15,195.30", "15,195.30", "2,004"),
    OrderModel("2,004", "15,195.85", "15,195.85", "1,009"),
    OrderModel("1,009", "15,195.85", "15,195.85", "1,013"),
    OrderModel("1,013", "15,195.00", "15,195.00", "1,035"),
    OrderModel("2,004", "15,195.06", "15,195.06", "2,004"),
    OrderModel("1,009", "15,195.85", "15,195.85", "1,009"),
    OrderModel("1,013", "15,195.06", "15,195.06", "1,013"),
    OrderModel("1,035", "15,195.68", "15,195.68", "1,035"),
    OrderModel("2,004", "15,195.77", "15,195.77", "1,009"),
    OrderModel("1,013", "15,195.85", "15,195.85", "1,013"),
    OrderModel("2,004", "15,195.00", "15,195.00", "1,013"),
    OrderModel("1,035", "15,195.78", "15,195.78", "1,009"),
    OrderModel("1,009", "15,195.78", "15,195.78", "1,013"),
    OrderModel("1,013", "15,195.39", "15,195.39", "1,013"),
    OrderModel("2,004", "15,195.06", "15,195.06", "1,035"),
  ];
  List<HistoryModel> history = [
    HistoryModel("17:29:55", "15,195.85", "1,013", true),
    HistoryModel("17:29:55", "15,195.06", "2,004", true),
    HistoryModel("17:29:56", "15,195.85", "1,009", false),
    HistoryModel("17:29:55", "15,195.78", "1,035", true),
    HistoryModel("17:29:55", "15,195.00", "1,013", false),
    HistoryModel("17:29:58", "15,195.06", "2,004", true),
    HistoryModel("17:29:45", "15,195.30", "1,035", true),
    HistoryModel("17:29:55", "15,195.85", "1,013", false),
    HistoryModel("17:29:48", "15,195.00", "1,013", false),
    HistoryModel("17:29:55", "15,195.09", "1,035", false),
    HistoryModel("17:29:50", "15,195.85", "2,004", true),
    HistoryModel("17:29:56", "15,195.78", "1,009", true),
    HistoryModel("17:30:55", "15,195.06", "1,013", true),
    HistoryModel("17:30:55", "15,195.00", "1,035", false),
    HistoryModel("17:30:55", "15,195.09", "1,009", false),
    HistoryModel("17:30:57", "15,195.30", "1,013", false),
    HistoryModel("17:30:57", "15,195.85", "1,035", true),
    HistoryModel("17:30:57", "15,195.06", "1,009", true),
    HistoryModel("17:30:58", "15,195.30", "1,013", true),
    HistoryModel("17:30:58", "15,195.06", "2,004", true),
    HistoryModel("17:30:58", "15,195.78", "1,035", false),
    HistoryModel("17:30:58", "15,195.00", "1,009", true),
  ];

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        setState(() {});
      },
    );
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
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              isShowShare: true,
              title: '',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: _stockDetailsView(),
                    ),
                    SizedBox(height: 15.setHeight),
                    CandleChartExample(
                      isCandleChart: _tabController.index == 0 ? true : false,
                    ),
                    SizedBox(height: 15.setHeight),
                    _tabbarView(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2.2,
                      ),
                      child: _tabView(),
                    ),
                  ],
                ),
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
                      buttonTextColor: CustomAppColor.of(context).txtBlack,
                      gradient: CustomAppColor.of(context).linearGradiant,
                      onTap: () => Navigator.push(context, SellScreen.route(data: widget.data)),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: CommonButton(
                      onTap: () => Navigator.push(context, BuyScreen.route(data: widget.data)),
                      text: Languages.of(context).txtBuy,
                    ),
                  )
                ],
              ),
            )
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
    if (name == Constant.strShare) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => const ShareBottomSheet(),
      );
    }
  }

  Widget _stockDetailsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          widget.data.stockIcon,
          width: 52.setWidth,
          height: 52.setHeight,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 12.setWidth),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  text: widget.data.symbol,
                  fontSize: 17.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 8.setWidth),
                CommonText(
                  text: widget.data.company,
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
            SizedBox(height: 3.setHeight),
            Row(
              children: [
                CommonText(
                  text: widget.data.price,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 8.setWidth),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      widget.data.isPositive ? AppAssets.icArrowUp : AppAssets.icArrowDown,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: widget.data.isPositive ? "+${widget.data.percentage}" : "-${widget.data.percentage}",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamily,
                      textColor: (widget.data.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              widget.data.isFavorite = !widget.data.isFavorite;
            });
          },
          icon: Icon(
            widget.data.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: widget.data.isFavorite ? CustomAppColor.of(context).red : null,
            size: 28,
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        CommonText(
          text: "Orders",
          textColor: _tabController.index == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
          fontWeight: _tabController.index == 0 ? FontWeight.w600 : FontWeight.w500,
          fontFamily: _tabController.index == 0 ? Constant.fontFamily : Constant.fontFamily,
        ),
        CommonText(
          text: "History",
          textColor: _tabController.index == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
          fontWeight: _tabController.index == 1 ? FontWeight.w600 : FontWeight.w500,
          fontFamily: _tabController.index == 1 ? Constant.fontFamily : Constant.fontFamily,
        ),
      ],
    );
  }

  Widget _tabView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        _ordersView(),
        _historyView(),
      ],
    );
  }

  Widget _historyView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: [
          SizedBox(height: 8.setHeight),
          _historyHeader(),
          SizedBox(height: 10.setHeight),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final item = history[index];
                return _historyRow(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: Languages.of(context).txtTime,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
        const Spacer(),
        SizedBox(width: 40.setWidth),
        CommonText(
          text: Languages.of(context).txtPrice,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
        const Spacer(),
        CommonText(
          text: Languages.of(context).txtQuantity,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _historyRow(HistoryModel item) {
    final isBuy = item.isBuy;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CommonText(
            text: item.time,
            fontSize: 12.setHeight,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          CommonText(
            text: item.price,
            textAlign: TextAlign.center,
            textColor: isBuy ? Colors.green : Colors.red,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          CommonText(
            text: item.qty,
            textAlign: TextAlign.right,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _ordersView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 12.setHeight),
          _orderHeader(),
          SizedBox(height: 8.setHeight),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final item = orders[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.setHeight),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: item.bid,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.setFontSize,
                                  ),
                                  CommonText(
                                    text: item.bidPrice,
                                    textColor: Colors.green,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final item = orders[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.setHeight),
                        child: Row(
                          children: [
                            CommonText(
                              text: item.askPrice,
                              textAlign: TextAlign.center,
                              textColor: Colors.red,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                            Expanded(
                              child: CommonText(
                                text: item.qty,
                                textAlign: TextAlign.right,
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderHeader() {
    return Row(
      children: [
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtBid,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 12.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtAsk,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class CandleChartExample extends StatefulWidget {
  final bool isCandleChart;

  const CandleChartExample({super.key, this.isCandleChart = true});

  @override
  State<CandleChartExample> createState() => _CandleChartExampleState();
}

class _CandleChartExampleState extends State<CandleChartExample> {
  String selectedRange = "1D";
  final List<String> ranges = ["1D", "1W", "1M", "3M", "6M", "1Y"];
  late List<ChartSampleData> _allData;
  late List<ChartSampleData> _visibleData;

  List<ChartSampleData> chartData = [
    ChartSampleData(x: DateTime(2025, 12, 01), open: 98.97, high: 101.19, low: 109.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 02), open: 191.97, high: 111.19, low: 101.36, close: 50.13),
    ChartSampleData(x: DateTime(2025, 12, 03), open: 155.97, high: 121.19, low: 100.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 04), open: 160.97, high: 191.19, low: 105.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 05), open: 98.97, high: 91.19, low: 85.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 06), open: 99.41, high: 101.46, low: 93.42, close: 101.42),
    ChartSampleData(x: DateTime(2025, 12, 07), open: 131.52, high: 101.53, low: 92.39, close: 97.34),
    ChartSampleData(x: DateTime(2025, 12, 08), open: 146.47, high: 160.33, low: 60.69, close: 94.02),
    ChartSampleData(x: DateTime(2025, 12, 09), open: 133.13, high: 150.35, low: 85.59, close: 93.99),
    ChartSampleData(x: DateTime(2025, 12, 10), open: 195.02, high: 240.89, low: 95.61, close: 120.04),
    ChartSampleData(x: DateTime(2025, 12, 11), open: 196.31, high: 220.0237, low: 93.32, close: 162.91),
    ChartSampleData(x: DateTime(2025, 12, 12), open: 175.86, high: 120.75, low: 96.65, close: 123.01),
    ChartSampleData(x: DateTime(2025, 12, 13), open: 200.39, high: 240.83, low: 50.15, close: 102.26),
    ChartSampleData(x: DateTime(2025, 12, 14), open: 169.5, high: 250.5, low: 20.5, close: 106.5),
    ChartSampleData(x: DateTime(2025, 12, 15), open: 98.97, high: 101.19, low: 109.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 16), open: 191.97, high: 111.19, low: 101.36, close: 50.13),
    ChartSampleData(x: DateTime(2025, 12, 17), open: 155.97, high: 121.19, low: 100.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 18), open: 160.97, high: 191.19, low: 105.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 19), open: 98.97, high: 91.19, low: 85.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 20), open: 99.41, high: 101.46, low: 93.42, close: 101.42),
    ChartSampleData(x: DateTime(2025, 12, 21), open: 131.52, high: 101.53, low: 92.39, close: 97.34),
    ChartSampleData(x: DateTime(2025, 12, 22), open: 146.47, high: 160.33, low: 60.69, close: 94.02),
    ChartSampleData(x: DateTime(2025, 12, 23), open: 133.13, high: 150.35, low: 85.59, close: 93.99),
    ChartSampleData(x: DateTime(2025, 12, 24), open: 195.02, high: 240.89, low: 95.61, close: 120.04),
    ChartSampleData(x: DateTime(2025, 12, 25), open: 196.31, high: 220.0237, low: 93.32, close: 162.91),
    ChartSampleData(x: DateTime(2025, 12, 26), open: 175.86, high: 120.75, low: 96.65, close: 123.01),
    ChartSampleData(x: DateTime(2025, 12, 27), open: 200.39, high: 240.83, low: 50.15, close: 102.26),
    ChartSampleData(x: DateTime(2025, 12, 28), open: 169.5, high: 250.5, low: 20.5, close: 106.5),
  ];
  List<ChartSampleData> lineData = [
    ChartSampleData(x: DateTime(2025, 12, 01), open: 98.97, high: 101.19, low: 109.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 02), open: 191.97, high: 111.19, low: 101.36, close: 50.13),
    ChartSampleData(x: DateTime(2025, 12, 03), open: 155.97, high: 121.19, low: 100.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 04), open: 160.97, high: 191.19, low: 105.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 05), open: 98.97, high: 91.19, low: 85.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 06), open: 99.41, high: 101.46, low: 93.42, close: 101.42),
    ChartSampleData(x: DateTime(2025, 12, 07), open: 131.52, high: 101.53, low: 92.39, close: 97.34),
    ChartSampleData(x: DateTime(2025, 12, 08), open: 146.47, high: 160.33, low: 60.69, close: 94.02),
    ChartSampleData(x: DateTime(2025, 12, 09), open: 133.13, high: 150.35, low: 85.59, close: 93.99),
    ChartSampleData(x: DateTime(2025, 12, 10), open: 195.02, high: 240.89, low: 95.61, close: 120.04),
    ChartSampleData(x: DateTime(2025, 12, 11), open: 196.31, high: 220.0237, low: 93.32, close: 162.91),
    ChartSampleData(x: DateTime(2025, 12, 12), open: 175.86, high: 120.75, low: 96.65, close: 123.01),
    ChartSampleData(x: DateTime(2025, 12, 13), open: 200.39, high: 240.83, low: 50.15, close: 102.26),
    ChartSampleData(x: DateTime(2025, 12, 14), open: 169.5, high: 250.5, low: 20.5, close: 106.5),
    ChartSampleData(x: DateTime(2025, 12, 15), open: 98.97, high: 101.19, low: 109.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 16), open: 191.97, high: 111.19, low: 101.36, close: 50.13),
    ChartSampleData(x: DateTime(2025, 12, 17), open: 155.97, high: 121.19, low: 100.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 18), open: 160.97, high: 191.19, low: 105.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 19), open: 98.97, high: 91.19, low: 85.36, close: 97.13),
    ChartSampleData(x: DateTime(2025, 12, 20), open: 99.41, high: 101.46, low: 93.42, close: 101.42),
    ChartSampleData(x: DateTime(2025, 12, 21), open: 131.52, high: 101.53, low: 92.39, close: 97.34),
    ChartSampleData(x: DateTime(2025, 12, 22), open: 146.47, high: 160.33, low: 60.69, close: 94.02),
    ChartSampleData(x: DateTime(2025, 12, 23), open: 133.13, high: 150.35, low: 85.59, close: 93.99),
    ChartSampleData(x: DateTime(2025, 12, 24), open: 195.02, high: 240.89, low: 95.61, close: 120.04),
    ChartSampleData(x: DateTime(2025, 12, 25), open: 196.31, high: 220.0237, low: 93.32, close: 162.91),
    ChartSampleData(x: DateTime(2025, 12, 26), open: 175.86, high: 120.75, low: 96.65, close: 123.01),
    ChartSampleData(x: DateTime(2025, 12, 27), open: 200.39, high: 240.83, low: 50.15, close: 102.26),
    ChartSampleData(x: DateTime(2025, 12, 28), open: 169.5, high: 250.5, low: 20.5, close: 106.5),
  ];

  @override
  void initState() {
    super.initState();
    _allData = widget.isCandleChart ? chartData : lineData;
    _applyRange("1W");
  }

  void _applyRange(String range) {
    final DateTime now = _allData.last.x;

    DateTime from;

    switch (range) {
      case "1D":
        from = now.subtract(const Duration(days: 1));
        break;
      case "1W":
        from = now.subtract(const Duration(days: 7));
        break;
      case "1M":
        from = DateTime(now.year, now.month - 1, now.day);
        break;
      case "3M":
        from = DateTime(now.year, now.month - 3, now.day);
        break;
      case "6M":
        from = DateTime(now.year, now.month - 6, now.day);
        break;
      case "1Y":
        from = DateTime(now.year - 1, now.month, now.day);
        break;
      default:
        from = _allData.first.x;
    }

    setState(() {
      selectedRange = range;
      _visibleData = _allData.where((e) => e.x.isAfter(from)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ranges.map((r) {
                final isSelected = r == selectedRange;
                return GestureDetector(
                  onTap: () => _applyRange(r),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 8.setHeight),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).bgCard,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      r,
                      style: TextStyle(
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtGray,
                        package: "bitx_app",
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 15.setHeight),
          widget.isCandleChart
              ? SizedBox(
                  height: 0.screenHeight / 3,
                  width: 0.screenWidth,
                  child: SfCartesianChart(
                    backgroundColor: CustomAppColor.of(context).bgScreen,
                    tooltipBehavior: TooltipBehavior(enable: true),
                    primaryXAxis: DateTimeAxis(
                      minimum: _visibleData.first.x,
                      maximum: _visibleData.last.x,
                      intervalType: DateTimeIntervalType.days,
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: const NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    series: [
                      CandleSeries<ChartSampleData, DateTime>(
                        dataSource: _visibleData,
                        xValueMapper: (d, _) => d.x,
                        openValueMapper: (d, _) => d.open,
                        highValueMapper: (d, _) => d.high,
                        lowValueMapper: (d, _) => d.low,
                        closeValueMapper: (d, _) => d.close,
                        bullColor: CustomAppColor.of(context).red,
                        bearColor: CustomAppColor.of(context).primary,
                        borderRadius: BorderRadius.circular(3),
                      )
                    ],
                  ),
                )
              : _lineChart(context),
        ],
      ),
    );
  }

  Widget _lineChart(BuildContext context) {
    return SizedBox(
      height: 0.screenHeight / 3,
      width: double.infinity,
      child: SfCartesianChart(
        key: const ValueKey("line"),
        primaryXAxis: const DateTimeAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        series: [
          LineSeries<ChartSampleData, DateTime>(
            dataSource: lineData,
            xValueMapper: (d, _) => d.x,
            yValueMapper: (d, _) => d.close,
            color: CustomAppColor.of(context).red,
            width: 2,
          ),
        ],
      ),
    );
  }
}
