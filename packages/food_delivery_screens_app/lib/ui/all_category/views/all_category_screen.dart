import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/ui/all_category/datamodels/all_category_data.dart';
import 'package:food_delivery_screens_app_package/ui/all_category_list/views/all_category_list_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class AllCategoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AllCategoryScreen());
  }

  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> implements TopBarClickListener {
  List<FoodCategoryData> allCategoriesList = [];

  fillData() {
    allCategoriesList = [
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoBurger,
        foodCategoryName: "Burgers",
        foodCategoryPlace: 1126,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoFrenchFries,
        foodCategoryName: "Fries",
        foodCategoryPlace: 142,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoPizza,
        foodCategoryName: "Pizza",
        foodCategoryPlace: 365,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoChinese,
        foodCategoryName: "Chinese",
        foodCategoryPlace: 564,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoSandwich,
        foodCategoryName: "Sandwich",
        foodCategoryPlace: 564,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoPancake,
        foodCategoryName: "Pancake",
        foodCategoryPlace: 564,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoSushi,
        foodCategoryName: "Sushi",
        foodCategoryPlace: 564,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoIceCream,
        foodCategoryName: "Ice Cream",
        foodCategoryPlace: 564,
      ),
      FoodCategoryData(
        foodCategoryImageUrl: AppAssets.imgLogoMeat,
        foodCategoryName: "Meat",
        foodCategoryPlace: 564,
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
              title: "All Categories",
              isShowBack: true,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: allCategoriesList.length,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.setWidth,
                  mainAxisSpacing: 20.setHeight,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) {
                  final category = allCategoriesList[index];
                  return IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () => Navigator.push(context, AllCategoryListScreen.route()),
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.setWidth),
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
                                category.foodCategoryImageUrl,
                                width: 44.setWidth,
                                height: 44.setHeight,
                              ),
                            ),
                            SizedBox(height: 6.setHeight),
                            CommonText(
                              text: category.foodCategoryName,
                              fontSize: 17.setFontSize,
                              fontWeight: FontWeight.w600,
                            ),
                            CommonText(
                              text: "${category.foodCategoryPlace.toString()} places",
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
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
  }
}
