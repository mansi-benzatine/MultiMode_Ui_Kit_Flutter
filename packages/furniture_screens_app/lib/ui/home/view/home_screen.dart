import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/category/view/category_screen.dart';
import 'package:furniture_screens_app_package/ui/category_details/view/category_details_screen.dart';
import 'package:furniture_screens_app_package/ui/home/datamodel/home_data.dart';
import 'package:furniture_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:furniture_screens_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements TopBarClickListener {
  List<CategoriesData> categoriesList = [];
  List<TrendingNowData> trendingNowList = [];
  List<NewArrivalData> newArrivalList = [];
  List<BestSellersData> bestSellerList = [];
  List<NewArrivalData> topRatedList = [];
  final PageController _controller = PageController();
  final List<String> banners = [
    AppAssets.imgHomeBanner,
    AppAssets.imgHomeBanner,
    AppAssets.imgHomeBanner,
    AppAssets.imgHomeBanner,
  ];
  int currentIndex = 0;
  void _fillData() {
    categoriesList = [
      CategoriesData(
        categoryImage: AppAssets.icDummySofa,
        categoryItemsQuantity: "190 Items",
        categoryName: "Sofa",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyChair,
        categoryItemsQuantity: "190 Items",
        categoryName: "Chair",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyLamp,
        categoryItemsQuantity: "190 Items",
        categoryName: "Lamp",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyCupboard,
        categoryItemsQuantity: "190 Items",
        categoryName: "Cupboard",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummySofa,
        categoryItemsQuantity: "190 Items",
        categoryName: "Sofa",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyChair,
        categoryItemsQuantity: "190 Items",
        categoryName: "Chair",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyLamp,
        categoryItemsQuantity: "190 Items",
        categoryName: "Lamp",
      ),
      CategoriesData(
        categoryImage: AppAssets.icDummyCupboard,
        categoryItemsQuantity: "190 Items",
        categoryName: "Cupboard",
      ),
    ];
    trendingNowList = [
      TrendingNowData(
        trendingItemCategoryName: "Lolita Sofa",
        trendingItemImage: AppAssets.imgDummySofa,
        trendingItemName: "Luxury Big Sofa",
        trendingItemPrice: 299.00,
        trendingItemRating: 4.3,
        isSelected: false,
      ),
      TrendingNowData(
        trendingItemCategoryName: "Lolita Sofa",
        trendingItemImage: AppAssets.imgDummyPot,
        trendingItemName: "Luxury Big Sofa",
        trendingItemPrice: 299.00,
        trendingItemRating: 4.3,
        isSelected: false,
      ),
      TrendingNowData(
        trendingItemCategoryName: "Lolita Sofa",
        trendingItemImage: AppAssets.imgDummySofa,
        trendingItemName: "Luxury Big Sofa",
        trendingItemPrice: 299.00,
        trendingItemRating: 4.3,
        isSelected: false,
      ),
      TrendingNowData(
        trendingItemCategoryName: "Lolita Sofa",
        trendingItemImage: AppAssets.imgDummyPot,
        trendingItemName: "Luxury Big Sofa",
        trendingItemPrice: 299.00,
        trendingItemRating: 4.3,
        isSelected: false,
      ),
    ];
    newArrivalList = [
      NewArrivalData(
        newArrivalItemCategoryName: "Arm Chair",
        newArrivalItemImage: AppAssets.imgDummyChair,
        newArrivalItemName: "Luxury Chair",
        newArrivalItemPrice: 299.00,
        newArrivalItemRating: 4.5,
        isSelected: false,
      ),
      NewArrivalData(
        newArrivalItemCategoryName: "Lamp",
        newArrivalItemImage: AppAssets.imgDummyLamp,
        newArrivalItemName: "Night Lamp",
        newArrivalItemPrice: 299.00,
        newArrivalItemRating: 3.5,
        isSelected: false,
      ),
    ];
    bestSellerList = [
      BestSellersData(
        bestSellerItemCategoryName: "Luxury Sofa",
        bestSellerItemImage: AppAssets.imgDummySofa,
        bestSellerItemName: "Living room sofa",
        bestSellerItemPrice: 374.00,
        bestSellerItemRating: 4.9,
        isSelected: false,
      ),
      BestSellersData(
        bestSellerItemCategoryName: "Grifo Lamp",
        bestSellerItemImage: AppAssets.imgDummyLamp,
        bestSellerItemName: "Night Lamp",
        bestSellerItemPrice: 160.00,
        bestSellerItemRating: 4.6,
        isSelected: false,
      ),
      BestSellersData(
        bestSellerItemCategoryName: "Respira",
        bestSellerItemImage: AppAssets.imgDummyChair,
        bestSellerItemName: "Stylish Chair",
        bestSellerItemPrice: 399.00,
        bestSellerItemRating: 4.2,
        isSelected: false,
      ),
    ];
    topRatedList = [
      NewArrivalData(
        newArrivalItemCategoryName: "Leviosa",
        newArrivalItemImage: AppAssets.imgDummyChair,
        newArrivalItemName: "Stylish Cafe Chair",
        newArrivalItemPrice: 249.00,
        newArrivalItemRating: 3.5,
        isSelected: false,
      ),
      NewArrivalData(
        newArrivalItemCategoryName: "Muggo",
        newArrivalItemImage: AppAssets.imgDummyPot,
        newArrivalItemName: "Small Mug",
        newArrivalItemPrice: 129.00,
        newArrivalItemRating: 3.4,
        isSelected: false,
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
            isShowAppLogo: true,
            isShowSearch: true,
            isShowNotification: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 230.setHeight,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: _controller,
                        itemCount: banners.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                banners[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(banners.length, (index) {
                            bool isActive = currentIndex == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: 5.setWidth,
                              height: 5.setHeight,
                              decoration: BoxDecoration(
                                color: isActive ? CustomAppColor.of(context).primary : Colors.white.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.setHeight),
                _categoriesListView(categoriesList: categoriesList),
                _trendingNowListView(trendingNowList: trendingNowList),
                _newArrivedListView(newArrivedList: newArrivalList, title: Languages.of(context).txtNewArrival),
                _bestSellersListView(bestSellersList: bestSellerList),
                _newArrivedListView(newArrivedList: topRatedList, title: Languages.of(context).txtTopRated),
                SizedBox(height: 100.setHeight),
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == Constant.strNotification) {
      Navigator.push(context, NotificationScreen.route());
    }
  }

  _categoriesListView({required List<CategoriesData> categoriesList}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtCategories,
                fontSize: 22.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, CategoriesScreen.route()),
                  child: CommonText(
                    text: Languages.of(context).txtSeeAll,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Row(
            children: [
              ...List.generate(
                categoriesList.length,
                (index) {
                  final item = categoriesList[index];
                  return IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () => Navigator.push(context, CategoryDetailsScreen.route()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).containerBg,
                              ),
                              padding: const EdgeInsets.all(18),
                              child: Image.asset(
                                item.categoryImage,
                                width: 40.setWidth,
                                height: 40.setHeight,
                              ),
                            ),
                            CommonText(
                              text: item.categoryName,
                              fontSize: 16.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                            CommonText(
                              text: item.categoryItemsQuantity,
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtGray,
                            )
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
      ],
    );
  }

  _trendingNowListView({required List<TrendingNowData> trendingNowList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTrendingNow,
                fontSize: 22.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Row(
            children: [
              ...List.generate(
                trendingNowList.length,
                (index) {
                  final item = trendingNowList[index];
                  return InkWell(
                    // onTap: () => Navigator.push(context, ProductDetailsScreen.route()),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  item.trendingItemImage,
                                  width: 185.setWidth,
                                  height: 185.setHeight,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 10.setHeight,
                                right: 10.setWidth,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      if (item.isSelected) {
                                        item.isSelected = false;
                                      } else {
                                        item.isSelected = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                      height: 16.setHeight,
                                      width: 16.setWidth,
                                      color: item.isSelected ? CustomAppColor.of(context).primary : null,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                          Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: item.trendingItemCategoryName,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.icStar,
                                    height: 16.setHeight,
                                    width: 16.setWidth,
                                  ),
                                  SizedBox(width: 3.setWidth),
                                  CommonText(
                                    text: item.trendingItemRating.toString(),
                                    fontSize: 16.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CommonText(
                            text: item.trendingItemName,
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          CommonText(
                            text: "\$${item.trendingItemPrice.toStringAsFixed(2)}",
                            fontSize: 18.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                          )
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
    );
  }

  _bestSellersListView({required List<BestSellersData> bestSellersList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtBestSeller,
                fontSize: 22.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Column(
            children: [
              ...List.generate(
                bestSellersList.length,
                (index) {
                  final item = bestSellersList[index];
                  return InkWell(
                    // onTap: () => Navigator.push(context, ProductDetailsScreen.route()),
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    item.bestSellerItemImage,
                                    width: 110.setWidth,
                                    height: 110.setHeight,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: 10.setHeight,
                                  right: 10.setWidth,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (item.isSelected) {
                                          item.isSelected = false;
                                        } else {
                                          item.isSelected = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      child: Image.asset(
                                        item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                        height: 12.setHeight,
                                        width: 12.setWidth,
                                        color: item.isSelected ? CustomAppColor.of(context).primary : null,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 14.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: item.bestSellerItemName,
                                    fontSize: 18.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                  ),
                                  CommonText(
                                    text: item.bestSellerItemCategoryName,
                                    fontSize: 12.setFontSize,
                                    fontFamily: Constant.fontFamilyMedium500,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                  SizedBox(height: 3.setHeight),
                                  CommonText(
                                    text: "\$${item.bestSellerItemPrice.toStringAsFixed(2)}",
                                    fontSize: 18.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                  ),
                                  SizedBox(height: 5.setHeight),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AppAssets.icStar,
                                        height: 16.setHeight,
                                        width: 16.setWidth,
                                      ),
                                      SizedBox(width: 4.setWidth),
                                      CommonText(
                                        text: item.bestSellerItemRating.toString(),
                                        fontSize: 16.setFontSize,
                                        fontFamily: Constant.fontFamilySemiBold600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.setWidth),
                            CommonButton(
                              text: Languages.of(context).txtShopNow,
                              width: 80.setWidth,
                              height: 30.setHeight,
                              buttonTextSize: 12.setFontSize,
                              borderColor: Colors.transparent,
                            )
                          ],
                        )),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _newArrivedListView({required List<NewArrivalData> newArrivedList, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: title,
                fontSize: 22.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Row(
            children: [
              ...List.generate(
                newArrivedList.length,
                (index) {
                  final item = newArrivedList[index];
                  return InkWell(
                    // onTap: () => Navigator.push(context, ProductDetailsScreen.route()),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  item.newArrivalItemImage,
                                  width: 185.setWidth,
                                  height: 185.setHeight,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 10.setHeight,
                                right: 10.setWidth,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (item.isSelected) {
                                        item.isSelected = false;
                                      } else {
                                        item.isSelected = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                      height: 16.setHeight,
                                      width: 16.setWidth,
                                      color: item.isSelected ? CustomAppColor.of(context).primary : null,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                          Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: item.newArrivalItemCategoryName,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.icStar,
                                    height: 16.setHeight,
                                    width: 16.setWidth,
                                  ),
                                  SizedBox(width: 3.setWidth),
                                  CommonText(
                                    text: item.newArrivalItemRating.toString(),
                                    fontSize: 16.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CommonText(
                            text: item.newArrivalItemName,
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          CommonText(
                            text: "\$${item.newArrivalItemPrice.toStringAsFixed(2)}",
                            fontSize: 18.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                          )
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
    );
  }
}
