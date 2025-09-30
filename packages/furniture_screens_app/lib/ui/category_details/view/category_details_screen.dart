import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../search/view/search_screen.dart';
import '../datamodel/catergory_details_data.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String selectedCategory;
  static Route<void> route({String selectedCategory = "Sofa"}) {
    return MaterialPageRoute(builder: (_) => CategoryDetailsScreen(selectedCategory: selectedCategory));
  }

  const CategoryDetailsScreen({super.key, this.selectedCategory = "Sofa"});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> implements TopBarClickListener {
  String selectedCategory = "Sofa";
  final List<CategoryItem> categories = [
    CategoryItem(name: "Sofa", icon: AppAssets.icDummySofa, isSelected: true),
    CategoryItem(name: "Chair", icon: AppAssets.icDummyChair),
    CategoryItem(name: "Lamp", icon: AppAssets.icDummyLamp),
    CategoryItem(name: "Cupboard", icon: AppAssets.icDummyCupboard),
    CategoryItem(icon: AppAssets.icDummyOfficeChair, name: 'Office Chair'),
    CategoryItem(icon: AppAssets.icDummySwing, name: 'Swing'),
    CategoryItem(icon: AppAssets.icDummyDiningTable, name: 'Dinning Table'),
    CategoryItem(icon: AppAssets.icDummyBookcases, name: 'Bookcases'),
    CategoryItem(icon: AppAssets.icDummyStool, name: 'Stool'),
    CategoryItem(icon: AppAssets.icDummyVase, name: 'Vase'),
    CategoryItem(icon: AppAssets.icDummyMirror, name: 'Mirror'),
    CategoryItem(icon: AppAssets.icDummyDrawer, name: 'Drawer'),
  ];

  final List<ProductItem> products = [
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.3,
      price: 299.00,
      category: "Sofa",
    ),
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.5,
      price: 299.00,
      category: "Sofa",
    ),
    ProductItem(
      name: "Lolita Chair",
      description: "Luxury Big Chair",
      image: AppAssets.imgDummyChair,
      rating: 4.2,
      price: 199.00,
      category: "Chair",
    ),
    ProductItem(
      name: "Lolita Chair",
      description: "Luxury Big Chair",
      image: AppAssets.imgDummyChair,
      rating: 4.2,
      price: 199.00,
      category: "Chair",
    ),
    ProductItem(
      name: "Classic Lamp",
      description: "Luxury Lamp",
      image: AppAssets.imgDummyLamp,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
    ),
    ProductItem(
      name: "Classic Lamp",
      description: "Luxury Lamp",
      image: AppAssets.imgDummyLamp,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
    ),
    ProductItem(
      name: "Classic Pot",
      description: "Luxury Pot",
      image: AppAssets.imgDummyPot,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
    ),
    ProductItem(
      name: "Classic Pot",
      description: "Luxury Pot",
      image: AppAssets.imgDummyPot,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductItem> filteredProducts = products.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtCategories,
            isShowSearch: true,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
            child: Row(
              children: List.generate(
                categories.length,
                (index) {
                  final item = categories[index];
                  final isSelected = item.name == selectedCategory;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = item.name;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomAppColor.of(context).containerBg,
                              border: Border.all(
                                color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.all(18),
                            child: Image.asset(
                              item.icon,
                              width: 40.setWidth,
                              height: 40.setHeight,
                            ),
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: item.name,
                            fontSize: 18.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (filteredProducts.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 120.setHeight),
                  Image.asset(
                    AppAssets.imgEmptyCategoryDetails,
                    height: 120.setHeight,
                    color: CustomAppColor.of(context).emptyViewIcon,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: "No Product Yet",
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry.",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else
            _trendingNowListView(categoriesList: filteredProducts),
        ],
      ),
    );
  }

  _trendingNowListView({required List<ProductItem> categoriesList}) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 10.setHeight),
        child: Wrap(
          spacing: 16.setWidth,
          runSpacing: 16.setHeight,
          children: List.generate(
            categoriesList.length,
            (index) {
              final item = categoriesList[index];
              return InkWell(
                // onTap: () => Navigator.push(context, ProductDetailsScreen.route()),
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width - (18.setWidth * 2) - 24.setWidth) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              item.image,
                              width: double.infinity,
                              height: 185.setHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10.setHeight,
                            right: 10.setWidth,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.isSelected = !item.isSelected;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(
                                  item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                  height: 16.setHeight,
                                  width: 16.setWidth,
                                  color: item.isSelected ? CustomAppColor.of(context).primary : null,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonText(
                              text: item.category,
                              fontSize: 18.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.icStar,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 3.setWidth),
                              CommonText(
                                text: item.rating.toString(),
                                fontSize: 14.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CommonText(
                        text: item.name,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      CommonText(
                        text: "\$${item.price.toStringAsFixed(2)}",
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
