import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../category_details/datamodel/catergory_details_data.dart';

class MyFavouritesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyFavouritesScreen());
  }

  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> implements TopBarClickListener {
  final List<ProductItem> products = [
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.3,
      price: 299.00,
      category: "Sofa",
      isSelected: true,
    ),
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.5,
      price: 299.00,
      category: "Sofa",
      isSelected: true,
    ),
    ProductItem(
      name: "Lolita Pot",
      description: "Luxury Big Pot",
      image: AppAssets.imgDummyPot,
      rating: 4.2,
      price: 199.00,
      category: "Chair",
      isSelected: true,
    ),
    ProductItem(
      name: "Lolita Chair",
      description: "Luxury Big Chair",
      image: AppAssets.imgDummyChair,
      rating: 4.2,
      price: 199.00,
      category: "Chair",
      isSelected: true,
    ),
    ProductItem(
      name: "Classic Lamp",
      description: "Luxury Lamp",
      image: AppAssets.imgDummyChair,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
      isSelected: true,
    ),
    ProductItem(
      name: "Classic Lamp",
      description: "Luxury Lamp",
      image: AppAssets.imgDummyLamp,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
      isSelected: true,
    ),
    ProductItem(
      name: "Classic Pot",
      description: "Luxury Pot",
      image: AppAssets.imgDummyPot,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
      isSelected: true,
    ),
    ProductItem(
      name: "Classic Pot",
      description: "Luxury Pot",
      image: AppAssets.imgDummyPot,
      rating: 4.4,
      price: 299.00,
      category: "Lamp",
      isSelected: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyFavorites,
            isShowSearch: true,
            textAlign: TextAlign.start,
            alignment: Alignment.centerLeft,
          ),
          if (products.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 250.setHeight),
                    Image.asset(AppAssets.imgEmptyCategoryDetails, height: 120.setHeight), // Replace with your no-product icon
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
              ),
            )
          else
            _trendingNowListView(categoriesList: products),
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

  _trendingNowListView({required List<ProductItem> categoriesList}) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 100.setHeight),
        child: Wrap(
          spacing: 16.setWidth,
          runSpacing: 16.setHeight,
          children: List.generate(
            categoriesList.length,
            (index) {
              final item = categoriesList[index];
              return SizedBox(
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
                                if (item.isSelected) {
                                  products.removeAt(index);
                                } else {
                                  item.isSelected = true;
                                }
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
                            text: item.name,
                            fontSize: 18.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.icStar,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                            SizedBox(width: 5.setWidth),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
