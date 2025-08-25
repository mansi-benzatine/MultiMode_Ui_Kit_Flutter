import 'package:car_shop_screens_app_package/localization/language/languages.dart';
import 'package:car_shop_screens_app_package/utils/constant.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../all_brand/view/all_brand_screen.dart';
import '../../brand_car_list/view/brand_car_list_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../popular_cars/view/polpular_cars_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';
import '../../search/view/search_screen.dart';
import '../../sell_car/view/sell_car_screen.dart';
import '../../used_car/view/used_car_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(String name) onTopBarClick;

  const HomeScreen({super.key, required this.onTopBarClick});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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

  List<PopularCarItem> popularCars = [
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla2, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];

  List<PopularCarItem> carsByBudget = [
    PopularCarItem(carName: "Toyota Fortuner", carImage: AppAssets.imgToyota, carPrice: "5 Lakh", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Toyota", carImage: AppAssets.imgToyota2, carPrice: "10 Lakh", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];

  List<MostSearchedCarItem> mostSearchedCars = [
    MostSearchedCarItem(carName: "Lamborghini", carImage: [AppAssets.imgMostSearch1, AppAssets.imgMostSearch2], carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    MostSearchedCarItem(carName: "BMW", carImage: [AppAssets.imgMostSearch3, AppAssets.imgMostSearch2], carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];
  final Set<int> favoriteIndexes = {};
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // rebuild when index changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _topBar(),
            _searchBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 5.setHeight, bottom: 120.setHeight),
                child: Column(
                  children: [
                    _featuredCars(),
                    SizedBox(height: 10.setHeight),
                    _brandList(),
                    SizedBox(height: 10.setHeight),
                    _popularCars(),
                    SizedBox(height: 10.setHeight),
                    _mostSearchedCars(),
                    SizedBox(height: 10.setHeight),
                    _carsByBudget(),
                    SizedBox(height: 20.setHeight),
                    _latestCars(),
                    SizedBox(height: 10.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 20.setWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              AppAssets.imgDummyGirl,
              width: 50.setWidth,
              height: 50.setHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtHello,
                  fontSize: 20.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
                CommonText(
                  text: 'Mona Lisa',
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(width: 20.setWidth),
          IgnorePointer(
            ignoring: true,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
              },
              child: Image.asset(
                AppAssets.icNotification,
                width: 28.setWidth,
                height: 28.setHeight,
                fit: BoxFit.contain,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 0.setHeight),
            margin: EdgeInsets.only(bottom: 10.setHeight, left: 20.setWidth, right: 20.setWidth, top: 5.setHeight),
            height: 40.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSearchBar,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icSearch,
                  width: 15.setWidth,
                  height: 15.setHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 15.setWidth),
                CommonText(text: Languages.of(context).txtSearch, fontSize: 12.setFontSize, fontWeight: FontWeight.w400, textColor: CustomAppColor.of(context).txtGray),
              ],
            ),
          )),
    );
  }

  Widget _featuredCars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100.setWidth,
          height: 100.setHeight,
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
          margin: EdgeInsets.only(left: 20.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgNewCar,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(AppAssets.imgNewCar),
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: Languages.of(context).txtNewCar,
                fontSize: 10.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(height: 10.setHeight),
            ],
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SellCarScreen()));
            },
            child: Container(
              width: 100.setWidth,
              height: 100.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgSellCar,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(AppAssets.imgSellCar),
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: Languages.of(context).txtSellCar,
                    fontSize: 10.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 10.setHeight),
                ],
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UsedCarScreen())).then((value) {
                if (value == Constant.strFavorite) {
                  widget.onTopBarClick(Constant.strFavorite);
                }
              });
            },
            child: Container(
              width: 100.setWidth,
              height: 100.setHeight,
              margin: EdgeInsets.only(right: 20.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgUsedCar,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      AppAssets.imgUsedCar,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: Languages.of(context).txtUsedCar,
                    fontSize: 10.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 10.setHeight),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _brandList() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtBrands,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AllBrandScreen()));
                  },
                  child: CommonText(
                    text: Languages.of(context).txtSeeAll,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtSeeAll,
                  ),
                ),
              ),
              SizedBox(width: 20.setWidth),
            ],
          ),
          SizedBox(height: 10.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: Row(
                children: List.generate(
                  brandList.length,
                  (index) => InkWell(
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
                              color: (brandList[index].brandImage == AppAssets.icAudi || brandList[index].brandImage == AppAssets.icJaguar) ? CustomAppColor.of(context).txtBlack : null,
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
        ],
      ),
    );
  }

  Widget _mostSearchedCars() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtMostSearchedCars,
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
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(mostSearchedCars.length, (index) {
                return _itemMostSearchedCars(mostSearchedCars[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemMostSearchedCars(MostSearchedCarItem mostSearchedCar) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
      margin: EdgeInsets.only(right: 10.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: mostSearchedCar.carName,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            letterSpacing: 0.2,
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
              Container(
                width: 90.setWidth,
                height: 64.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomAppColor.of(context).bgSearchBar,
                ),
                padding: EdgeInsets.only(
                  left: 10.setWidth,
                  top: 10.setHeight,
                ),
                child: Image.asset(mostSearchedCar.carImage[0], fit: BoxFit.contain),
              ),
              SizedBox(width: 10.setWidth),
              Container(
                width: 90.setWidth,
                height: 64.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomAppColor.of(context).bgSearchBar,
                ),
                padding: EdgeInsets.only(
                  left: 10.setWidth,
                  top: 10.setHeight,
                  bottom: 10.setHeight,
                ),
                child: Image.asset(mostSearchedCar.carImage[1], fit: BoxFit.contain),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _popularCars() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.setWidth),
            CommonText(
              text: Languages.of(context).txtPopularCars,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            const Spacer(),
            IgnorePointer(
              ignoring: true,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PolpularCarsScreen(cars: popularCars)));
                },
                child: CommonText(
                  text: Languages.of(context).txtSeeAll,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtSeeAll,
                ),
              ),
            ),
            SizedBox(width: 20.setWidth),
          ],
        ),
        SizedBox(height: 15.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: List.generate(popularCars.length, (index) {
              return _itemPopularCars(popularCars[index], index);
            }),
          ),
        ),
      ],
    );
  }

  Widget _itemPopularCars(PopularCarItem popularCar, int index) {
    return CarItemWidget(
      car: popularCar,
      isFavorite: favoriteIndexes.contains(index),
      marginRight: 15.setWidth,
      onFavoriteToggle: () {
        setState(() {
          if (favoriteIndexes.contains(index)) {
            favoriteIndexes.remove(index);
          } else {
            favoriteIndexes.add(index);
          }
        });
      },
    );
  }

  Widget _latestCars() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.setWidth),
            CommonText(
              text: Languages.of(context).txtLatestCars,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: List.generate(popularCars.length, (index) {
              return _itemPopularCars(popularCars[index], index);
            }),
          ),
        ),
      ],
    );
  }

  Widget _carsByBudget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.setWidth),
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
            SizedBox(width: 20.setWidth),
          ],
        ),
        SizedBox(height: 5.setHeight),
        AnimatedBuilder(
          animation: _tabController,
          builder: (context, _) {
            return TabBar(
              controller: _tabController,
              indicatorColor: CustomAppColor.of(context).primary,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(
                  child: CommonText(
                    text: "1-5 Lakh",
                    fontSize: 12.setFontSize,
                    fontWeight: _tabController.index == 0 ? FontWeight.w600 : FontWeight.w500,
                    textColor: _tabController.index == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Tab(
                  child: CommonText(
                    text: "5-10 Lakh",
                    fontSize: 12.setFontSize,
                    fontWeight: _tabController.index == 1 ? FontWeight.w600 : FontWeight.w500,
                    textColor: _tabController.index == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Tab(
                  child: CommonText(
                    text: "10-15 Lakh",
                    fontSize: 12.setFontSize,
                    fontWeight: _tabController.index == 2 ? FontWeight.w600 : FontWeight.w500,
                    textColor: _tabController.index == 2 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  ),
                ),
                Tab(
                  child: CommonText(
                    text: "15-20 Lakh",
                    fontSize: 12.setFontSize,
                    fontWeight: _tabController.index == 3 ? FontWeight.w600 : FontWeight.w500,
                    textColor: _tabController.index == 3 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 15.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
}

class MyPainter extends CustomPainter {
  final BuildContext context;

  MyPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = CustomAppColor.of(context).bgSearchBar;
    path = Path();
    path.lineTo(size.width * 0.67, 0);
    path.cubicTo(size.width * 0.72, 0, size.width * 0.76, size.height * 0.05, size.width * 0.76, size.height * 0.12);
    path.cubicTo(size.width * 0.76, size.height * 0.12, size.width * 0.76, size.height * 0.14, size.width * 0.76, size.height * 0.14);
    path.cubicTo(size.width * 0.76, size.height / 5, size.width * 0.81, size.height * 0.26, size.width * 0.86, size.height * 0.26);
    path.cubicTo(size.width * 0.86, size.height * 0.26, size.width * 0.9, size.height * 0.26, size.width * 0.9, size.height * 0.26);
    path.cubicTo(size.width * 0.96, size.height * 0.26, size.width, size.height * 0.32, size.width, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.38, size.width, size.height * 0.88, size.width, size.height * 0.88);
    path.cubicTo(size.width, size.height * 0.95, size.width * 0.96, size.height, size.width * 0.9, size.height);
    path.cubicTo(size.width * 0.9, size.height, size.width * 0.1, size.height, size.width * 0.1, size.height);
    path.cubicTo(size.width * 0.04, size.height, 0, size.height * 0.95, 0, size.height * 0.88);
    path.cubicTo(0, size.height * 0.88, 0, size.height * 0.12, 0, size.height * 0.12);
    path.cubicTo(0, size.height * 0.05, size.width * 0.04, 0, size.width * 0.1, 0);
    path.cubicTo(size.width * 0.1, 0, size.width * 0.67, 0, size.width * 0.67, 0);
    path.cubicTo(size.width * 0.67, 0, size.width * 0.67, 0, size.width * 0.67, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class PopularCarItem {
  final String carName;
  final String carImage;
  final String carPrice;
  final String carDescription;
  final String? carType;
  bool isFavorite;

  PopularCarItem({required this.carName, required this.carImage, required this.carPrice, required this.carDescription, this.carType, this.isFavorite = false});
}

class MostSearchedCarItem {
  final String carName;
  final List<String> carImage;
  final String carPrice;
  final String carDescription;

  MostSearchedCarItem({required this.carName, required this.carImage, required this.carPrice, required this.carDescription});
}

class CarItemWidget extends StatelessWidget {
  final PopularCarItem car;
  final double? width;
  final double? height;
  final double? marginRight;
  final double? favTop;
  final double? favRight;
  final Function()? onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const CarItemWidget({super.key, required this.car, this.width, this.height, this.marginRight, this.favTop, this.favRight, this.onTap, this.isFavorite = false, this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            /*if (car.carType == Constant.strUsedCar) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UsedCarDetailScreen()));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailScreen(car: car)));
            }*/
          },
      child: Container(
        width: width ?? 300.setWidth,
        height: height ?? 230.setHeight,
        margin: EdgeInsets.only(right: marginRight ?? 0.setWidth),
        child: Stack(
          children: [
            CustomPaint(
              size: Size(width ?? 300.setWidth, height ?? 240.setHeight),
              painter: MyPainter(context: context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.setWidth, right: 120.setWidth, top: 16.setHeight, bottom: 10.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (car.carType == Constant.strNewCar)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 4.setHeight),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgNewCarChip,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(bottom: 5.setHeight),
                      child: CommonText(
                        text: Languages.of(context).txtNewCar,
                        fontSize: 8.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtWhite,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  if (car.carType == Constant.strUsedCar)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 4.setHeight),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgUsedCarChip,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(bottom: 5.setHeight),
                      child: CommonText(
                        text: Languages.of(context).txtUsedCar,
                        fontSize: 8.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtWhite,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  CommonText(
                    text: car.carName,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: car.carDescription,
                    fontSize: 9.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: car.carPrice,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0.setWidth,
              top: 80.setHeight,
              child: Image.asset(
                car.carImage,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 5.setHeight,
              right: 20.setWidth,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  onFavoriteToggle?.call();
                },
                child: Container(
                  width: 44.setWidth,
                  height: 44.setHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: CustomAppColor.of(context).primaryGradient,
                  ),
                  padding: EdgeInsets.all(13.setWidth),
                  child: Image.asset(
                    isFavorite ? AppAssets.icFilledFavourite : AppAssets.icTabFavourite,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).white,
                    width: 20.setWidth,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
