import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/ui/add_address/views/add_address_screen.dart';
import 'package:food_delivery_app_package/ui/all_category/views/all_category_screen.dart';
import 'package:food_delivery_app_package/ui/home/datamodels/home_data.dart';
import 'package:food_delivery_app_package/ui/manage_address/views/manage_address_screen.dart';
import 'package:food_delivery_app_package/ui/near_you/views/near_you_screen.dart';
import 'package:food_delivery_app_package/ui/search/views/search_screen.dart';
import 'package:food_delivery_app_package/ui/view_restaurant/views/view_restaurant_screen.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../all_category_list/views/all_category_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> newOffersList = [];
  List<FoodCategoryData> topCategoryList = [];
  List<RestaurantData> nearYouList = [];
  List<BrandsData> brandList = [];
  List<RestaurantData> restaurantList = [];

  void fillData() {
    newOffersList = [
      AppAssets.imgHomeBanner1,
      AppAssets.imgHomeBanner2,
      AppAssets.imgHomeBanner1,
    ];
    topCategoryList = [
      FoodCategoryData(
        foodName: "Burgers",
        imageUrl: AppAssets.imgLogoBurger,
        totalPlaces: "1126 places",
      ),
      FoodCategoryData(
        foodName: "Fries",
        imageUrl: AppAssets.imgLogoFrenchFries,
        totalPlaces: "142 places",
      ),
      FoodCategoryData(
        foodName: "Pizza",
        imageUrl: AppAssets.imgLogoPizza,
        totalPlaces: "365 places",
      ),
      FoodCategoryData(
        foodName: "Chinese",
        imageUrl: AppAssets.imgLogoChinese,
        totalPlaces: "564 places",
      ),
    ];
    nearYouList = [
      RestaurantData(
          restaurantImage: AppAssets.imgChickenSpeghetti,
          restaurantName: "Veg Noodles",
          cuisineType: ["Mexican", "Italian", "Chinese"],
          location: "Broadway NY",
          distance: "5 km",
          rating: 4.5,
          time: 30,
          discountDetail: "50% off upto \$ 100",
          discount: "50% OFF",
          price: "199"),
      RestaurantData(
          restaurantImage: AppAssets.imgChickenSpeghetti,
          restaurantName: "Veg Noodles",
          cuisineType: ["Mexican", "Italian", "Chinese"],
          location: "Broadway NY",
          distance: "5 km",
          rating: 4.5,
          time: 30,
          discountDetail: "50% off upto \$ 100",
          discount: "50% OFF",
          price: "199"),
    ];
    brandList = [
      BrandsData(
        brandImageUrl: AppAssets.imgLogoPizzaHut,
        brandDiscount: "50% OFF",
        brandName: "Pizza Hut",
        time: 63,
      ),
      BrandsData(
        brandImageUrl: AppAssets.imgLogoBurgerKing,
        brandDiscount: "50% OFF",
        brandName: "Burger King",
        time: 63,
      ),
      BrandsData(
        brandImageUrl: AppAssets.imgLogoCafeCoffeeDayKing,
        brandDiscount: "50% OFF",
        brandName: "Cafe Coffee Day",
        time: 63,
      ),
      BrandsData(
        brandImageUrl: AppAssets.imgLogoKfc,
        brandDiscount: "50% OFF",
        brandName: "KFC",
        time: 63,
      ),
      BrandsData(
        brandImageUrl: AppAssets.imgLogoMacDonald,
        brandDiscount: "50% OFF",
        brandName: "Mac Donald",
        time: 63,
      ),
      BrandsData(
        brandImageUrl: AppAssets.imgLogoStarbucks,
        brandDiscount: "50% OFF",
        brandName: "Subway",
        time: 63,
      ),
    ];
    restaurantList = [
      RestaurantData(
        restaurantImage: AppAssets.imgChickenSpeghetti,
        restaurantName: "The Garden Restaurant",
        cuisineType: ["Mexican", "Italian", "Chinese"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
      RestaurantData(
        restaurantImage: AppAssets.imgChickenSpeghetti,
        restaurantName: "The Garden Restaurant",
        cuisineType: ["Mexican", "Italian", "Chinese"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
      RestaurantData(
        restaurantImage: AppAssets.imgChickenSpeghetti,
        restaurantName: "The Garden Restaurant",
        cuisineType: ["Mexican", "Italian", "Chinese"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
      RestaurantData(
        restaurantImage: AppAssets.imgChickenSpeghetti,
        restaurantName: "The Garden Restaurant",
        cuisineType: ["Mexican", "Italian", "Chinese"],
        location: "Broadway NY",
        distance: "5 km",
        rating: 4.5,
        time: 30,
        discountDetail: "50% off upto \$ 100",
        discount: "50% OFF",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            const TopBarView(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NewOfferCardView(newOfferList: newOffersList),
                    SizedBox(height: 24.setHeight),
                    TopCategoriesView(topCategoryList: topCategoryList),
                    SizedBox(height: 20.setHeight),
                    NearYouView(nearYouList: nearYouList),
                    SizedBox(height: 20.setHeight),
                    PopularBrandsView(popularBrandsList: brandList),
                    SizedBox(height: 20.setHeight),
                    AllRestaurantView(allRestaurantList: restaurantList)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarView extends StatelessWidget {
  const TopBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Hello,Brayden",
                      fontWeight: FontWeight.w600,
                      fontSize: 22.setFontSize,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    InkWell(
                      onTap: () => changeLocationBs(context),
                      child: Row(
                        children: [
                          CommonText(
                            text: "Home | 47 W 1...",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.setFontSize,
                            textColor: CustomAppColor.of(context).txtGrey,
                          ),
                          Image.asset(
                            AppAssets.icDownOrangeArrow,
                            width: 22.setWidth,
                            height: 22.setHeight,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CircleAvatar(child: Image.asset(AppAssets.imgUserProfile)),
            ],
          ),
          SizedBox(height: 14.setHeight),
          CommonTextFormFieldWithPrefix(
            onTap: () => Navigator.push(context, SearchScreen.route()),
            controller: searchController,
            hintText: Languages.of(context).txtRestaurantNameCuisineOrDish,
            prefixIcon: AppAssets.icSearch,
          )
        ],
      ),
    );
  }

  void changeLocationBs(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (dialogContext) {
        return SafeArea(
          bottom: false,
          top: false,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.setWidth,
                    vertical: 20.setHeight,
                  ).copyWith(
                    bottom: MediaQuery.of(context).padding.bottom + 20.setHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 19.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtSelectDeliveryLocation.toUpperCase(),
                            fontWeight: FontWeight.w700,
                            fontSize: 15.setFontSize,
                            textColor: CustomAppColor.of(context).txtGrey,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(context, ManageAddressScreen.route()),
                            child: CommonText(
                              text: Languages.of(context).txtCHANGE.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.setFontSize,
                              textColor: CustomAppColor.of(context).primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.icSetDeliveryLocation,
                            height: 23.setHeight,
                            width: 23.setWidth,
                          ),
                          SizedBox(width: 7.setWidth),
                          CommonText(
                            text: "Cooper Square",
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontSize: 22.setFontSize,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.3,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.setHeight),
                      CommonText(
                        text: "47 W 13th St, New York, NY 10011, USA",
                        textColor: CustomAppColor.of(context).txtBlack,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.3,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtAddNewAddress.toUpperCase(),
                        borderColor: CustomAppColor.of(context).primary,
                        buttonColor: CustomAppColor.of(context).bgScaffold,
                        buttonTextColor: CustomAppColor.of(context).txtBlack,
                        onTap: () {
                          Navigator.pop(dialogContext);
                          Navigator.push(context, AddAddressScreen.route());
                        },
                      ),
                      SizedBox(height: 25.setHeight),
                      CommonButton(
                        onTap: () {
                          if (dialogContext.mounted) {
                            Navigator.pop(dialogContext);
                          }
                        },
                        text: Languages.of(context).txtConfirmLocation.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -25.setHeight,
                  right: 0.setWidth,
                  left: 0.setWidth,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.setHeight,
                        horizontal: 14.setWidth,
                      ),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScaffold,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomAppColor.of(context).primary,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: CustomAppColor.of(context).icBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NewOfferCardView extends StatefulWidget {
  final List<String> newOfferList;
  const NewOfferCardView({super.key, required this.newOfferList});

  @override
  State<NewOfferCardView> createState() => _NewOfferCardViewState();
}

class _NewOfferCardViewState extends State<NewOfferCardView> {
  int _currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.newOfferList.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 155.setHeight,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 20.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.newOfferList.length, (index) {
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
        )
      ],
    );
  }
}

class TopCategoriesView extends StatelessWidget {
  final List<FoodCategoryData> topCategoryList;

  const TopCategoriesView({super.key, required this.topCategoryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTopCategories,
                fontWeight: FontWeight.w700,
                fontSize: 22.setFontSize,
              ),
              InkWell(
                onTap: () => Navigator.push(context, AllCategoryScreen.route()),
                child: Row(
                  children: [
                    CommonText(
                      text: Languages.of(context).txtShowAll,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(width: 8.setWidth),
                    Image.asset(
                      AppAssets.icRightOrangeArrow,
                      height: 10.setHeight,
                      width: 8.setWidth,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.setHeight),
        SizedBox(
          height: 150.setHeight,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: topCategoryList.length,
            padding: EdgeInsets.only(left: 10.setWidth),
            itemBuilder: (context, index) {
              final category = topCategoryList[index];
              return Padding(
                padding: EdgeInsets.only(left: 14.setWidth, right: 5.setWidth),
                child: InkWell(
                  onTap: () => Navigator.push(context, AllCategoryListScreen.route()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: CustomAppColor.of(context).containerBorder,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
                        child: Image.asset(
                          category.imageUrl,
                          width: 44.setHeight,
                          height: 44.setHeight,
                        ),
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: category.foodName,
                        fontSize: 17.setFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 2.setHeight),
                      CommonText(
                        text: category.totalPlaces,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGrey,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NearYouView extends StatelessWidget {
  final List<RestaurantData> nearYouList;

  const NearYouView({super.key, required this.nearYouList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTopRatedFood,
                fontWeight: FontWeight.w700,
                fontSize: 22.setFontSize,
              ),
              InkWell(
                onTap: () => Navigator.push(context, NearYouScreen.route()),
                child: Row(
                  children: [
                    CommonText(
                      text: Languages.of(context).txtShowAll,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(width: 8.setWidth),
                    Image.asset(
                      AppAssets.icRightOrangeArrow,
                      height: 10.setHeight,
                      width: 8.setWidth,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SizedBox(
          height: 310.setHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nearYouList.length,
            padding: EdgeInsets.only(left: 10.setWidth),
            itemBuilder: (context, index) {
              final category = nearYouList[index];
              return Padding(
                padding: EdgeInsets.only(left: 14.setWidth, right: 10.setWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        child: Image.asset(
                          category.restaurantImage,
                          height: 218.setHeight,
                          width: 272.setHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: category.restaurantName,
                      fontSize: 17.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonText(
                      text: category.location,
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(height: 11.setHeight),
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
                          text: "${category.time} min  |  \$${category.price} for two",
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    )
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

class PopularBrandsView extends StatelessWidget {
  final List<BrandsData> popularBrandsList;

  const PopularBrandsView({super.key, required this.popularBrandsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtPopularBrands,
                fontWeight: FontWeight.w700,
                fontSize: 22.setFontSize,
              ),
              Row(
                children: [
                  CommonText(
                    text: Languages.of(context).txtShowAll,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.setFontSize,
                    textColor: CustomAppColor.of(context).primary,
                  ),
                  SizedBox(width: 8.setWidth),
                  Image.asset(
                    AppAssets.icRightOrangeArrow,
                    height: 10.setHeight,
                    width: 8.setWidth,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: popularBrandsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.setWidth,
              mainAxisSpacing: 14.setHeight,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final category = popularBrandsList[index];
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: CustomAppColor.of(context).bgScaffold, shape: BoxShape.circle, border: Border.all(color: CustomAppColor.of(context).containerBorder)),
                        padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
                        child: Image.asset(
                          category.brandImageUrl,
                          height: 60.setHeight,
                          width: 60.setWidth,
                        ),
                      ),
                      Positioned(
                        bottom: -4.setHeight,
                        left: 20.setWidth,
                        right: 20.setWidth,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: CustomAppColor.of(context).containerBorder),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 3.setWidth, vertical: 3.setHeight),
                          child: CommonText(
                            text: category.brandDiscount,
                            fontSize: 10.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: category.brandName,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12.setFontSize,
                  ),
                  CommonText(
                    text: "${category.time.toString()} mins",
                    fontWeight: FontWeight.w500,
                    fontSize: 10.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class AllRestaurantView extends StatelessWidget {
  final List<RestaurantData> allRestaurantList;

  const AllRestaurantView({super.key, required this.allRestaurantList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: CommonText(
            text: Languages.of(context).txtAllRestaurant,
            fontWeight: FontWeight.w700,
            fontSize: 22.setFontSize,
          ),
        ),
        SizedBox(height: 5.setHeight),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: allRestaurantList.length,
          padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
          itemBuilder: (context, index) {
            final category = allRestaurantList[index];
            return InkWell(
              onTap: () => Navigator.push(context, ViewRestaurantScreen.route()),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
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
                                  width: 112.setWidth,
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
                      SizedBox(width: 15.setWidth),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: category.restaurantName,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.setFontSize,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.setHeight),
                          Wrap(
                            children: List.generate(
                              category.cuisineType.length * 2 - 1,
                              (index) {
                                if (index.isOdd) {
                                  return CommonText(
                                    text: ',  ',
                                    fontSize: 13.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                  );
                                } else {
                                  final foodIndex = index ~/ 2;
                                  return CommonText(
                                    text: category.cuisineType[foodIndex],
                                    fontSize: 13.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 3.setHeight),
                          CommonText(
                            text: "${category.location} | ${category.distance}",
                            fontSize: 13.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGrey,
                          ),
                          SizedBox(height: 11.setHeight),
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
                                text: "${category.time} min",
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
                          SizedBox(height: 9.setHeight),
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
                          )
                        ],
                      ),
                    ],
                  )),
            );
          },
        ),
      ],
    );
  }
}
