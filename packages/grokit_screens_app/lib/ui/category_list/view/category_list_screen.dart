import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/ui/search/views/search_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../localization/language/languages.dart';
import '../../home/datamodel/home_data.dart';

class CategoryListScreen extends StatefulWidget {
  final String title;

  const CategoryListScreen({super.key, this.title = ""});

  static Route<void> route({String title = ""}) {
    return MaterialPageRoute(
      builder: (_) => CategoryListScreen(
        title: title,
      ),
    );
  }

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> implements TopBarClickListener {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"icon": AppAssets.imgCategoryAll, "name": "All"},
    {"icon": AppAssets.imgCategoryVegetable, "name": "Fresh Vegetables"},
    {"icon": AppAssets.imgCategoryFruits, "name": "Fruits"},
    {"icon": AppAssets.imgCategoryExotics, "name": "Exotics"},
    {"icon": AppAssets.imgCategorySeasonal, "name": "Seasonal"},
    {"icon": AppAssets.imgCategoryVegetable, "name": "Flower & Leaves"},
    {"icon": AppAssets.imgCategoryCutsSprouts, "name": "Cuts & Sprouts"},
  ];
  List<ItemsData> categoryList = [];

  void _fillData() {
    categoryList = [
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie2,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie4,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie5,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie3,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Berry Smoothie",
        itemImage: AppAssets.imgJuice,
        itemWeight: "250ml",
        itemDiscountPrice: 18,
        itemOriginalPrice: 23,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Mojito ",
        itemImage: AppAssets.imgJuice1,
        itemWeight: "250ml",
        itemDiscountPrice: 22,
        itemOriginalPrice: 39,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Atta",
        itemImage: AppAssets.imgKitchen,
        itemWeight: "200gm",
        itemDiscountPrice: 45,
        itemOriginalPrice: 58,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Caf's Mixer",
        itemImage: AppAssets.imgKitchen1,
        itemWeight: "500gm",
        itemDiscountPrice: 120,
        itemOriginalPrice: 150,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Amul Cheese Slices",
        itemImage: AppAssets.imgDairy,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgDairy1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isOutOfStock: true,
      ),
      ItemsData(
        itemName: "Lays Cream & Onion Chips",
        itemImage: AppAssets.imgSnack1,
        itemWeight: "48gm",
        itemDiscountPrice: 20,
        itemOriginalPrice: 24,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Onion Kodubale",
        itemImage: AppAssets.imgSnack,
        itemWeight: "500gm",
        itemDiscountPrice: 99,
        itemOriginalPrice: 104,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
      ),
    ];
  }

  @override
  void initState() {
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
            title: widget.title,
            isShowSearch: true,
            isShowBack: true,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 76.setWidth,
                  color: CustomAppColor.of(context).unselectedCard,
                  child: ListView.builder(
                    itemCount: categories.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 15.setHeight),
                          decoration: BoxDecoration(
                            color: !isSelected ? CustomAppColor.of(context).bgScreen : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(isSelected ? 4 : 0),
                              topRight: Radius.circular(isSelected ? 4 : 0),
                            ),
                            border: Border(
                              right: BorderSide(
                                color: isSelected ? CustomAppColor.of(context).buttonPrimary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                                width: isSelected ? 3 : 0.5,
                              ),
                              bottom: BorderSide(
                                color: isSelected ? CustomAppColor.of(context).buttonPrimary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                                width: 0.5,
                              ),
                              top: BorderSide(
                                color: isSelected ? CustomAppColor.of(context).buttonPrimary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).unselectedCard,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  categories[index]["icon"],
                                  height: 42.setHeight,
                                  width: 42.setWidth,
                                ),
                              ),
                              SizedBox(height: 6.setHeight),
                              CommonText(
                                text: categories[index]["name"],
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                fontSize: 11.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                          child: Column(
                            children: [
                              _itemCardView(items: categoryList),
                              SizedBox(height: 55.setHeight),
                            ],
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: ValueNotifier(categoryList),
                        builder: (context, items, _) {
                          final cartItems = [
                            ...categoryList,
                          ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();

                          if (cartItems.isEmpty) return const SizedBox.shrink();

                          final displayCartItems = cartItems.length > 2 ? cartItems.sublist(0, 2) : cartItems;

                          return Positioned(
                            right: displayCartItems.length == 3
                                ? 48.setWidth
                                : displayCartItems.length == 2
                                    ? 60.setWidth
                                    : 75.setWidth,
                            bottom: 50.setHeight,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 45.setWidth),
                              padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 5.setHeight),
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).buttonPrimary,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 35.setHeight,
                                    width: displayCartItems.length * 15.0 + 20,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: List.generate(displayCartItems.length, (index) {
                                        return Positioned(
                                          left: index * 15.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: CustomAppColor.of(context).white,
                                              border: Border.all(color: CustomAppColor.of(context).borderOtp),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(24),
                                              child: Image.asset(
                                                displayCartItems[index].itemImage,
                                                height: 30.setHeight,
                                                width: 30.setHeight,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: Languages.of(context).txtViewCart,
                                        textColor: CustomAppColor.of(context).white,
                                        fontSize: 14.setFontSize,
                                        fontFamily: Constant.fontFamilyMedium500,
                                      ),
                                      CommonText(
                                        text: "${cartItems.length} items",
                                        textColor: CustomAppColor.of(context).white,
                                        fontSize: 12.setFontSize,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 12.setWidth),
                                  Icon(
                                    Icons.navigate_next_rounded,
                                    color: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _itemCardView({required List<ItemsData> items}) {
    return Wrap(
      spacing: 10.setWidth,
      runSpacing: 10.setHeight,
      children: items.map((item) {
        return GestureDetector(
          // onTap: () => Navigator.push(context, ItemDetailsScreen.route()),
          child: SizedBox(
            width: 130.setWidth,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: CustomAppColor.of(context).itemCardBorder,
                          width: 0.5,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item.itemImage,
                                    height: 112.setHeight,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6.setWidth,
                                top: 6.setHeight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.isFavourite = !item.isFavourite;
                                    });
                                  },
                                  child: Icon(
                                    item.isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                    size: 20,
                                    color: item.isFavourite ? Colors.red : CustomAppColor.of(context).icBlackWhite.withValues(alpha: 0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.setHeight),
                          Align(
                            alignment: Alignment.topLeft,
                            child: CommonText(
                              text: item.itemWeight,
                              fontSize: 8.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: const Color(0xFF2B70E8),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: CommonText(
                              text: item.itemName,
                              textAlign: TextAlign.start,
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 2.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "\$${item.itemDiscountPrice.toString()}",
                                textAlign: TextAlign.start,
                                fontSize: 12.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                              ),
                              SizedBox(width: 5.setWidth),
                              Row(
                                children: [
                                  CommonText(
                                    text: "MRP \$",
                                    fontSize: 10.setFontSize,
                                    fontFamily: Constant.fontFamilyMedium500,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                  CommonText(
                                    text: "${item.itemOriginalPrice}",
                                    fontSize: 10.setFontSize,
                                    textDecoration: TextDecoration.lineThrough,
                                    fontFamily: Constant.fontFamilyMedium500,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5.setHeight),
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
                                padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 18.setWidth),
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
                                      child: const Icon(
                                        Icons.remove_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    CommonText(
                                      text: "${item.cartCount}",
                                      fontSize: 12.setFontSize,
                                      fontFamily: Constant.fontFamilySemiBold600,
                                      textColor: Colors.white,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.cartCount++;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
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
                            height: 25.setHeight,
                            width: 20.setWidth,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.setWidth, vertical: 4.setHeight),
                            child: CommonText(
                              text: "${item.itemDiscount.toString()}%\nOff",
                              textAlign: TextAlign.start,
                              fontSize: 8.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (item.isOutOfStock)
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: CustomAppColor.of(context).white.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: CommonText(
                        text: "Out Of Stock",
                        fontFamily: Constant.fontFamilyBold700,
                      )),
                    ),
                  )
              ],
            ),
          ),
        );
      }).toList(),
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
