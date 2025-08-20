import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';
import '../../search/view/search_screen.dart';

class BrandCarListScreen extends StatefulWidget {
  final YourFavBrandItem brand;
  const BrandCarListScreen({super.key, required this.brand});

  @override
  State<BrandCarListScreen> createState() => _BrandCarListScreenState();
}

class _BrandCarListScreenState extends State<BrandCarListScreen> with TickerProviderStateMixin implements TopBarClickListener {
  List<PopularCarItem> carsByBrand = [];
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = ["All", "Limousine", "Hybrid & El..", "Coupes & C.."];

  @override
  initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    carsByBrand = [
      PopularCarItem(carName: "Mercedes-Benz", carImage: AppAssets.imgMercedes2, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
      PopularCarItem(carName: "Mercedes", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
      PopularCarItem(carName: "Mercedes", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    ];
  }

  final Set<int> favoriteIndexes = {};
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
        child: Column(
          children: [
            TopBar(
              this,
              title: widget.brand.brandName,
              isShowBack: true,
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
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
                  _buildCarList(carsByBrand.where((car) => car.carName.contains("Mercedes")).toList()),
                  _buildCarList(carsByBrand.take(2).toList()),
                  _buildCarList(carsByBrand.take(1).toList()),
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
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 16.setHeight),
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
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.setHeight),
                  child: CarItemWidget(
                    car: cars[index],
                    width: 0.screenWidth,
                    height: 240.setHeight,
                    favTop: 5.setHeight,
                    favRight: 25.setWidth,
                    isFavorite: favoriteIndexes.contains(index),
                    onFavoriteToggle: () {
                      setState(() {
                        if (favoriteIndexes.contains(index)) {
                          favoriteIndexes.remove(index);
                        } else {
                          favoriteIndexes.add(index);
                        }
                      });
                    },
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
