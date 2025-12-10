import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/home/datamodel/home_data.dart';
import 'package:grokit_screens_app/ui/search/views/search_screen.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class FavoriteScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FavoriteScreen());
  }

  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> implements TopBarClickListener {
  List<ItemsData> favoriteList = [];

  void _fillData() {
    favoriteList = [
      ItemsData(
        itemName: "Berry Smoothie",
        itemImage: AppAssets.imgJuice,
        itemWeight: "250ml",
        itemDiscountPrice: 18,
        itemOriginalPrice: 23,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Mojito ",
        itemImage: AppAssets.imgJuice1,
        itemWeight: "250ml",
        itemDiscountPrice: 22,
        itemOriginalPrice: 39,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Atta",
        itemImage: AppAssets.imgKitchen,
        itemWeight: "200gm",
        itemDiscountPrice: 45,
        itemOriginalPrice: 58,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Caf's Mixer",
        itemImage: AppAssets.imgKitchen1,
        itemWeight: "500gm",
        itemDiscountPrice: 120,
        itemOriginalPrice: 150,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Amul Cheese Slices",
        itemImage: AppAssets.imgDairy,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgDairy1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Lays Cream & Onion Chips",
        itemImage: AppAssets.imgSnack1,
        itemWeight: "48gm",
        itemDiscountPrice: 20,
        itemOriginalPrice: 24,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Onion Kodubale",
        itemImage: AppAssets.imgSnack,
        itemWeight: "500gm",
        itemDiscountPrice: 99,
        itemOriginalPrice: 104,
        itemDiscount: 20,
        isFavourite: true,
      ),
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        isFavourite: true,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isFavourite: true,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtFavorite,
            isShowSearch: true,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _itemCardView(items: favoriteList),
            ),
          )
        ],
      ),
    );
  }

  _itemCardView({required List<ItemsData> items}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      child: Wrap(
        spacing: 11.setWidth,
        runSpacing: 11.setHeight,
        children: items.map((item) {
          return GestureDetector(
            // onTap: () => Navigator.push(context, ItemDetailsScreen.route()),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 10 * 2 - 40) / 2,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        color: CustomAppColor.of(context).itemCardBorder,
                        width: 0.5,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).unselectedCard,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                item.itemImage,
                                height: 138.setHeight,
                                width: 138.setWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 10.setWidth,
                              top: 8.setHeight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.isFavourite = !item.isFavourite;
                                  });
                                },
                                child: Icon(
                                  item.isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                  size: 20,
                                  color: item.isFavourite ? Colors.red : CustomAppColor.of(context).txtGray,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CommonText(
                                text: item.itemName,
                                textAlign: TextAlign.start,
                                fontSize: 14.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).txtBlack,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 2.setWidth),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.setHeight),
                              child: CommonText(
                                text: item.itemWeight,
                                fontSize: 10.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: const Color(0xFF2B70E8),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "\$${item.itemDiscountPrice.toStringAsFixed(0)}",
                              textAlign: TextAlign.start,
                              fontSize: 16.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                            SizedBox(width: 5.setWidth),
                            Row(
                              children: [
                                CommonText(
                                  text: "MRP \$",
                                  fontSize: 12.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                                CommonText(
                                  text: item.itemOriginalPrice.toStringAsFixed(0),
                                  fontSize: 12.setFontSize,
                                  textDecoration: TextDecoration.lineThrough,
                                  fontFamily: Constant.fontFamilyMedium500,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.setHeight),
                        if (!item.isAddedToCart)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item.isAddedToCart = true;
                                item.cartCount = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: CustomAppColor.of(context).borderOtp),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 18.setWidth),
                              child: CommonText(
                                text: "Add To Cart",
                                fontSize: 12.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                                textColor: CustomAppColor.of(context).txtPrimary,
                              ),
                            ),
                          ),
                        if (item.isAddedToCart)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: CustomAppColor.of(context).borderOtp),
                                color: CustomAppColor.of(context).buttonPrimary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 10.setWidth),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (item.cartCount > 1) {
                                          item.cartCount--;
                                        } else {
                                          item.isAddedToCart = false;
                                          item.cartCount = 0;
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove_rounded, color: Colors.white),
                                  ),
                                  CommonText(
                                    text: "${item.cartCount}",
                                    fontSize: 13.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                    textColor: Colors.white,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item.cartCount++;
                                      });
                                    },
                                    child: const Icon(Icons.add_rounded, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16.setWidth,
                    child: Stack(
                      children: [
                        Image.asset(
                          AppAssets.imgDiscountCard,
                          height: 32.setHeight,
                          width: 25.setWidth,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 4.setHeight),
                          child: CommonText(
                            text: "${item.itemDiscount.toString()}%\nOff",
                            textAlign: TextAlign.start,
                            fontSize: 9.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
