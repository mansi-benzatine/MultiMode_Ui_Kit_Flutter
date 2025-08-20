import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/filter_bottom_sheet.dart';
import '../../../dialogs/bottom_sheet/sort_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../brand_car_list/view/brand_car_list_screen.dart';
import '../../home/view/home_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';
import '../../search/view/search_screen.dart';

class UsedCarScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => UsedCarScreen());
  }

  const UsedCarScreen({super.key});

  @override
  State<UsedCarScreen> createState() => _UsedCarScreenState();
}

class _UsedCarScreenState extends State<UsedCarScreen> with TickerProviderStateMixin implements TopBarClickListener {
  List<YourFavBrandItem> brandList = [
    YourFavBrandItem(brandName: "Mercedes", brandImage: AppAssets.icMercedes, isSelected: true),
    YourFavBrandItem(brandName: "Toyota", brandImage: AppAssets.icToyota, isSelected: false),
    YourFavBrandItem(brandName: "Audi", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "BMW", brandImage: AppAssets.icBmw, isSelected: false),
    YourFavBrandItem(brandName: "Tesla", brandImage: AppAssets.icTesla, isSelected: false),
    YourFavBrandItem(brandName: "Jaguar", brandImage: AppAssets.icJaguar, isSelected: false),
    YourFavBrandItem(brandName: "Ferrari", brandImage: AppAssets.icFerrari, isSelected: false),
    YourFavBrandItem(brandName: "Lamborghini", brandImage: AppAssets.icLamborghini, isSelected: false),
  ];

  List<PopularCarItem> carList = [
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla2, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];

