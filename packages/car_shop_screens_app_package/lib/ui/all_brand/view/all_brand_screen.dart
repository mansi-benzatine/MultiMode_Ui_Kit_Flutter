import 'package:car_shop_screens_app_package/ui/search/view/search_screen.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../brand_car_list/view/brand_car_list_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';

class AllBrandScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => AllBrandScreen());
  }

  const AllBrandScreen({super.key});

  @override
  State<AllBrandScreen> createState() => _AllBrandScreenState();
}

class _AllBrandScreenState extends State<AllBrandScreen> implements TopBarClickListener {
  List<YourFavBrandItem> yourFavBrandList = [
    YourFavBrandItem(brandName: "Mercedes", brandImage: AppAssets.icMercedes, isSelected: false),
    YourFavBrandItem(brandName: "Toyota", brandImage: AppAssets.icToyota, isSelected: false),
    YourFavBrandItem(brandName: "Audi", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "BMW", brandImage: AppAssets.icBmw, isSelected: false),
    YourFavBrandItem(brandName: "Tesla", brandImage: AppAssets.icTesla, isSelected: false),
    YourFavBrandItem(brandName: "Jaguar", brandImage: AppAssets.icJaguar, isSelected: false),
    YourFavBrandItem(brandName: "Ferrari", brandImage: AppAssets.icFerrari, isSelected: false),
    YourFavBrandItem(brandName: "Lamborghini", brandImage: AppAssets.icLamborghini, isSelected: false),
    YourFavBrandItem(brandName: "Land Rover", brandImage: AppAssets.icLandRover, isSelected: false),
    YourFavBrandItem(brandName: "Lexus", brandImage: AppAssets.icLexus, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAllBrands,
              isShowBack: true,
              isShowSearch: true,
            ),
            SizedBox(height: 20.setHeight),
            Expanded(
              child: GridView.builder(
                itemCount: yourFavBrandList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                itemBuilder: (context, index) => IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BrandCarListScreen(brand: yourFavBrandList[index])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).txtWhite,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: yourFavBrandList[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray, width: 1.setWidth),
                      ),
                      margin: EdgeInsets.only(left: 7.setWidth, right: 7.setWidth, bottom: 15.setHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            yourFavBrandList[index].brandImage,
                            width: 50.setWidth,
                            height: 50.setHeight,
                            fit: BoxFit.contain,
                            color: (yourFavBrandList[index].brandImage == AppAssets.icAudi || yourFavBrandList[index].brandImage == AppAssets.icJaguar || yourFavBrandList[index].brandImage == AppAssets.icLandRover)
                                ? CustomAppColor.of(context).txtBlack
                                : null,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: yourFavBrandList[index].brandName,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) {
          return const SearchScreen();
        },
      ));
    }
  }
}
