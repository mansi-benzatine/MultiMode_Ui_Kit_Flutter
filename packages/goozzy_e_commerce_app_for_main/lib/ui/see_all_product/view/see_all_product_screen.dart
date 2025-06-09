import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/cart/views/cart_screen.dart';
import '../../../../../../ui/search/view/search_screen.dart';
import '../../../../../../ui/see_all_product/datamodel/see_all_product_data.dart';
import '../../../../../../ui/wishlist/view/wishlist_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../widgets/filter_action/filter_action.dart';
import '../../../widgets/product/product_card.dart';
import '../../view_product/view/view_product_screen.dart';

class SeeAllProductScreen extends StatefulWidget {
  const SeeAllProductScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SeeAllProductScreen());
  }

  @override
  State<SeeAllProductScreen> createState() => _SeeAllProductScreenState();
}

class _SeeAllProductScreenState extends State<SeeAllProductScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: "${AppStrings.shirt}s",
              textColor: CustomAppColor.of(context).txtBlack,
              isShowSearchField: true,
              isShowLike: true,
              isShowCart: true,
              topBarColor: CustomAppColor.of(context).txtWhite,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2), horizontal: AppSizes.setWidth(22)),
                      color: CustomAppColor.of(context).bgScaffold,
                      height: AppSizes.setHeight(49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: Languages.of(context).notificationFromThisCollection,
                            fontSize: AppSizes.setFontSize(15),
                            fontWeight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            value: true,
                            onToggle: (bool newValue) {},
                            activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
                            inactiveColor: CustomAppColor.of(context).txtGrey,
                            activeToggleColor: CustomAppColor.of(context).icPurple,
                            inactiveToggleColor: CustomAppColor.of(context).white,
                            width: AppSizes.setWidth(38),
                            height: AppSizes.setHeight(20),
                            toggleSize: 22.0,
                            borderRadius: 16.0,
                            padding: 0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: CommonActionWidget.action(
                        context,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                      child: specialOfferCard(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
                      child: summerSaleCard(context),
                    ),
                    ProductsDetail(
                      onTap: () => Navigator.push(context, ViewProductScreen.route()),
                      productsList: categoryProductsList,
                      btnText: Languages.of(context).viewProduct,
                      isFavouriteVisible: true,
                      imageWidth: AppSizes.setWidth(60),
                      isImageBorderVisible: true,
                      isDownloadVisible: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget specialOfferCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: AppSizes.setHeight(22)),
      height: AppSizes.setHeight(168),
      width: AppSizes.setWidth(442),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(20)),
            child: CommonText(
              text: Languages.of(context).specialOffer,
              fontWeight: FontWeight.w800,
              fontSize: AppSizes.setFontSize(16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
              itemCount: offerList.length,
              itemBuilder: (context, index) {
                final offer = offerList[index];
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.setHeight(20),
                        horizontal: AppSizes.setWidth(18),
                      ),
                      width: AppSizes.setWidth(202),
                      height: AppSizes.setHeight(94),
                      decoration: BoxDecoration(
                        color: offer.cardColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items horizontally
                          crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center, // Center items vertically in the column
                              crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start horizontally
                              children: [
                                CommonText(
                                  text: offer.title,
                                  textColor: CustomAppColor.of(context).txtWhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSizes.setFontSize(18),
                                ),
                                CommonText(
                                  text: offer.subTitle,
                                  textColor: CustomAppColor.of(context).txtWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppSizes.setFontSize(12),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppSizes.setHeight(12),
                                horizontal: AppSizes.setWidth(12),
                              ),
                              width: AppSizes.setWidth(47),
                              height: AppSizes.setHeight(47),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).black.withOpacityPercent(0.2),
                              ),
                              child: Image.asset(
                                offer.imagePath,
                                height: AppSizes.setHeight(36),
                                width: AppSizes.setWidth(24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget summerSaleCard(BuildContext context) {
    return Container(
      height: AppSizes.setHeight(231),
      width: AppSizes.setWidth(375),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(14)),
              child: CommonText(
                text: Languages.of(context).summerSale,
                fontWeight: FontWeight.w800,
                fontSize: AppSizes.setFontSize(16),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(2)),
            width: AppSizes.setWidth(335),
            height: AppSizes.setHeight(153),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                AppAssets.imgSummerSale,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
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
    if (name == AppStrings.wishlist) {
      Navigator.push(context, WishlistScreen.route());
    }
    if (name == AppStrings.cart) {
      Navigator.push(context, CartScreen.route());
    }
  }
}