  List<PopularCarItem> carsByBudget = [
    PopularCarItem(carName: "Toyota Fortuner", carImage: AppAssets.imgToyota, carPrice: "5 Lakh", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Toyota", carImage: AppAssets.imgToyota2, carPrice: "10 Lakh", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Mercedes", carImage: AppAssets.imgMercedes2, carPrice: "10 Lakh", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];

  List<MostSearchedCarItem> recentViewedCars = [
    MostSearchedCarItem(carName: "Lamborghini 2016", carImage: [AppAssets.imgMostSearch1, AppAssets.imgMostSearch2], carPrice: "\$40,750", carDescription: "New York, USA"),
    MostSearchedCarItem(carName: "Lamborghini 2016", carImage: [AppAssets.imgMostSearch3, AppAssets.imgMostSearch2], carPrice: "\$40,750", carDescription: "New York, USA"),
    MostSearchedCarItem(carName: "Lamborghini 2016", carImage: [AppAssets.imgMostSearch1, AppAssets.imgMostSearch3], carPrice: "\$40,750", carDescription: "New York, USA"),
  ];
  final Set<int> favouriteIndexes = {};
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtUsedCar,
              isShowBack: true,
              isShowSearch: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.setHeight),
                    _buildFilesSorting(),
                    _brandList(),
                    SizedBox(height: 10.setHeight),
                    _carList(),
                    _recentViewedCars(),
                    SizedBox(height: 30.setHeight),
                    _carsByBudget(),
                    SizedBox(height: 20.setHeight),
                    _carsNearYou(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilesSorting() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  backgroundColor: CustomAppColor.of(context).txtWhite,
                  useSafeArea: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => const FilterBottomSheet(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icFilter,
                    width: 20.setWidth,
                    height: 20.setHeight,
                    fit: BoxFit.contain,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(width: 8.setWidth),
                  CommonText(
                    text: Languages.of(context).txtFilter,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            color: CustomAppColor.of(context).containerBorder,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  backgroundColor: CustomAppColor.of(context).txtWhite,
                  useSafeArea: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                  builder: (context) => const SortBottomSheet(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icSort,
                    width: 20.setWidth,
                    height: 20.setHeight,
                    fit: BoxFit.contain,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(width: 8.setWidth),
                  CommonText(
                    text: Languages.of(context).txtSort,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandList() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.setWidth),
        child: Row(
          children: List.generate(
            brandList.length,
            (index) => IgnorePointer(
              ignoring: true,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrandCarListScreen(brand: brandList[index])));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                      color: CustomAppColor.of(context).txtGray,
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10.setWidth),
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 8.setHeight),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.setHeight,
                        child: Image.asset(
                          brandList[index].brandImage,
                          fit: BoxFit.contain,
                          color: (brandList[index].brandImage == AppAssets.icJaguar || brandList[index].brandImage == AppAssets.icAudi) ? CustomAppColor.of(context).txtBlack : null,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: brandList[index].brandName,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _carList() {
    return ListView.builder(
      itemCount: carList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.setHeight),
          child: CarItemWidget(
            car: carList[index],
            isFavorite: favouriteIndexes.contains(index),
            width: 0.screenWidth,
            height: 240.setHeight,
            favTop: 5.setHeight,
            favRight: 25.setWidth,
            onFavoriteToggle: () {
              setState(() {
                if (favouriteIndexes.contains(index)) {
                  favouriteIndexes.remove(index);
                } else {
                  favouriteIndexes.add(index);
                }
              });
            },
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const UsedCarDetailScreen()));
            },
          ),
        );
      },
    );
  }

  Widget _recentViewedCars() {
    return SizedBox(
      height: 220.setHeight,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtRecentlyViewedCars,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              itemCount: recentViewedCars.length,
              itemBuilder: (context, index) {
                final car = recentViewedCars[index];
                return Container(
                  width: 145.setWidth,
                  margin: EdgeInsets.only(right: 16.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: CustomAppColor.of(context).containerBorder,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(12.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Car Image
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CustomAppColor.of(context).containerBorder,
                          ),
                          padding: EdgeInsets.all(10.setWidth),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              car.carImage.isNotEmpty ? car.carImage[0] : AppAssets.imgMostSearch1,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: CustomAppColor.of(context).bgScreen,
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 40.setWidth,
                                    color: CustomAppColor.of(context).txtGray,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      // Car Details
                      CommonText(
                        text: car.carName,
                        fontSize: 10.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 4.setHeight),

                      // Car Price
                      CommonText(
                        text: car.carPrice,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 4.setHeight),

                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12.setWidth,
                            color: CustomAppColor.of(context).txtGray,
                          ),
                          SizedBox(width: 4.setWidth),
                          Expanded(
                            child: CommonText(
                              text: car.carDescription,
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGray,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _carsByBudget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: Languages.of(context).txtCarsByBudget,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: TabBar(
            indicatorColor: CustomAppColor.of(context).primary,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            labelColor: CustomAppColor.of(context).primary,
            unselectedLabelColor: CustomAppColor.of(context).txtBlack,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 20.setWidth),
            labelStyle: TextStyle(
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
            ),
            controller: _tabController,
            tabs: [
              Tab(
                text: "1-5 Lakh",
                height: 30.setHeight,
              ),
              Tab(
                text: "5-10 Lakh",
                height: 30.setHeight,
              ),
              Tab(
                text: "10-15 Lakh",
                height: 30.setHeight,
              ),
              Tab(
                text: "15-20 Lakh",
                height: 30.setHeight,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 20.setWidth),
          child: Row(
            children: List.generate(carsByBudget.length, (index) {
              return _itemCarsByBudget(carsByBudget[index]);
            }),
          ),
        ),
      ],
    );
  }

  Widget _itemCarsByBudget(PopularCarItem car) {
    return Container(
      width: 160.setWidth,
      height: 160.setHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
      ),
      margin: EdgeInsets.only(right: 10.setWidth),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              car.carImage,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10.setHeight),
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSearchBar,
              border: Border(top: BorderSide(color: CustomAppColor.of(context).containerBorder, width: 1)),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 5.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: car.carName,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                  letterSpacing: 0.2,
                ),
                CommonText(
                  text: car.carPrice,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                  letterSpacing: 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carsNearYou() {
    return SizedBox(
      height: 220.setHeight,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtCarsNearYou,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
              SizedBox(width: 20.setWidth),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              itemCount: recentViewedCars.length,
              itemBuilder: (context, index) {
                final car = recentViewedCars[index];
                return Container(
                  width: 145.setWidth,
                  margin: EdgeInsets.only(right: 16.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: CustomAppColor.of(context).containerBorder,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(12.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Car Image
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CustomAppColor.of(context).containerBorder,
                          ),
                          padding: EdgeInsets.all(10.setWidth),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              car.carImage.isNotEmpty ? car.carImage[0] : AppAssets.imgMostSearch1,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: CustomAppColor.of(context).bgScreen,
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 40.setWidth,
                                    color: CustomAppColor.of(context).txtGray,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      // Car Details
                      CommonText(
                        text: car.carName,
                        fontSize: 10.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 4.setHeight),

                      // Car Price
                      CommonText(
                        text: car.carPrice,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 4.setHeight),

                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12.setWidth,
                            color: CustomAppColor.of(context).txtGray,
                          ),
                          SizedBox(width: 4.setWidth),
                          Expanded(
                            child: CommonText(
                              text: car.carDescription,
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGray,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen()));
    }
  }
}
