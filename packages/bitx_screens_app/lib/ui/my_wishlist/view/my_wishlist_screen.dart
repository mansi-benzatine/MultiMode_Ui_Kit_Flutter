import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/top_bar/topbar.dart';

class MyWishlistScreen extends StatefulWidget {
  final bool forEmptyScreen;

  const MyWishlistScreen({super.key, this.forEmptyScreen = false});

  static Route<void> route({bool forEmptyScreen = false}) {
    return MaterialPageRoute(
      builder: (context) => MyWishlistScreen(forEmptyScreen: forEmptyScreen),
    );
  }

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> implements TopBarClickListener {
  List<WishListItemData> wishListItemData = [
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
      symbol: "VIA",
      company: "Viacoin",
      price: "\$25,185.20",
      percentage: "0.35%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "ETH",
      company: "Ethereum",
      price: "\$44,130.20",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icBtEth,
    ),
    WishListItemData(
      symbol: "LTC",
      company: "Litecoin",
      price: "\$25,165.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icBtItc,
    ),
    WishListItemData(
      symbol: "Dash",
      company: "Dash",
      price: "\$18,135.20",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.indigo,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "BNB",
      company: "Binance Coin",
      price: "\$32,139.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icBtBnb,
    ),
    WishListItemData(
      symbol: "USDT",
      company: "Tether",
      price: "\$27,652.20",
      percentage: "2.9%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtUsdt,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtMarketMovers,
              isShowBack: true,
              isShowSearch: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(right: 20.setWidth),
                child: Wrap(
                  spacing: 5.setWidth,
                  runSpacing: 20.setHeight,
                  children: List.generate(
                    wishListItemData.length,
                    (index) {
                      return WishListCard(
                        symbol: wishListItemData[index].symbol,
                        company: wishListItemData[index].company,
                        price: wishListItemData[index].price,
                        percentage: wishListItemData[index].percentage,
                        isPositive: wishListItemData[index].isPositive,
                        color: wishListItemData[index].color,
                        stockIcon: wishListItemData[index].stockIcon,
                      );
                    },
                  ),
                ),
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
  }
}
