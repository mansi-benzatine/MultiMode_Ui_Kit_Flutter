import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/top_bar/topbar.dart';

class MyWishlistScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyWishlistScreen());
  }

  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> implements TopBarClickListener {
  List<WishListItemData> wishListItemData = [
    WishListItemData(
      symbol: "GOOG",
      company: "Google Inc.",
      price: "\$131.58",
      percentage: "2.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icGoogle,
    ),
    WishListItemData(
      symbol: "AAPL",
      company: "Apple, Inc.",
      price: "\$206.20",
      percentage: "3.7%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icApple,
    ),
    WishListItemData(
      symbol: "TWTR",
      company: "Twitter, Inc.",
      price: "\$156.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icStockTwitter,
    ),
    WishListItemData(
      symbol: "META",
      company: "Meta Inc.",
      price: "\$156.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icStockMeta,
    ),
    WishListItemData(
      symbol: "NFLX",
      company: "Netflix Inc.",
      price: "\$156.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icStockNetflix,
    ),
    WishListItemData(
      symbol: "MCD",
      company: "McDonald's Corp.",
      price: "\$156.20",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.indigo,
      stockIcon: AppAssets.icStockMacdonald,
    ),
    WishListItemData(
      symbol: "MSFT",
      company: "Microsoft Corp.",
      price: "\$276.20",
      percentage: "1.9%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icStockMicrosoft,
    ),
    WishListItemData(
      symbol: "SPOT",
      company: "Spotify Inc.",
      price: "\$45.20",
      percentage: "1.2%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icStockSpotify,
    ),
    WishListItemData(
      symbol: "AWS",
      company: "Amazon Inc.",
      price: "\$126.20",
      percentage: "1.5%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icStockAmazon,
    ),
    WishListItemData(
      symbol: "ADB",
      company: "Adobe Inc.",
      price: "\$56.20",
      percentage: "1.8%",
      isPositive: true,
      color: Colors.purple,
      stockIcon: AppAssets.icStockAdobe,
    ),
    WishListItemData(
      symbol: "PYPL",
      company: "PayPal Inc.",
      price: "\$56.20",
      percentage: "1.8%",
      isPositive: true,
      color: Colors.purple,
      stockIcon: AppAssets.icStockPayPal,
    ),
    WishListItemData(
      symbol: "HST",
      company: "Hostar Inc.",
      price: "\$56.20",
      percentage: "1.8%",
      isPositive: true,
      color: Colors.purple,
      stockIcon: AppAssets.icStockDisney,
    ),
  ];

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
                title: Languages.of(context).txtMyWishlist,
                isShowBack: true,
                isShowSearch: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.setHeight,
                    horizontal: 16.setWidth,
                  ),
                  child: Wrap(
                    spacing: 16.setWidth,
                    runSpacing: 16.setHeight,
                    children: List.generate(
                      wishListItemData.length,
                      (index) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width - (16.setWidth * 3)) / 2,
                          child: WishListCard(
                            symbol: wishListItemData[index].symbol,
                            company: wishListItemData[index].company,
                            price: wishListItemData[index].price,
                            percentage: wishListItemData[index].percentage,
                            isPositive: wishListItemData[index].isPositive,
                            color: wishListItemData[index].color,
                            stockIcon: wishListItemData[index].stockIcon,
                          ),
                        );
                      },
                    ),
                  ),
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
}
