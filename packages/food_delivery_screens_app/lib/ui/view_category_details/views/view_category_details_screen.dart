import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/ui/favourites/views/favourites_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_cart/views/view_cart_screen.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/datamodels/home_data.dart';
import '../../search/views/search_screen.dart';
import '../../view_restaurant/datamodels/view_restaurant_data.dart';

class ViewCategoryDetailsScreen extends StatefulWidget {
  final int quantity;
  static Route<void> route({int quantity = 0}) {
    return MaterialPageRoute(
        builder: (_) => ViewCategoryDetailsScreen(
              quantity: quantity,
            ));
  }

  const ViewCategoryDetailsScreen({super.key, this.quantity = 0});

  @override
  State<ViewCategoryDetailsScreen> createState() => _ViewCategoryDetailsScreenState();
}

class _ViewCategoryDetailsScreenState extends State<ViewCategoryDetailsScreen> {
  List<FoodDetailData> moreLikeThisList = [];
  int quantity = 0;
  void fillData() {
    moreLikeThisList = [
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Veg Burger", "Fries Finger", "Coke"],
        rating: 4.5,
        time: 30,
        price: 59,
        foodName: "Testy Burger",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Veg Burger", "Fries Finger", "Coke"],
        rating: 4.5,
        time: 30,
        price: 59,
        foodName: "Testy Burger",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Veg Burger", "Fries Finger", "Coke"],
        rating: 4.5,
        time: 30,
        price: 59,
        foodName: "Testy Burger",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Veg Burger", "Fries Finger", "Coke"],
        rating: 4.5,
        time: 30,
        price: 59,
        foodName: "Testy Burger",
      ),
    ];
  }

  void addToCardButtonOnTap() {}
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity = widget.quantity;
  }
  @override
  Widget build(BuildContext context) {
    fillData();
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
                    MoreLikeThisView(moreLikeThisList: moreLikeThisList),
                  ],
                ),
              ),
            ),
            Container(
              color: CustomAppColor.of(context).bgScaffold,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: quantity == 0
                  ? CommonButton(
                      text: Languages.of(context).txtAddCart.toUpperCase(),
                      onTap: () {
                        setState(() {
                          quantity = 1;
                        });
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(minHeight: 36.setHeight),
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomAppColor.of(context).containerBorder),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    } else {
                                      quantity = 0;
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                                  child: Icon(Icons.remove, size: 16, color: CustomAppColor.of(context).txtGrey),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(minHeight: 36.setHeight),
                                width: 1.setWidth,
                                color: CustomAppColor.of(context).containerBorder,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                                child: CommonText(
                                  text: '$quantity',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).primary,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(minHeight: 36.setHeight),
                                width: 1.setWidth,
                                color: CustomAppColor.of(context).containerBorder,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                                  child: Icon(Icons.add, size: 16, color: CustomAppColor.of(context).txtGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 21.setWidth),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: InkWell(
                              onTap: () => Navigator.push(context, ViewCartScreen.route(isFromDashboard: false, isFromEmptyCart: false)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 14.setHeight),
                                color: CustomAppColor.of(context).green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonText(
                                      text: "Total \$${quantity * 59}".toUpperCase(),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.setFontSize,
                                      textColor: CustomAppColor.of(context).white,
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    Image.asset(
                                      AppAssets.icCart,
                                      width: 20.setWidth,
                                      height: 20.setHeight,
                                      color: CustomAppColor.of(context).white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            )
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
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 20.setHeight),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.imgComboBurger,
                width: 327.setWidth,
                height: 184.setHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: CommonText(
              text: "Testy Burger",
              fontSize: 22.setFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: CommonText(
              text: "Veg Burger, Fries Finger, coke",
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: CommonText(
              text: "Broadway NY | 5 km",
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ),
          SizedBox(height: 14.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Row(
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
          ),
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Divider(color: CustomAppColor.of(context).containerBorder),
          ),
          SizedBox(height: 8.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
                          CommonText(
                            text: "4.5",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.setFontSize,
                          ),
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
                          text: "\$59",
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Divider(color: CustomAppColor.of(context).containerBorder),
          ),
          SizedBox(height: 20.setHeight),
          SizedBox(
            height: 80.setHeight,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.setWidth),
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
                                Flexible(
                                  child: CommonText(
                                    text: offer.dealDetail.toUpperCase(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.setFontSize,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.setHeight),
                            Row(
                              children: [
                                Flexible(
                                  child: CommonText(
                                    text: offer.dealCouponDetail.toUpperCase(),
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Visibility(
                                  visible: offer.dealPrice != null,
                                  child: Flexible(
                                    child: CommonText(
                                      text: " | ${offer.dealPrice ?? ""}".toUpperCase(),
                                      fontSize: 11.setFontSize,
                                      fontWeight: FontWeight.w600,
                                      textColor: CustomAppColor.of(context).txtGrey,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
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
          SizedBox(height: 17.setHeight),
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
                  color: _currentIndex == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).pageIndicator,
                ),
              );
            }),
          ),
          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }
}

class MoreLikeThisView extends StatelessWidget {
  final List<FoodDetailData> moreLikeThisList;
  const MoreLikeThisView({super.key, required this.moreLikeThisList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 20.setHeight, bottom: 16.setHeight),
            child: CommonText(
              text: Languages.of(context).txtMoreLikeThis,
              fontSize: 22.setFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: moreLikeThisList.length,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.setWidth,
              mainAxisSpacing: 20.setHeight,
              childAspectRatio: 0.69,
            ),
            itemBuilder: (context, index) {
              final category = moreLikeThisList[index];
              return IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, ViewCategoryDetailsScreen.route()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              category.foodImageUrl,
                              height: 165.setHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.setWidth,
                            top: 10.setHeight,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 2.setHeight),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: CustomAppColor.of(context).containerBorder,
                                  width: 1,
                                ),
                                color: CustomAppColor.of(context).white,
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
                                    textColor: CustomAppColor.of(context).black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: category.foodName,
                        fontSize: 16.setFontSize,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonText(
                        text: category.foodTypes.join(', '),
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "${category.time} min  |  \$${category.price}",
                            fontSize: 13.setFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
