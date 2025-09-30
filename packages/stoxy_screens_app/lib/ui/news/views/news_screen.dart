import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/ui/explore_stock/datamodel/explore_stock_data.dart';
import 'package:stoxy_screens_app_package/ui/search/view/searh_screen.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';
import 'package:stoxy_screens_app_package/widgets/text/common_text.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';

class NewsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NewsScreen());
  }

  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> implements TopBarClickListener {
  List<NewsData> trendingNewsList = [];
  List<NewsData> latestNewsList = [];
  List<NewsData> topNewsList = [];
  List<NewsData> todayNewsList = [];
  final CarouselController _carouselController = CarouselController();

  var _currentCarouselPage = 0;

  void _fillData() {
    trendingNewsList = [
      NewsData(iconPath: AppAssets.imgNew1, details: "Top 5 Stock \nAnalysis Website!"),
      NewsData(iconPath: AppAssets.imgNew2, details: "Why Top 5 Stock \nAnalysis Website?"),
      NewsData(iconPath: AppAssets.imgNew2, details: "Why Top 5 Stock \nAnalysis Website?"),
      NewsData(iconPath: AppAssets.imgNew1, details: "How Top 5 Stock \nAnalysis Website?"),
    ];
    latestNewsList = [
      NewsData(iconPath: AppAssets.imgNew1, details: "Top 5 Stock \nAnalysis Website!"),
      NewsData(iconPath: AppAssets.imgNew2, details: "Why Top 5 Stock \nAnalysis Website?"),
    ];
    topNewsList = [
      NewsData(
        iconPath: AppAssets.imgNew1,
        details: "Top 5 Stock \nAnalysis Website!",
        data: "Latest Mobile Application For Stock Market",
      ),
      NewsData(iconPath: AppAssets.imgNew2, details: "Why Top 5 Stock \nAnalysis Website?", data: "Latest Trending High Stocks In Stock Market"),
      NewsData(
        iconPath: AppAssets.imgNew1,
        details: "How Top 5 Stock \nAnalysis Website?",
        data: "Latest Mobile Application For Stock Market",
      ),
    ];
    todayNewsList = [
      NewsData(iconPath: AppAssets.imgNew1, details: "Social Media Connection"),
      NewsData(iconPath: AppAssets.imgNew2, details: "Bit Coin Market Value In..."),
      NewsData(iconPath: AppAssets.imgNew1, details: "Manage Financially Investment"),
      NewsData(iconPath: AppAssets.imgNew1, details: "Crypto Currency Investment"),
      NewsData(iconPath: AppAssets.imgNew1, details: "Improve Design Baar For More...."),
      NewsData(iconPath: AppAssets.imgNew1, details: "Creative Workflow For You Better ...."),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
    _carouselController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
              ? null
              : DecorationImage(
                  image: AssetImage(AppAssets.imgCommonBackground),
                  fit: BoxFit.fill,
                ),
        ),
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtNews,
              isShowSearch: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.setHeight),
                    _trendingNewsView(),
                    SizedBox(height: 10.setHeight),
                    _latestNewsView(),
                    SizedBox(height: 20.setHeight),
                    _topNewsView(),
                    SizedBox(height: 20.setHeight),
                    _todayNewsView(),
                    SizedBox(height: 40.setHeight),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }

  Widget _trendingNewsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonText(
            text: Languages.of(context).txtTrendingNews,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 20.setHeight),
        CarouselSlider(
          items: List.generate(
            trendingNewsList.length,
            (index) {
              final data = trendingNewsList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        data.iconPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CustomAppColor.of(context).black.withOpacityPercent(0.9),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [0.2, 1],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15.setWidth,
                          bottom: 10.setHeight,
                        ),
                        child: CommonText(
                          text: data.details,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.start,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          options: CarouselOptions(
            height: 170.setHeight,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 16,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.75,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselPage = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: trendingNewsList.asMap().entries.map((entry) {
            return Container(
              width: _currentCarouselPage == entry.key ? 8.setWidth : 5.setWidth,
              height: _currentCarouselPage == entry.key ? 8.setHeight : 5.setHeight,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 2.setWidth),
              decoration: BoxDecoration(
                color: _currentCarouselPage == entry.key ? CustomAppColor.of(context).primary : CustomAppColor.of(context).greyIndicator,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _latestNewsView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtLatestNews,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
              )
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        Wrap(
          spacing: 12.setWidth,
          runSpacing: 16.setHeight,
          children: List.generate(
            latestNewsList.length,
            (index) {
              final data = latestNewsList[index];
              return Container(
                height: 120.setHeight,
                width: (MediaQuery.of(context).size.width - (16.setWidth * 3)) / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          data.iconPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CustomAppColor.of(context).black.withOpacityPercent(0.9),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.2, 1],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.setWidth,
                            bottom: 5.setHeight,
                          ),
                          child: CommonText(
                            text: data.details,
                            textColor: CustomAppColor.of(context).white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.setFontSize,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _topNewsView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTopNews,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
              )
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = topNewsList[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    data.iconPath,
                    height: 90.setHeight,
                    width: 100.setWidth,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: data.details,
                        fontSize: 16.setFontSize,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: data.data,
                        fontSize: 12.setFontSize,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 30.setHeight,
            );
          },
          itemCount: topNewsList.length,
        )
      ],
    );
  }

  Widget _todayNewsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
          child: CommonText(
            text: Languages.of(context).txtTodaysNews,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 20.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
          child: Wrap(
            spacing: 12.setWidth,
            runSpacing: 16.setHeight,
            children: List.generate(
              todayNewsList.length,
              (index) {
                final data = todayNewsList[index];
                return Container(
                  height: 140.setHeight,
                  width: (MediaQuery.of(context).size.width - (16.setWidth * 3)) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            data.iconPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    CustomAppColor.of(context).black.withOpacityPercent(0.9),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [0.2, 1]),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 15.setWidth,
                              bottom: 10.setHeight,
                            ),
                            child: CommonText(
                              text: data.details,
                              textColor: CustomAppColor.of(context).white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.setFontSize,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
