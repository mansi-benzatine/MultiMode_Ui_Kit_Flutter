import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/datamodels/home_data.dart';

class FavouritesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FavouritesScreen());
  }

  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> implements TopBarClickListener {
  List<FoodDetailData> favouriteList = [];

  void fillData() {
    favouriteList = [
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        personQuantity: "for two",
        time: 30,
        location: "Broadway NY",
        foodName: "Veg Noodles",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        time: 30,
        location: "Broadway NY",
        personQuantity: "for two",
        foodName: "Veg Noodles",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        time: 30,
        location: "Broadway NY",
        personQuantity: "for two",
        foodName: "Veg Noodles",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        time: 30,
        location: "Broadway NY",
        foodName: "Veg Noodles",
        personQuantity: "for two",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        time: 30,
        location: "Broadway NY",
        foodName: "Veg Noodles",
        personQuantity: "for two",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["noodles", "American Food", "Desi Food"],
        rating: 4.5,
        price: 200,
        time: 30,
        location: "Broadway NY",
        personQuantity: "for two",
        foodName: "Veg Noodles",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtFavourites,
                isShowBack: true,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: favouriteList.length,
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.setWidth,
                    mainAxisSpacing: 22.setHeight,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final category = favouriteList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Image.asset(
                                category.foodImageUrl,
                                height: 160.setHeight,
                                width: 156.setWidth,
                                fit: BoxFit.fill,
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
                            Positioned(
                              right: 10.setWidth,
                              top: 10.setHeight,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.setHeight),
                        CommonText(
                          text: category.foodName,
                          fontSize: 16.setFontSize,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                        ),
                        CommonText(
                          text: category.location ?? '',
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "${category.time} min | \$${category.price} ${category.personQuantity}",
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )
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
