import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/ui/home/datamodel/home_data.dart';
import 'package:grokit_app/ui/search/views/search_screen.dart';
import 'package:grokit_app/ui/view_cart/view/view_cart_screen.dart';
import 'package:grokit_app/ui/view_product_details/view/view_product_details_screen.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/utils/utils.dart';
import 'package:grokit_app/widgets/bottom_sheet/share_bottom_sheet.dart';
import 'package:grokit_app/widgets/button/common_button.dart';
import 'package:grokit_app/widgets/item_card/itme_card_view.dart';
import 'package:grokit_app/widgets/text/common_text.dart';
import 'package:grokit_app/widgets/top_bar/topbar.dart';

class ItemDetailsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ItemDetailsScreen());
  }

  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> implements TopBarClickListener {
  List<String> bannerList = [AppAssets.imgVeggie1, AppAssets.imgVeggie1, AppAssets.imgVeggie1, AppAssets.imgVeggie1];
  int _currentIndex = 0;
  bool is500gmSelected = true;
  late ItemsData item;
  List<ItemsData> similarProductsList = [];
  List<ItemsData> ourTopPickHereProductsList = [];
  bool isAddToCart = true;
  List cartItem = [];

  @override
  void initState() {
    super.initState();
    fillData();
    cartItem = [
      ...similarProductsList,
      ...ourTopPickHereProductsList,
    ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();
  }

  void fillData() {
    similarProductsList = [
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
    ];

    ourTopPickHereProductsList = [
      ItemsData(
        itemName: "Fresh Onion",
        itemImage: AppAssets.imgVeggie5,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
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
    ];

    item = ItemsData(
      itemName: "Hybrid Tomato ",
      itemImage: AppAssets.imgVeggie1,
      itemWeight: "500gm",
      itemDiscountPrice: 32,
      itemOriginalPrice: 49,
      itemDiscount: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  this,
                  title: "",
                  isShowBack: true,
                  isShowShare: true,
                  isShowSearch: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _itemImageView(),
                            SizedBox(height: 15.setHeight),
                            _itemDetailsView(),
                            const Divider(),
                            SizedBox(height: 10.setHeight),
                            _header(name: "Similar Products", isShowNavIcon: true),
                            SizedBox(height: 15.setHeight),
                            ItemCardView(items: similarProductsList),
                            SizedBox(height: 15.setHeight),
                            _header(name: "Our Top Pick Here", isShowNavIcon: true),
                            SizedBox(height: 15.setHeight),
                            ItemCardView(items: ourTopPickHereProductsList),
                            SizedBox(height: 15.setHeight),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20.setWidth),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CustomAppColor.of(context).unselectedCard,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "500 gm",
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 15.setFontSize,
                            ),
                            SizedBox(height: 5.setHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonText(
                                  text: "\$32",
                                  textAlign: TextAlign.start,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                ),
                                SizedBox(width: 5.setWidth),
                                Row(
                                  children: [
                                    CommonText(
                                      text: "MRP \$",
                                      fontSize: 13.setFontSize,
                                      fontFamily: Constant.fontFamilyMedium500,
                                      textColor: CustomAppColor.of(context).txtGray,
                                    ),
                                    CommonText(
                                      text: "49",
                                      fontSize: 14.setFontSize,
                                      textDecoration: TextDecoration.lineThrough,
                                      fontFamily: Constant.fontFamilyMedium500,
                                      textColor: CustomAppColor.of(context).txtGray,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (isAddToCart)
                        Expanded(
                          child: CommonButton(
                            height: 38.setHeight,
                            width: 140.setWidth,
                            text: Languages.of(context).txtAddToCart,
                            buttonTextSize: 13.setFontSize,
                            buttonColor: CustomAppColor.of(context).buttonPrimary,
                            borderColor: CustomAppColor.of(context).buttonPrimary,
                            onTap: () {
                              setState(() {
                                isAddToCart = false;
                              });
                            },
                          ),
                        ),
                      if (!isAddToCart)
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
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                                  child: CommonText(
                                    text: "${item.cartCount}",
                                    fontSize: 13.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                    textColor: Colors.white,
                                  ),
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
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: ValueNotifier(similarProductsList + ourTopPickHereProductsList),
              builder: (context, items, _) {
                final cartItems = [
                  ...similarProductsList,
                  ...ourTopPickHereProductsList,
                ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();

                if (cartItems.isEmpty) return const SizedBox.shrink();

                final displayCartItems = cartItems.length > 3 ? cartItems.sublist(0, 3) : cartItems;

                return Positioned(
                  bottom: 50.setHeight,
                  right: displayCartItems.length == 3
                      ? 48.setWidth
                      : displayCartItems.length == 2
                          ? 60.setWidth
                          : 75.setWidth,
                  left: 48.setWidth,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, ViewCartScreen.route()),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 45.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
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
                  ),
                );
              },
            ),
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
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == Constant.strShare) {
      Utils.showBottomSheetDialog(context, widgets: const ShareBottomSheet());
    }
  }

  _header({
    required String name,
    Widget? screen,
    bool isShowNavIcon = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: name,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyBold700,
            textAlign: TextAlign.start,
          ),
          Visibility(
            visible: isShowNavIcon,
            child: GestureDetector(
              onTap: () => screen,
              child: const Icon(Icons.navigate_next_rounded),
            ),
          )
        ],
      ),
    );
  }

  _itemImageView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  i,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 250.setHeight,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10.setHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == entry.key ? 8 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentIndex == entry.key ? Colors.white : Colors.black.withValues(alpha: 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  _itemDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: "Hybrid Tomato : 500gm",
            fontFamily: Constant.fontFamilyBold700,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => setState(() => is500gmSelected = true),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 35.setWidth, left: 10.setWidth, bottom: 10.setHeight, top: 10.setHeight),
                      decoration: BoxDecoration(
                          color: is500gmSelected ? CustomAppColor.of(context).unselectedCard : CustomAppColor.of(context).bgScreen,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: is500gmSelected ? 1.5 : 0.5, color: is500gmSelected ? CustomAppColor.of(context).buttonPrimary : CustomAppColor.of(context).txtLightGrey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.setHeight),
                          CommonText(
                            text: "500gm",
                            fontFamily: Constant.fontFamilySemiBold600,
                            fontSize: 12.setFontSize,
                          ),
                          SizedBox(height: 5.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "\$32",
                                textAlign: TextAlign.start,
                                fontSize: 13.setFontSize,
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
                                    text: "49",
                                    fontSize: 10.setFontSize,
                                    textDecoration: TextDecoration.lineThrough,
                                    fontFamily: Constant.fontFamilyMedium500,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -6.setHeight,
                      left: 25.setWidth,
                      right: 25.setWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: is500gmSelected ? CustomAppColor.of(context).txtOrange : CustomAppColor.of(context).unselectedCard,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 2.setWidth, vertical: 3.setHeight),
                        child: CommonText(
                          text: "20% Off",
                          fontSize: 10.setFontSize,
                          textColor: is500gmSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16.setWidth),
              GestureDetector(
                onTap: () => setState(() => is500gmSelected = false),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 35.setWidth, left: 10.setWidth, bottom: 10.setHeight, top: 10.setHeight),
                      decoration: BoxDecoration(
                          color: !is500gmSelected ? CustomAppColor.of(context).unselectedCard : CustomAppColor.of(context).bgScreen,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: !is500gmSelected ? 1.5 : 0.5, color: !is500gmSelected ? CustomAppColor.of(context).buttonPrimary : CustomAppColor.of(context).txtLightGrey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.setHeight),
                          CommonText(
                            text: "1 Kg",
                            fontFamily: Constant.fontFamilySemiBold600,
                            fontSize: 12.setFontSize,
                          ),
                          SizedBox(height: 5.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "\$64",
                                textAlign: TextAlign.start,
                                fontSize: 13.setFontSize,
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
                                    text: "79",
                                    fontSize: 10.setFontSize,
                                    textDecoration: TextDecoration.lineThrough,
                                    fontFamily: Constant.fontFamilyMedium500,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -6.setHeight,
                      left: 25.setWidth,
                      right: 25.setWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: !is500gmSelected ? CustomAppColor.of(context).txtOrange : CustomAppColor.of(context).unselectedCard,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 2.setWidth, vertical: 3.setHeight),
                        child: CommonText(
                          text: "20% Off",
                          fontSize: 10.setFontSize,
                          textColor: !is500gmSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: "Storage Tips :",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          CommonText(
            text:
                "Store at room temperature away from direct sunlight. Do not refrigerate, as this can reduce flavor and texture. Once cut, cover the exposed part tightly with plastic wrap and refrigerate to avoid rotting. Use cut tomatoes within two days for best taste",
            fontSize: 10.setFontSize,
            maxLines: 6,
            textAlign: TextAlign.start,
            fontFamily: Constant.fontFamilyMedium500,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: "Nutrient Value & Benefits :",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          CommonText(
            text: "Contains Vitamin C, Vitamin K. Rich in carotene. Vitamin C acts as a powerful antioxidant and also helps formation of collagen that is responsible for skin and hair health.",
            fontSize: 10.setFontSize,
            maxLines: 6,
            textAlign: TextAlign.start,
            fontFamily: Constant.fontFamilyMedium500,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
              CommonText(
                text: "View Product Details",
                fontSize: 13.setFontSize,
                textColor: CustomAppColor.of(context).txtPrimary,
                fontFamily: Constant.fontFamilySemiBold600,
              ),
              SizedBox(width: 5.setWidth),
              GestureDetector(
                onTap: () => Navigator.push(context, ViewProductDetailsScreen.route()),
                child: Image.asset(
                  AppAssets.icPrimaryArrow,
                  height: 16.setHeight,
                  width: 16.setWidth,
                ),
              )
            ],
          ),
          SizedBox(height: 10.setHeight),
        ],
      ),
    );
  }
}
