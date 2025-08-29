import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/favourites/views/favourites_screen.dart';
import 'package:food_delivery_screens_app_package/ui/search/views/search_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_cart/views/view_cart_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_restaurant/datamodels/view_restaurant_data.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';

class ViewRestaurantScreen extends StatefulWidget {
  final int totalItems;
  final int totalAmount;
  static Route<void> route({int totalItem = 0, int totalAmount = 0}) {
    return MaterialPageRoute(
        builder: (_) => ViewRestaurantScreen(
              totalItems: totalItem,
              totalAmount: totalAmount,
            ));
  }

  const ViewRestaurantScreen({super.key, this.totalItems = 0, this.totalAmount = 0});

  @override
  State<ViewRestaurantScreen> createState() => _ViewRestaurantScreenState();
}

class _ViewRestaurantScreenState extends State<ViewRestaurantScreen> {
  List<FoodData> recommendedList = [];
  int totalItems = 0;
  int totalAmount = 0;
  void fillData() {
    recommendedList = [
      FoodData(
        foodName: "Testy Burger",
        foodImageUrl: AppAssets.imgComboBurger,
        offer: "Buy 2 Get 1",
        price: 200,
      ),
      FoodData(
        foodName: "Veg Hakka Noodles",
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        offer: "Buy 2 Get 1",
        price: 200,
      ),
      FoodData(
        foodName: "Testy Burger",
        foodImageUrl: AppAssets.imgComboBurger,
        offer: "Buy 2 Get 1",
        price: 200,
      ),
      FoodData(
        foodName: "Testy Burger",
        foodImageUrl: AppAssets.imgComboBurger,
        offer: "Buy 2 Get 1",
        price: 200,
      ),
    ];
  }

