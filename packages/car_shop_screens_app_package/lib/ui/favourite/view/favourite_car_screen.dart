import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';
import '../../search/view/search_screen.dart';

class FavouriteCarScreen extends StatefulWidget {
  const FavouriteCarScreen({super.key});

  @override
  State<FavouriteCarScreen> createState() => _FavouriteCarScreenState();
}

class _FavouriteCarScreenState extends State<FavouriteCarScreen> with TickerProviderStateMixin implements TopBarClickListener {
  List<PopularCarItem> carsByBrand = [];
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = ["All", "New Car", "Used Car"];

  @override
  initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    carsByBrand = [
      PopularCarItem(
        carName: "Mercedes-Benz",
        carImage: AppAssets.imgMercedes2,
        carPrice: "\$32,340",
        carDescription: "New Looks, Longer Range, And Faster Charging Rate",
        carType: Constant.strNewCar,
        isFavorite: true,
      ),
      PopularCarItem(
        carName: "Mercedes",
        carImage: AppAssets.imgMercedes,
        carPrice: "\$32,340",
        carDescription: "New Looks, Longer Range, And Faster Charging Rate",
        carType: Constant.strUsedCar,
        isFavorite: true,
      ),
      PopularCarItem(
        carName: "Mercedes",
        carImage: AppAssets.imgMercedes,
        carPrice: "\$32,340",
        carDescription: "New Looks, Longer Range, And Faster Charging Rate",
        carType: Constant.strUsedCar,
        isFavorite: true,
      ),
      PopularCarItem(
        carName: "Tesla Model Y",
        carImage: AppAssets.imgTesla,
        carPrice: "\$32,340",
        carDescription: "New Looks, Longer Range, And Faster Charging Rate",
        carType: Constant.strNewCar,
        isFavorite: true,
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtFavourite,
              isShowBack: false,
              isShowSearch: true,
            ),
            SizedBox(height: 15.setHeight),
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25.setWidth),
                color: CustomAppColor.of(context).transparent,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 10.setWidth),
              padding: EdgeInsets.only(
                left: 16.setWidth,
              ),
              labelColor: CustomAppColor.of(context).txtWhite,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  _tabController.animateTo(index);
                });
              },
              tabs: List.generate(
                tabList.length,
                (index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.setWidth),
                    gradient: selectedIndex == index ? CustomAppColor.of(context).primaryGradient : null,
                    border: selectedIndex != index
                        ? Border.all(
                            color: CustomAppColor.of(context).tabColor,
                            width: 1,
                          )
                        : null,
                  ),
                  height: 35.setHeight,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.setWidth,
                  ),
                  child: CommonText(
                    text: tabList[index],
                    textColor: selectedIndex == index ? CustomAppColor.of(context).tabSelectedTxtColor : CustomAppColor.of(context).tabTxtColor,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCarList(carsByBrand),
                  _buildCarList(carsByBrand.where((car) => car.carType == Constant.strNewCar).toList()),
                  _buildCarList(carsByBrand.where((car) => car.carType == Constant.strUsedCar).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarList(List<PopularCarItem> cars) {
    return Padding(
      padding: EdgeInsets.only(left: 24.setWidth, top: 16.setHeight),
      child: cars.isEmpty
          ? Center(
              child: Text(
                "No cars available",
                style: TextStyle(
                  fontSize: 16.setFontSize,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ),
            )
          : ListView.builder(
              itemCount: cars.length,
              padding: EdgeInsets.only(bottom: 100.setHeight),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.setHeight),
                  child: CarItemWidget(
                    car: cars[index],
                    width: 0.screenWidth,
                    isFavorite: true,
                    marginRight: 24.setWidth,
                  ),
                );
              },
            ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
    }
  }
}
