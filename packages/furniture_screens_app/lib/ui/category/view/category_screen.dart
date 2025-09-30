import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/category_details/view/category_details_screen.dart';
import 'package:furniture_screens_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/category_data.dart';

class CategoriesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CategoriesScreen());
  }

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> implements TopBarClickListener {
  final List<CategoriesModel> categories = [
    CategoriesModel(icon: AppAssets.icDummySofa, name: 'Sofa', items: 190),
    CategoriesModel(icon: AppAssets.icDummyChair, name: 'Chair', items: 200),
    CategoriesModel(icon: AppAssets.icDummyLamp, name: 'Lamp', items: 240),
    CategoriesModel(icon: AppAssets.icDummyCupboard, name: 'Cupboard', items: 150),
    CategoriesModel(icon: AppAssets.icDummyOfficeChair, name: 'Office Chair', items: 190),
    CategoriesModel(icon: AppAssets.icDummySwing, name: 'Swing', items: 190),
    CategoriesModel(icon: AppAssets.icDummyDiningTable, name: 'Dinning Table', items: 190),
    CategoriesModel(icon: AppAssets.icDummyBookcases, name: 'Bookcases', items: 190),
    CategoriesModel(icon: AppAssets.icDummyStool, name: 'Stool', items: 190),
    CategoriesModel(icon: AppAssets.icDummyVase, name: 'Vase', items: 190),
    CategoriesModel(icon: AppAssets.icDummyMirror, name: 'Mirror', items: 190),
    CategoriesModel(icon: AppAssets.icDummyDrawer, name: 'Drawer', items: 190),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtCategories,
              isShowBack: true,
              isShowSearch: true,
            ),
            SizedBox(height: 10.setHeight),
            Wrap(
              spacing: 16.setWidth,
              runSpacing: 22.setHeight,
              children: List.generate(categories.length, (index) {
                final category = categories[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3 - 26,
                  child: IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () => Navigator.push(context, CategoryDetailsScreen.route()),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerBg,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(18),
                            child: Center(
                              child: Image.asset(
                                category.icon,
                                width: 40.setWidth,
                                height: 40.setHeight,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.setHeight),
                          CommonText(
                            text: category.name,
                            textAlign: TextAlign.center,
                            fontSize: 14.setFontSize,
                            fontFamily: Constant.fontFamilyBold700,
                          ),
                          SizedBox(height: 2.setHeight),
                          CommonText(
                            text: "${category.items} Items",
                            fontSize: 13.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
      Navigator.push(context, SearchScreen.route());
    }
  }
}
