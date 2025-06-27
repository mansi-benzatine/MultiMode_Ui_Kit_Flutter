import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/ui/view_category_details/views/view_category_details_screen.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/datamodels/home_data.dart';

class AllCategoryListScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AllCategoryListScreen());
  }

  const AllCategoryListScreen({super.key});

  @override
  State<AllCategoryListScreen> createState() => _AllCategoryListScreenState();
}

class _AllCategoryListScreenState extends State<AllCategoryListScreen> implements TopBarClickListener {
  List<FoodDetailData> categoryList = [];

  void fillData() {
    categoryList = [
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
              title: "Burgers",
              isShowBack: true,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: categoryList.length,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.setWidth,
                  mainAxisSpacing: 14.setHeight,
                  childAspectRatio: 0.69,
                ),
                itemBuilder: (context, index) {
                  final category = categoryList[index];
                  return InkWell(
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
                                height: 160.setHeight,
                                width: 156.setWidth,
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
                        SizedBox(height: 6.setHeight),
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
                              text: "${category.time} min  |  \$ ${category.price}",
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.08,
                            ),
                          ],
                        )
                      ],
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
