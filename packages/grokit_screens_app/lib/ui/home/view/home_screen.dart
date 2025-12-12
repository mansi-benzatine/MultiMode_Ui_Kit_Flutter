import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/category_list/view/category_list_screen.dart';
import 'package:grokit_screens_app/ui/favorite/view/favorite_screen.dart';
import 'package:grokit_screens_app/ui/home/datamodel/home_data.dart';
import 'package:grokit_screens_app/ui/view_cart/view/view_cart_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

import '../../../widgets/bottom_sheet/select_delivery_location_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  final bool isShowDeliveryLocationBs;

  static Route<void> route({bool isShowDeliveryLocationBs = false}) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(isShowDeliveryLocationBs: isShowDeliveryLocationBs),
    );
  }

  const HomeScreen({super.key, this.isShowDeliveryLocationBs = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  List<HomeTabData> tabList = [];
  List<ItemsData> veggieList = [];
  List<ItemsData> snackList = [];
  List<ItemsData> dairyList = [];
  List<ItemsData> groceryList = [];
  List<ItemsData> sipsList = [];
  List<String> bannerList = [];
  final ValueNotifier<String> hintText = ValueNotifier<String>("Search \"Chocolate\"");
  final List<String> hintTexts = [
    "Search \"Milk\"",
    "Search \"Veggie\"",
    "Search \"Fruits\"",
    "Search \"Dairy\"",
    "Search \"Egg\"",
    "Search \"Rice\"",
    "Search \"Bottle\"",
    "Search \"Chips\"",
  ];
  int currentHintIndex = 0;
  Timer? _timer;
  List<MostRecentUsedCategoryData> mostRecentUsedList = [];
  List cartItem = [];
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    _startHintAnimation();
    fillData();
    _tabController = TabController(length: tabList.length, vsync: this);
    cartItem = [
      ...veggieList,
      ...snackList,
      ...dairyList,
      ...groceryList,
      ...sipsList,
    ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();

    if (widget.isShowDeliveryLocationBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          isDismissible: true,
          context,
          widgets: const SelectDeliveryLocationBottomSheet(),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  void fillData() {
    tabList = [
      HomeTabData(name: "All", iconPath: AppAssets.icTabAll),
      HomeTabData(name: "Veggies", iconPath: AppAssets.icTabVeggie),
      HomeTabData(name: "Fruits", iconPath: AppAssets.icTabFruits),
      HomeTabData(name: "Dairy", iconPath: AppAssets.icTabDairy),
      HomeTabData(name: "Baby Food", iconPath: AppAssets.icTabBaby),
      HomeTabData(name: "Snacks", iconPath: AppAssets.icTabSnack),
    ];
    mostRecentUsedList = [
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentVeggie,
        categoryItemCount: "+65 More",
        categoryName: "Veggies & Fruits",
      ),
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentDairy,
        categoryItemCount: "+20 More",
        categoryName: "Dairy, Bread & Eggs",
      ),
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentOil,
        categoryItemCount: "+115 More",
        categoryName: "Oil & Masala",
      ),
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentSnack,
        categoryItemCount: "+200 More",
        categoryName: "Snacks & Namkeen",
      ),
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentBakery,
        categoryItemCount: "+80 More",
        categoryName: "Bakery & Biscuits",
      ),
      MostRecentUsedCategoryData(
        categoryImagePath: AppAssets.imgRecentFlours,
        categoryItemCount: "+18 More",
        categoryName: "Flours, Rise & Pulses",
      ),
    ];
    veggieList = [
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
    snackList = [
      ItemsData(
        itemName: "Lays Cream & Onion Chips",
        itemImage: AppAssets.imgSnack1,
        itemWeight: "48gm",
        itemDiscountPrice: 20,
        itemOriginalPrice: 24,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Onion Kodubale",
        itemImage: AppAssets.imgSnack,
        itemWeight: "500gm",
        itemDiscountPrice: 99,
        itemOriginalPrice: 104,
        itemDiscount: 20,
      ),
    ];
    dairyList = [
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
        isAddedToCart: false,
      ),
    ];
    groceryList = [
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
    ];
    sipsList = [
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
    ];
    bannerList = [AppAssets.imgBanner, AppAssets.imgBanner1, AppAssets.imgBanner2];
  }

  void _startHintAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentHintIndex = (currentHintIndex + 1) % hintTexts.length;
        hintText.value = hintTexts[currentHintIndex];
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    hintText.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PopScope(
        canPop: !_isBottomSheetOpen,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && _isBottomSheetOpen) {
            Navigator.pop(context);
            setState(() {
              _isBottomSheetOpen = false;
            });
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          backgroundColor: CustomAppColor.of(context).bgScreen,
          body: Stack(
            children: [
              Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: hintText,
                    builder: (context, value, child) {
                      return Stack(
                        children: [
                          _topbar(),
                          SizedBox(height: 40.setHeight),
                          _topBarAddress(),
                          SizedBox(height: 20.setHeight),
                          Padding(
                            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 100.setHeight),
                            child: CommonTextFormFieldWithPrefixAndSuffix(
                              controller: searchController,
                              radius: 14,
                              hintText: hintText.value,
                              prefixIcon: AppAssets.icSearch,
                              suffixIcon: AppAssets.icMicroPhone,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 160.setHeight),
                            child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                              labelPadding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                              indicatorColor: CustomAppColor.of(context).txtBlack,
                              controller: _tabController,
                              tabs: tabList.asMap().entries.map((entry) {
                                final index = entry.key;
                                final item = entry.value;
                                final isSelected = _tabController.index == index;
                                return SizedBox(
                                  width: 40.setWidth,
                                  child: Tab(
                                    icon: Image.asset(item.iconPath, height: 24),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.setHeight),
                                      child: CommonText(
                                        text: item.name,
                                        fontSize: 12.setFontSize,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: Constant.fontFamilyMedium500,
                                        textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: tabList.map((item) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.setHeight),
                              _header(
                                name: Languages.of(context).txtMostRecentlyUsed,
                                isShowNavIcon: false,
                              ),
                              SizedBox(height: 15.setHeight),
                              _mostRecentlyUsedView(),
                              SizedBox(height: 15.setHeight),
                              _header(
                                name: Languages.of(context).txtVeggieAndFruits,
                                isShowNavIcon: true,
                              ),
                              SizedBox(height: 10.setHeight),
                              _itemCardView(items: veggieList),
                              SizedBox(height: 15.setHeight),
                              _header(
                                name: Languages.of(context).txtSnacks,
                                isShowNavIcon: true,
                              ),
                              SizedBox(height: 15.setHeight),
                              _itemCardView(items: snackList),
                              SizedBox(height: 20.setHeight),
                              CarouselSlider(
                                items: bannerList.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.asset(i);
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 180.setHeight,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.2,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(height: 20.setHeight),
                              _header(
                                name: Languages.of(context).txtDairyAndBread,
                                isShowNavIcon: true,
                              ),
                              SizedBox(height: 15.setHeight),
                              _itemCardView(items: dairyList),
                              SizedBox(height: 15.setHeight),
                              _header(
                                name: Languages.of(context).txtGroceryAndKitchen,
                                isShowNavIcon: true,
                              ),
                              SizedBox(height: 15.setHeight),
                              _itemCardView(items: groceryList),
                              SizedBox(height: 15.setHeight),
                              _header(name: Languages.of(context).txtBeautyAndCosmetic),
                              SizedBox(height: 15.setHeight),
                              _beautyAndCosmeticView(),
                              SizedBox(height: 15.setHeight),
                              _header(
                                name: Languages.of(context).txtSipsAndJuices,
                                isShowNavIcon: true,
                              ),
                              SizedBox(height: 15.setHeight),
                              _itemCardView(items: sipsList),
                              SizedBox(height: 15.setHeight),
                              ValueListenableBuilder(
                                  valueListenable: ValueNotifier(
                                    veggieList + snackList + dairyList + groceryList + sipsList,
                                  ),
                                  builder: (context, items, _) {
                                    final cartItems = [
                                      ...veggieList,
                                      ...snackList,
                                      ...dairyList,
                                      ...groceryList,
                                      ...sipsList,
                                    ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();
                                    return Visibility(visible: cartItems.isNotEmpty, child: SizedBox(height: 80.setHeight));
                                  }),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: ValueNotifier(
                  veggieList + snackList + dairyList + groceryList + sipsList,
                ),
                builder: (context, items, _) {
                  final cartItems = [
                    ...veggieList,
                    ...snackList,
                    ...dairyList,
                    ...groceryList,
                    ...sipsList,
                  ].where((item) => item.isAddedToCart && item.cartCount > 0).toList();

                  if (cartItems.isEmpty) return const SizedBox.shrink();

                  final displayCartItems = cartItems.length > 3 ? cartItems.sublist(0, 3) : cartItems;

                  return Positioned(
                    bottom: 0,
                    right: displayCartItems.length == 3
                        ? 48.setWidth
                        : displayCartItems.length == 2
                            ? 60.setWidth
                            : 75.setWidth,
                    left: 48.setWidth,
                    child: IgnorePointer(
                      ignoring: true,
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
                                width: displayCartItems.length * 15.0 + 32,
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
                              SizedBox(width: 5.setWidth),
                              Icon(
                                Icons.navigate_next_rounded,
                                color: CustomAppColor.of(context).white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _topbar() {
    return Container(
      height: 220.setHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomAppColor.of(context).topbarGradiant, CustomAppColor.of(context).bgScreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  _topBarAddress() {
    return Positioned(
      top: 40.setHeight,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icLocation,
                      height: 18.setHeight,
                      width: 18.setWidth,
                      color: CustomAppColor.of(context).icBlackWhite,
                    ),
                    SizedBox(width: 5.setWidth),
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () {
                          Utils.showBottomSheetDialog(
                            context,
                            widgets: const SelectDeliveryLocationBottomSheet(),
                          );
                        },
                        child: Row(
                          children: [
                            const CommonText(
                              text: "Square Building",
                              fontFamily: Constant.fontFamilyBold700,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 25.setHeight,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "47 W 13th St, New York, NY 10011, USA",
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
            IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.push(context, FavoriteScreen.route()),
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 24.setHeight,
                  color: CustomAppColor.of(context).icBlackWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _mostRecentlyUsedView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Wrap(
        spacing: 11.setWidth,
        runSpacing: 11.setHeight,
        children: mostRecentUsedList.map((item) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width - 20 * 2 - 30) / 3,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CategoryListScreen.route(title: item.categoryName),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).unselectedCard,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).bgScreen,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
                            child: Image.asset(
                              item.categoryImagePath,
                              height: 50.setHeight,
                              width: 50.setHeight,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: -7,
                            right: 15.setWidth,
                            left: 15.setWidth,
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).unselectedCard,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                                    spreadRadius: 0.4,
                                    blurRadius: 0.5,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3.setHeight, horizontal: 2.setWidth),
                              child: CommonText(
                                text: item.categoryItemCount,
                                fontSize: 8.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlackGrey,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                              child: CommonText(
                                text: item.categoryName,
                                textAlign: TextAlign.center,
                                fontSize: 13.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).txtBlack,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
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
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => screen,
                child: const Icon(Icons.navigate_next_rounded),
              ),
            ),
          )
        ],
      ),
    );
  }

  _itemCardView({required List<ItemsData> items}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item.itemImage,
                                  height: 138.setHeight,
                                  width: 138.setWidth,
                                  fit: BoxFit.fill,
                                ),
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

  Widget _beautyAndCosmeticView() {
    final List<Map<String, String>> categories = [
      {'name': 'All Cosmetic', 'image': AppAssets.imgBeautyCosmetic},
      {'name': 'Lipsticks', 'image': AppAssets.imgBeautyLipstick},
      {'name': 'Fresh Face', 'image': AppAssets.imgBeautyFreshFace},
      {'name': 'Eye Beauty', 'image': AppAssets.imgBeautyEyeBeauty},
      {'name': 'Nails', 'image': AppAssets.imgBeautyNails},
      {'name': 'Glow Kits', 'image': AppAssets.imgBeautyGlowKits},
      {'name': '+145 More', 'image': AppAssets.imgBeautyNails},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).unselectedCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Wrap(
          spacing: 8.setWidth,
          runSpacing: 12.setHeight,
          children: List.generate(categories.length, (index) {
            double cardWidth;
            if (index == 0) {
              cardWidth = 150.setWidth;
            } else if (index <= 2) {
              cardWidth = 70.setWidth;
            } else {
              cardWidth = 70.setWidth;
            }

            return SizedBox(
              width: cardWidth,
              child: Column(
                children: [
                  SizedBox(
                    height: 70.setHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            categories[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withValues(alpha: 0.4),
                                  Colors.black.withValues(alpha: 0.4),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: index == 6 ? 14 : 6.setHeight,
                          left: 6.setWidth,
                          right: index == 6 ? 6.setWidth : 4.setWidth,
                          child: CommonText(
                            text: categories[index]['name']!,
                            fontSize: index == 6 ? 18.setFontSize : 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: categories[index]['name'] == '+145 More' ? CustomAppColor.of(context).white : CustomAppColor.of(context).white,
                            textAlign: index == 6 ? TextAlign.center : TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
