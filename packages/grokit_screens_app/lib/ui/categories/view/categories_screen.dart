import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/category_list/view/category_list_screen.dart';
import 'package:grokit_screens_app/ui/search/views/search_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class CategoriesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CategoriesScreen());
  }

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> implements TopBarClickListener {
  final Map<String, List<Map<String, String>>> categoriesData = {
    "Vegetables & Fruits": [
      {"title": "Fresh Vegetables", "image": AppAssets.imgCategoryVegetable},
      {"title": "Fresh Fruits", "image": AppAssets.imgCategoryFruits},
      {"title": "Detergents", "image": AppAssets.imgCategoryExotics},
    ],
    "Dairy, Bread & Eggs": [
      {"title": "Exotics", "image": AppAssets.imgDairy1},
      {"title": "Milk", "image": AppAssets.imgDairy},
      {"title": "Bread & Pav", "image": AppAssets.imgDairy1},
    ],
    "Oil & Masala": [
      {"title": "Eggs", "image": AppAssets.imgKitchen1},
      {"title": "Oil", "image": AppAssets.imgKitchen},
      {"title": "Packaged Spices", "image": AppAssets.imgKitchen1},
    ],
    "Snacks & Drinks": [
      {"title": "Dry Fruits", "image": AppAssets.imgSnack1},
      {"title": "Chips & Namkeen", "image": AppAssets.imgSnack},
      {"title": "Sweets & Chocolates", "image": AppAssets.imgSnack1},
    ],
    "Flours, Rices & Pulses": [
      {"title": "Drinks & Juices", "image": AppAssets.imgJuice1},
      {"title": "Flours & Grains", "image": AppAssets.imgJuice},
      {"title": "Rice & Rice Products", "image": AppAssets.imgKitchen},
    ],
    "Beauty & Personal Care": [
      {"title": "Sugar & Salt", "image": AppAssets.imgBeautyLipstick},
      {"title": "Shampoo", "image": AppAssets.imgBeautyGlowKits},
      {"title": "Skin Care", "image": AppAssets.imgBeautyEyeBeauty},
    ],
    "Household Basics": [
      {"title": "Hair Care", "image": AppAssets.imgBeautyNails},
      {"title": "Appliances", "image": AppAssets.imgBeautyLipstick},
      {"title": "Cookware", "image": AppAssets.imgBeautyFreshFace},
    ],
    "Cleaning & Detergents": [
      {"title": "Party Need", "image": AppAssets.imgJuice},
      {"title": "All Cleaners", "image": AppAssets.imgJuice1},
      {"title": "Brooms & Brushes", "image": AppAssets.imgJuice},
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtCategories,
            isShowBack: false,
            isShowSearch: true,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 5.setHeight),
              children: categoriesData.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: entry.key,
                      fontSize: 16.setFontSize,
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                    SizedBox(height: 5.setHeight),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: entry.value.map((item) {
                        return IgnorePointer(
                          ignoring: true,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, CategoryListScreen.route()),
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width - 70) / 3,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).unselectedCard,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        item['image']!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.setHeight),
                                  CommonText(
                                    text: item['title']!,
                                    textAlign: TextAlign.center,
                                    fontSize: 12.setFontSize,
                                    fontFamily: Constant.fontFamilyBold700,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
