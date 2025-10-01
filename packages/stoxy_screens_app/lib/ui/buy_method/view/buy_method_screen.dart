import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_screens_app_package/ui/preview_buy/view/preview_buy_screen.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/widgets/text/common_text.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../explore_stock/datamodel/explore_stock_data.dart';

class BuyMethodScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => BuyMethodScreen(data: data));
  }

  const BuyMethodScreen({super.key, required this.data});

  @override
  State<BuyMethodScreen> createState() => _BuyMethodScreenState();
}

class _BuyMethodScreenState extends State<BuyMethodScreen> implements TopBarClickListener {
  List<NFLXMarketData> marketOrderList = [];
  List<NFLXMarketData> conditionalOrderList = [];

  void _fillData() {
    marketOrderList = [
      NFLXMarketData(
        iconPath: AppAssets.icEarning,
        details: "Buy In Dollar",
        data: "Buy NFLX with minimum transaction value of \$1.",
      ),
      NFLXMarketData(
        iconPath: AppAssets.icFillCandle,
        details: "Buy In Shares",
        data: "Buy NFLX with minimum 0.00000001 shares.",
      )
    ];
    conditionalOrderList = [
      NFLXMarketData(
        iconPath: AppAssets.icFillFilter,
        details: "Limit Order",
        data: "Buy NFLX as a minimum price or lower,minimum \$1 share",
      ),
      NFLXMarketData(
        iconPath: AppAssets.icBottomSwap,
        details: "Buy In Shares",
        data: "Buy NFLX if rises to a fixed stop price, minimum 1 share",
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
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
              title: Languages.of(context).txtBuy,
              isShowBack: true,
              isShowMore: true,
            ),
            Column(
              children: [
                _stockDetailsView(),
                SizedBox(height: 15.setHeight),
                _marketOrderListView(),
                SizedBox(height: 15.setHeight),
                _conditionalOrderListView(),
              ],
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
  }

  Widget _stockDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 17.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
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
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Market Price",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: widget.data.price,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _marketOrderListView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Market Order",
            fontWeight: FontWeight.w600,
            fontSize: 17.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          Column(
            children: List.generate(
              marketOrderList.length,
              (index) {
                final data = marketOrderList[index];
                return IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, PreviewBuyScreen.route(data: widget.data)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: CustomAppColor.of(context).bgCard, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: CustomAppColor.of(context).dialogBg, shape: BoxShape.circle),
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                data.iconPath,
                                height: 24.setHeight,
                                width: 24.setWidth,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: data.details,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.setFontSize,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                  SizedBox(height: 5.setHeight),
                                  CommonText(
                                    text: data.data,
                                    fontSize: 12.setFontSize,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.setWidth),
                              child: Transform.rotate(
                                angle: -math.pi / 5.0,
                                child: const Icon(Icons.arrow_forward_rounded),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _conditionalOrderListView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Conditional Order",
            fontWeight: FontWeight.w600,
            fontSize: 17.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          Column(
            children: List.generate(
              conditionalOrderList.length,
              (index) {
                final data = conditionalOrderList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: CustomAppColor.of(context).bgCard, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: CustomAppColor.of(context).dialogBg, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            data.iconPath,
                            height: 24.setHeight,
                            width: 24.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: data.details,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                              SizedBox(height: 5.setHeight),
                              CommonText(
                                text: data.data,
                                fontSize: 12.setFontSize,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textColor: CustomAppColor.of(context).txtGray,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.setWidth),
                          child: Transform.rotate(
                            angle: -math.pi / 5.0,
                            child: const Icon(Icons.arrow_forward_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
