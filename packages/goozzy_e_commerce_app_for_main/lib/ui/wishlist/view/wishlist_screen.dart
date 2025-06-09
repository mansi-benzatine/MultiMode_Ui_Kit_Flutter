import 'package:flutter/material.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/search/view/search_screen.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../widgets/product/product_card.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../home_screen/datamodel/home_screen_data.dart';
import '../../view_inner_product/view/view_inner_product_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WishlistScreen());
  }

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              isShowSearchField: true,
              textColor: CustomAppColor.of(context).txtBlack,
              isShowTitle: true,
              title: Languages.of(context).wishlist,
              topBarColor: CustomAppColor.of(context).txtWhite,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductsDetail(
                      onTap: () => Navigator.push(context, ViewInnerProductScreen.route()),
                      productsList: wishList,
                      isShowMrp: true,
                      isFilledFavouriteVisible: true,
                      isShowTrusted: true,
                      isRatingShown: false,
                      btnText: Languages.of(context).buyNow,
                    ),
                    ProductsDetail(
                      onTap: () => Navigator.push(context, ViewInnerProductScreen.route()),
                      productsList: wishList2,
                      isShowMrp: true,
                      isFilledFavouriteVisible: true,
                      isShowTrusted: true,
                      isRatingShown: false,
                      btnText: Languages.of(context).buyNow,
                      isImageBorderVisible: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(context);
    }
    if (name == AppStrings.search) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
