import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/home/datamodels/home_data.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../view_restaurant/views/view_restaurant_screen.dart';

class SearchScreen extends StatefulWidget {
  final bool isEmptySearchScreen;
  const SearchScreen({super.key, this.isEmptySearchScreen = false});

  static Route<void> route({bool isEmptySearchScreen = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(isEmptySearchScreen: isEmptySearchScreen),
    );
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  late TextEditingController _searchController;
  List<FoodDetailData> recentSearchList = [];
  List<RestaurantData> restaurantList = [];
  List<RestaurantData> filteredRestaurantList = [];
  void fillData() {
    recentSearchList = [
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["Mexican", "Italian", "Chinese"],
        foodName: "The Garden Restaurant",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Veg Burger", "Fries Finger", "Coke"],
        foodName: "Testy Burger",
      ),
    ];
    restaurantList = [
      RestaurantData(
        restaurantImage: AppAssets.imgComboBurger,
        restaurantName: "Testy Burger",
        cuisineType: ["Veg Burger", "Fries Finger", "Coke"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        price: "59",
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
      RestaurantData(
        restaurantImage: AppAssets.imgComboBurger,
        restaurantName: "Testy Burger",
        cuisineType: ["Veg Burger", "Fries Finger", "Coke"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        price: "59",
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
      RestaurantData(
        restaurantImage: AppAssets.imgComboBurger,
        restaurantName: "Testy Burger",
        cuisineType: ["Veg Burger", "Fries Finger", "Coke"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        price: "59",
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEmptySearchScreen) {
      recentSearchList = [];
      restaurantList = [];
      filteredRestaurantList = [];
      _searchController = TextEditingController(text: "food");
    } else {
      _searchController = TextEditingController();

      fillData();
      _searchController.addListener(_onSearchChanged);
      filteredRestaurantList = List.from(restaurantList);
    }
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredRestaurantList = List.from(restaurantList);
      } else {
        filteredRestaurantList = restaurantList.where((restaurant) => restaurant.restaurantName.toLowerCase().contains(query) || restaurant.cuisineType.any((type) => type.toLowerCase().contains(query))).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtSearch,
                isShowBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.setWidth, top: 20.setHeight, right: 24.setWidth),
                  child: SingleChildScrollView(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Column(
                        children: [
                          CommonTextFormFieldWithPrefix(
                            prefixIcon: AppAssets.icSearch,
                            controller: _searchController,
                            hintText: Languages.of(context).txtRestaurantNameCuisineOrDish,
                          ),
                          SizedBox(height: 20.setHeight),
                          if (_searchController.text.isEmpty) ...[
                            RecentSearchView(recentSearchList: recentSearchList),
                            SizedBox(height: 16.setHeight),
                            RecommendedForYouView(allRestaurantList: filteredRestaurantList),
                          ] else if (filteredRestaurantList.isNotEmpty) ...[
                            RecommendedForYouView(allRestaurantList: filteredRestaurantList),
                          ] else ...[
                            const EmptySearchView(),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class RecentSearchView extends StatelessWidget {
  final List<FoodDetailData> recentSearchList;

  const RecentSearchView({super.key, required this.recentSearchList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtRecentSearch,
              fontWeight: FontWeight.w700,
              fontSize: 22.setFontSize,
            ),
            CommonText(
              text: Languages.of(context).txtClearAll,
              fontWeight: FontWeight.w600,
              fontSize: 16.setFontSize,
              textColor: CustomAppColor.of(context).primary,
            ),
          ],
        ),
        SizedBox(height: 12.setHeight),
        SizedBox(
          height: 175.setHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentSearchList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final search = recentSearchList[index];
              return Padding(
                padding: EdgeInsets.only(right: 16.setWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        search.foodImageUrl,
                        width: 154.setWidth,
                        height: 120.setHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: search.foodName,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.setFontSize,
                    ),
                    CommonText(
                      text: search.foodTypes.join(', '),
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecommendedForYouView extends StatelessWidget {
  final List<RestaurantData> allRestaurantList;

  const RecommendedForYouView({super.key, required this.allRestaurantList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtRecommendForYou,
          fontWeight: FontWeight.w700,
          fontSize: 22.setFontSize,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: allRestaurantList.length,
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          itemBuilder: (context, index) {
            final category = allRestaurantList[index];
            return IgnorePointer(
              ignoring: true,
              child: InkWell(
                onTap: () => Navigator.push(context, ViewRestaurantScreen.route()),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                  child: Image.asset(
                                    category.restaurantImage,
                                    height: 138.setHeight,
                                    width: 114.setWidth,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: -10.setHeight,
                                  left: 0.setWidth,
                                  right: 0.setWidth,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 4.setHeight),
                                      decoration: BoxDecoration(
                                        color: CustomAppColor.of(context).primary,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: CustomAppColor.of(context).bgScaffold, width: 1),
                                      ),
                                      child: CommonText(
                                        text: category.discount,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.setFontSize,
                                        textColor: CustomAppColor.of(context).white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.setHeight),
                          ],
                        ),
                        SizedBox(width: 21.setWidth),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: category.restaurantName,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.setFontSize,
                            ),
                            SizedBox(height: 4.setHeight),
                            CommonText(
                              text: category.cuisineType.join(", "),
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(height: 6.setHeight),
                            CommonText(
                              text: "${category.location} | ${category.distance}",
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(height: 14.setHeight),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: CustomAppColor.of(context).containerBorder,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.icStarYellow,
                                        width: 12.setWidth,
                                        height: 12.setHeight,
                                      ),
                                      SizedBox(width: 4.setWidth),
                                      CommonText(
                                        text: category.rating.toString(),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.setFontSize,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 14.setWidth),
                                CommonText(
                                  text: "${category.time} min | \$${category.price}",
                                  fontSize: 13.setFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.setHeight),
                            Container(
                              color: CustomAppColor.of(context).containerBorder,
                              height: 1.setHeight,
                              width: 188.setWidth,
                            ),
                            SizedBox(height: 6.setHeight),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.icDiscount,
                                  height: 19.setHeight,
                                  width: 18.setWidth,
                                ),
                                SizedBox(width: 10.setWidth),
                                CommonText(
                                  text: category.discountDetail,
                                  fontSize: 13.setFontSize,
                                  fontWeight: FontWeight.w400,
                                  textColor: CustomAppColor.of(context).txtGrey,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.setHeight),
                          ],
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ],
    );
  }
}

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 59.setHeight),
        Image.asset(
          AppAssets.imgEmptySearch,
          width: 220.setWidth,
          height: 207.setHeight,
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSearchNotFound,
          fontSize: 22.setFontSize,
          fontWeight: FontWeight.w700,
        ),
        CommonText(
          text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtGrey,
        )
      ],
    );
  }
}
