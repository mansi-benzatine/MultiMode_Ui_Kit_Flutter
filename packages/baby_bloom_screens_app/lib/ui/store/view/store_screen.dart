import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/search/view/search_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../datamodel/store_data.dart';

class StoreScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const StoreScreen());
  }

  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> implements TopBarClickListener {
  List<String> bannerList = [];
  List<StoreData> momStoreList = [];
  List<StoreData> babyStoreList = [];
  int selectedIndex = 0;

  _fillData() {
    bannerList = [
      AppAssets.imgBanner1,
      AppAssets.imgBanner2,
      AppAssets.imgBanner3,
      AppAssets.imgBanner4,
    ];
    momStoreList = [
      StoreData(storeImage: AppAssets.imgStoreStretchMark, storeName: "Stretch Marks Care"),
      StoreData(storeImage: AppAssets.imgStoreVitamin, storeName: "Vitamin C Range"),
      StoreData(storeImage: AppAssets.imgStoreHaircare, storeName: "Post Pregnancy hair Care"),
      StoreData(storeImage: AppAssets.imgStoreBath, storeName: "Bath,Body & Hygiene"),
      StoreData(storeImage: AppAssets.imgStoreDailyWellness, storeName: "Daily Wellness"),
      StoreData(storeImage: AppAssets.imgStoreCloths, storeName: "Pregnancy Clothes"),
    ];
    babyStoreList = [
      StoreData(storeImage: AppAssets.imgStoreStretchMark, storeName: "Diapers & Wipes"),
      StoreData(storeImage: AppAssets.imgStoreVitamin, storeName: "Baby Care & Wellness"),
      StoreData(storeImage: AppAssets.imgStoreHaircare, storeName: "Laundry Detergent"),
      StoreData(storeImage: AppAssets.imgStoreBath, storeName: "Babies Clothes"),
      StoreData(storeImage: AppAssets.imgStoreDailyWellness, storeName: "Feeding & Lactation"),
      StoreData(storeImage: AppAssets.imgStoreCloths, storeName: "Baby Sittings"),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtStore,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: bannerList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(i);
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 160.setHeight,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.85,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(bannerList.length, (dotIndex) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
                        height: 6.setHeight,
                        width: 6.setWidth,
                        decoration: BoxDecoration(
                          color: selectedIndex == dotIndex ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 15.setHeight),
                  Image.asset(AppAssets.imgBannerMom),
                  SizedBox(height: 15.setHeight),
                  Wrap(
                    spacing: 11.setWidth,
                    runSpacing: 11.setHeight,
                    children: momStoreList.map((item) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 20 * 2 - 30) / 3,
                        child: Stack(
                          children: [
                            Image.asset(item.storeImage),
                            Positioned(
                              bottom: 6.setHeight,
                              left: 8.setWidth,
                              right: 8.setWidth,
                              child: CommonText(
                                text: item.storeName,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 15.setHeight),
                  Image.asset(AppAssets.imgBannerBaby),
                  SizedBox(height: 15.setHeight),
                  Wrap(
                    spacing: 11.setWidth,
                    runSpacing: 11.setHeight,
                    children: babyStoreList.map((item) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 20 * 2 - 30) / 3,
                        child: Stack(
                          children: [
                            Image.asset(item.storeImage),
                            Positioned(
                              bottom: 6.setHeight,
                              left: 8.setWidth,
                              right: 8.setWidth,
                              child: CommonText(
                                text: item.storeName,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                                maxLines: 2,
                                textColor: CustomAppColor.of(context).black,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
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
