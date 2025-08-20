import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../news_detail/view/news_detail_screen.dart';
import '../../search/view/search_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> implements TopBarClickListener {
  // News data for trending news
  List<NewsItem> mostSearchedCars = [
    NewsItem(
        title: "Tesla's Launched New Model Y In Singapore",
        image: AppAssets.imgNews1,
        date: DateFormat('MMM d, yyyy').format(DateTime.now()),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    NewsItem(
        title: "Sweden's Volvo Cars Shakes Up Plans",
        image: AppAssets.imgNews2,
        date: DateFormat('MMM d, yyyy').format(DateTime.now().subtract(const Duration(days: 1))),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtCarNews,
              isShowBack: false,
            ),
            _searchBar(),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 90.setHeight),
              child: Column(
                children: [
                  _trendingNews(),
                  _recentNews(),
                  _newsForYou(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
            margin: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 20.setWidth),
            height: 40.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSearchBar,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icSearch,
                  width: 15.setWidth,
                  height: 15.setHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 15.setWidth),
                CommonText(text: Languages.of(context).txtSearchByBrand, fontSize: 12.setFontSize, fontWeight: FontWeight.w400, textColor: CustomAppColor.of(context).txtGray),
              ],
            ),
          )),
    );
  }

  Widget _trendingNews() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtTrendingNews,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
              SizedBox(width: 20.setWidth),
            ],
          ),
          SizedBox(height: 15.setHeight),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(mostSearchedCars.length, (index) {
                return _itemTrendingNews(mostSearchedCars[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemTrendingNews(NewsItem newsItem) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(newsItem: newsItem)));
        },
        child: Container(
          width: 170.setWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
          margin: EdgeInsets.only(right: 10.setWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News image
              Container(
                width: double.infinity,
                height: 150.setHeight,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  color: CustomAppColor.of(context).bgSearchBar,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    newsItem.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // News content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: newsItem.title,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      letterSpacing: 0,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.setHeight),
                    CommonText(
                      text: newsItem.date,
                      fontSize: 10.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentNews() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      margin: EdgeInsets.symmetric(vertical: 10.setHeight),
      color: CustomAppColor.of(context).bgSearchBar,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
              CommonText(
                text: Languages.of(context).txtRecentNews,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
              SizedBox(width: 20.setWidth),
            ],
          ),
          SizedBox(height: 15.setHeight),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(mostSearchedCars.length, (index) {
                return _itemRecentNews(mostSearchedCars[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemRecentNews(NewsItem newsItem) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(newsItem: newsItem)));
        },
        child: Container(
          height: 100.setHeight,
          width: 200.setWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: CustomAppColor.of(context).bgScreen,
            border: Border.all(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
          margin: EdgeInsets.only(right: 10.setWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News image
              Container(
                width: 100.setWidth,
                height: 100.setWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    newsItem.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // News content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: newsItem.title,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        letterSpacing: 0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      CommonText(
                        text: newsItem.date,
                        fontSize: 10.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newsForYou() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 20.setWidth),
      child: Column(
        children: [
          Row(
            children: [
              CommonText(
                text: Languages.of(context).txtForYou,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          ...List.generate(mostSearchedCars.length, (index) {
            return _itemNewsForYou(mostSearchedCars[index]);
          }),
        ],
      ),
    );
  }

  Widget _itemNewsForYou(NewsItem newsItem) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(newsItem: newsItem)));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
          margin: EdgeInsets.only(bottom: 15.setHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News image
              Container(
                width: double.infinity,
                height: 200.setHeight,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  color: CustomAppColor.of(context).bgSearchBar,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    newsItem.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // News content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: newsItem.title,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      letterSpacing: 0,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.setHeight),
                    CommonText(
                      text: newsItem.date,
                      fontSize: 10.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
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

// News item data class
class NewsItem {
  final String title;
  final String image;
  final String date;
  final String description;

  NewsItem({
    required this.title,
    required this.image,
    required this.date,
    required this.description,
  });
}