  void onCartUpdated() {
    setState(() {
      totalItems = recommendedList.fold(
        0,
        (sum, item) => sum + (item.isAddCart ? item.cartItem : 0),
      );
      totalAmount = recommendedList.fold(
        0,
        (sum, item) => sum + (item.isAddCart ? (item.cartItem) * (item.price ?? 0) : 0),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    fillData();
    totalItems = widget.totalItems;
    totalAmount = widget.totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).detailScreenBg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        leadingWidth: 45,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.setWidth),
          child: IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                AppAssets.icBack,
                width: 18.setWidth,
                height: 15.setHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        actions: [
          IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.push(context, FavouritesScreen.route()),
              child: Image.asset(
                AppAssets.icHeart,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
            ),
          ),
          SizedBox(width: 20.setWidth),
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: EdgeInsets.only(right: 24.setWidth),
              child: InkWell(
                onTap: () => Navigator.push(context, SearchScreen.route()),
                child: Image.asset(
                  AppAssets.icSearch,
                  width: 22.setWidth,
                  height: 22.setHeight,
                  color: CustomAppColor.of(context).icBlack,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const RestaurantDetails(),
                    SizedBox(height: 8.setHeight),
                    RecommendedView(
                      recommendedList: recommendedList,
                      onCartChanged: onCartUpdated,
                    ),
                    const DetailFooterView(),
                  ],
                ),
              ),
            ),
            if (totalItems > 0) ViewCartView(totalItems: totalItems, totalAmount: totalAmount)
          ],
        ),
      ),
    );
  }
}

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  List<OfferData> offerList = [];
  late ScrollController _scrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    double itemWidth = 160.setWidth;
    int index = (offset / itemWidth).round();
    if (index != _currentIndex && index < offerList.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void fillData() {
    offerList = [
      OfferData(
        dealName: "Flat deal",
        dealDetail: "Flat 30% OFF",
        dealCouponDetail: "Use unlimited",
        dealPrice: "Above \$700",
      ),
      OfferData(
        dealName: "Top offer",
        dealDetail: "Buy 2 get 1 free",
        dealCouponDetail: "Use FreeDish",
      ),
      OfferData(
        dealName: "Sale off",
        dealDetail: "50% off in pizza",
        dealCouponDetail: "Use PizzaLove",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 18.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppAssets.imgChickenSpeghetti,
              width: 327.setWidth,
              height: 184.setHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 22.setHeight),
          CommonText(
            text: "The Garden Restaurant",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          CommonText(
            text: "Mexican, Italian, Chinese",
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 2.setHeight),
          CommonText(
            text: "Broadway NY | 5 km",
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.icInfo,
                height: 24.setHeight,
                width: 24.setWidth,
              ),
              SizedBox(width: 4.setWidth),
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtBasedOnDistance,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGrey,
                  letterSpacing: -0.3,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 6.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.setWidth),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icStarBlack,
                            width: 14.setWidth,
                            height: 14.setHeight,
                          ),
                          SizedBox(width: 2.setWidth),
                          CommonText(
                            text: "4.5",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.setFontSize,
                          ),
                          SizedBox(width: 2.setWidth),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: "100+ ratings",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "58 mins",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.setFontSize,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: "Delivery Time",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                        child: CommonText(
                          text: "\$200",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                        child: CommonText(
                          text: "Cost",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.setFontSize,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.setHeight),
          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 20.setHeight),
          SizedBox(
            height: 80.setHeight,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: offerList.length,
              itemBuilder: (context, index) {
                final offer = offerList[index];
                return Container(
                  width: 215.setWidth,
                  margin: EdgeInsets.only(right: 12.setWidth),
                  padding: EdgeInsets.all(10.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CustomAppColor.of(context).containerBorder,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: CommonText(
                          text: offer.dealName.toUpperCase(),
                          fontSize: 11.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).primary,
                        ),
                      ),
                      SizedBox(width: 8.setWidth),
                      Container(
                        width: 1,
                        height: 60.setHeight,
                        color: CustomAppColor.of(context).containerBorder,
                      ),
                      SizedBox(width: 8.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.icDiscount,
                                  width: 20.setWidth,
                                  height: 20.setHeight,
                                ),
                                SizedBox(width: 6.setWidth),
                                CommonText(
                                  text: offer.dealDetail.toUpperCase(),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.setFontSize,
                                ),
                              ],
                            ),
                            SizedBox(height: 14.setHeight),
                            Row(
                              children: [
                                CommonText(
                                  text: offer.dealCouponDetail.toUpperCase(),
                                  fontSize: 11.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtGrey,
                                ),
                                Visibility(
                                  visible: offer.dealPrice != null,
                                  child: CommonText(
                                    text: " | ${offer.dealPrice ?? ""}".toUpperCase(),
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 18.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(offerList.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
                width: _currentIndex == index ? 26.setWidth : 14.setWidth,
                height: 4.setWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: _currentIndex == index ? CustomAppColor.of(context).primary : const Color(0xFFF1F1F4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class RecommendedView extends StatefulWidget {
  final List<FoodData> recommendedList;
  final VoidCallback onCartChanged;
  const RecommendedView({
    super.key,
    required this.recommendedList,
    required this.onCartChanged,
  });

  @override
  State<RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<RecommendedView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 24.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.icLeaf,
                height: 24.setHeight,
                width: 24.setWidth,
              ),
              SizedBox(width: 9.setWidth),
              CommonText(
                text: Languages.of(context).txtPureVeg.toUpperCase(),
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
          SizedBox(height: 25.setHeight),
          Image.asset(AppAssets.imgOfferBanner),
          SizedBox(height: 30.setHeight),
          CommonText(
            text: "${Languages.of(context).txtRecommended}(4)",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.07,
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.recommendedList.length,
            separatorBuilder: (context, index) {
              return Divider(color: CustomAppColor.of(context).containerBorder);
            },
            itemBuilder: (context, index) {
              final food = widget.recommendedList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 25.setHeight),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.icVeg,
                            height: 24.setHeight,
                            width: 24.setWidth,
                          ),
                          SizedBox(height: 11.setHeight),
                          CommonText(
                            text: food.foodName,
                            fontSize: 17.setFontSize,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 4.setHeight),
                          Row(
                            children: [
                              CommonText(
                                text: "\$${food.price.toString()}",
                                fontSize: 17.setFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(width: 13.setWidth),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 4.setHeight),
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                                  border: Border(
                                    left: BorderSide(
                                      color: CustomAppColor.of(context).primary,
                                      width: 2,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: CommonText(
                                  text: food.offer.toUpperCase(),
                                  textColor: CustomAppColor.of(context).primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Image.asset(
                            food.foodImageUrl,
                            fit: BoxFit.cover,
                            width: 112.setWidth,
                            height: 90.setHeight,
                          ),
                        ),
                        Positioned(
                          left: 18.setWidth,
                          right: 18.setWidth,
                          bottom: -14.setHeight,
                          child: Container(
                            width: food.isAddCart ? 73.setWidth : 50.setWidth,
                            constraints: BoxConstraints(minHeight: 26.setHeight),
                            decoration: BoxDecoration(
                              color: food.isAddCart == true ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                              border: Border.all(
                                color: food.isAddCart == true ? CustomAppColor.of(context).containerBorder : CustomAppColor.of(context).bgScaffold,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: food.isAddCart == true
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if ((food.cartItem) >= 1) {
                                              food.cartItem = (food.cartItem) - 1;
                                            } else {
                                              food.isAddCart = false;
                                              food.cartItem = 0;
                                            }
                                          });
                                          widget.onCartChanged();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 4.setWidth),
                                          child: Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: CustomAppColor.of(context).txtGrey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(minHeight: 26.setHeight),
                                        width: 2.setWidth,
                                        color: CustomAppColor.of(context).containerBorder,
                                        padding: EdgeInsets.zero,
                                      ),
                                      CommonText(
                                        text: '${food.cartItem}',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.setFontSize,
                                        textColor: CustomAppColor.of(context).primary,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(minHeight: 26.setHeight),
                                        width: 2.setWidth,
                                        color: CustomAppColor.of(context).containerBorder,
                                        padding: EdgeInsets.zero,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            food.cartItem = (food.cartItem) + 1;
                                          });
                                          widget.onCartChanged();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 4.setWidth),
                                          child: Icon(
                                            Icons.add,
                                            color: CustomAppColor.of(context).txtGrey,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        food.isAddCart = true;
                                        food.cartItem = 0;
                                      });
                                    },
                                    child: CommonText(
                                      text: "${Languages.of(context).txtAdd} +",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.setFontSize,
                                      textColor: CustomAppColor.of(context).white,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class DetailFooterView extends StatelessWidget {
  const DetailFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.setHeight, horizontal: 24.setWidth),
      child: Column(
        children: [
          Image.asset(
            AppAssets.icLogoFasai,
            height: 58.setHeight,
            width: 118.setWidth,
          ),
          SizedBox(height: 16.setHeight),
          CommonText(
            text: "License No. 1234567890",
            textColor: CustomAppColor.of(context).txtGrey,
            fontWeight: FontWeight.w700,
            fontSize: 17.setFontSize,
          ),
          SizedBox(height: 23.setHeight),
          Divider(
            color: CustomAppColor.of(context).divider,
          ),
          SizedBox(height: 23.setHeight),
          CommonText(
            text: "The Garden Restaurant",
            textColor: CustomAppColor.of(context).txtGrey,
            fontWeight: FontWeight.w700,
            fontSize: 22.setFontSize,
            height: 0,
            letterSpacing: -0.41,
          ),
          CommonText(
            text: "(Outlet: New York)",
            textColor: CustomAppColor.of(context).txtGrey,
            fontWeight: FontWeight.w500,
            fontSize: 15.setFontSize,
            height: 0,
            letterSpacing: -0.41,
          ),
          SizedBox(height: 23.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.icSetDeliveryLocation,
                color: CustomAppColor.of(context).grey,
                height: 16.setHeight,
                width: 13.setWidth,
              ),
              SizedBox(width: 10.setWidth),
              CommonText(
                text: "Broadway NY",
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w500,
                fontSize: 15.setFontSize,
                height: 0,
                letterSpacing: -0.41,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ViewCartView extends StatelessWidget {
  final int totalItems;
  final int totalAmount;

  const ViewCartView({super.key, required this.totalItems, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
          color: CustomAppColor.of(context).black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Add ${3 - totalItems} more",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).white,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 4.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                  border: Border(
                    left: BorderSide(color: CustomAppColor.of(context).primary, width: 2),
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: CommonText(
                  text: "Buy 2 get 1".toUpperCase(),
                  textColor: CustomAppColor.of(context).primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonText(
                text: "Item(s) to avail the offer",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).white,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 16.setHeight),
          color: const Color(0xFF7BC242),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "$totalItems item(s)  | \$$totalAmount",
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).white,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, ViewCartScreen.route(isFromDashboard: false, isFromEmptyCart: false)),
                  child: Row(
                    children: [
                      CommonText(
                        text: "View Cart".toUpperCase(),
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(width: 9.setWidth),
                      Image.asset(
                        AppAssets.icCart,
                        height: 24.setHeight,
                        width: 24.setWidth,
                        color: CustomAppColor.of(context).white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
