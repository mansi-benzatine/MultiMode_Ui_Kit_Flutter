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
import '../../home/view/home_screen.dart';
import '../../news/view/news_screen.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsItem newsItem;

  static Route<void> route({required NewsItem newsItem}) {
    return MaterialPageRoute(builder: (_) => NewsDetailScreen(newsItem: newsItem));
  }

  const NewsDetailScreen({super.key, required this.newsItem});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> implements TopBarClickListener {
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

  List<PopularCarItem> popularCars = [
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla2, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];
  final Set<int> favoriteIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: "",
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.imgNewsFull,
                      width: double.infinity,
                      height: 200.setHeight,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 15.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: widget.newsItem.title,
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 8.setHeight),
                          CommonText(
                            text: widget.newsItem.date,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGray,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 12.setHeight),
                          CommonText(
                            text: widget.newsItem.description,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.setHeight),
                    _relatedNews(),
                    _exploreMoreCars(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exploreMoreCars() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.setWidth),
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
              SizedBox(width: 20.setWidth),
            ],
          ),
          SizedBox(height: 15.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: List.generate(popularCars.length, (index) {
                return CarItemWidget(
                  isFavorite: favoriteIndexes.contains(index),
                  onFavoriteToggle: () {
                    setState(() {
                      if (favoriteIndexes.contains(index)) {
                        favoriteIndexes.remove(index);
                      } else {
                        favoriteIndexes.add(index);
                      }
                    });
                  },
                  car: popularCars[index],
                  marginRight: 15.setWidth,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _relatedNews() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      margin: EdgeInsets.symmetric(vertical: 10.setHeight),
      color: CustomAppColor.of(context).bgSearchBar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtRelatedNews,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
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
    return Container(
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
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
