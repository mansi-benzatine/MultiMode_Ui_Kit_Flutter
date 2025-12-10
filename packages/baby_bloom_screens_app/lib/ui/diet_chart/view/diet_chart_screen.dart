import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/home/datamodel/home_data.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';
import '../../explore/datamodel/explore_data.dart';

class DietChartScreen extends StatefulWidget {
  final int currentIndex;
  static Route<void> route({int currentIndex = -1}) {
    return MaterialPageRoute(
      builder: (_) => DietChartScreen(currentIndex: currentIndex),
    );
  }

  const DietChartScreen({super.key, this.currentIndex = -1});

  @override
  State<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends State<DietChartScreen> implements TopBarClickListener {
  bool isBabySelected = false;
  List<Map<String, String>> motherDietCategory = [];
  List<String> babyDietCategory = [];
  List<ExploreData> exerciseList = [];
  List<ExploreData> nutritionList = [];
  List<ExploreData> bodyList = [];
  List<ExploreData> medicalList = [];
  List<ExploreData> babyList = [];
  List<ExploreData> feedingList = [];
  List<String> weekByWeekList = [];
  List<ArticleData> articleList = [];
  int selectedIndex = -1;
  void _fillData() {
    exerciseList = [
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Exercises safely during Pregnancy", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle1),
    ];
    nutritionList = [
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
    ];
    bodyList = [
      ExploreData(exploreHeading: "Weight gain", exploreImage: AppAssets.imgArticle2),
      ExploreData(exploreHeading: "Body Changes", exploreImage: AppAssets.imgArticle2),
      ExploreData(exploreHeading: "Weight gain", exploreImage: AppAssets.imgArticle2),
    ];
    medicalList = [
      ExploreData(exploreHeading: "Test & Scans", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Pregnancy conditions", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Test & Scans", exploreImage: AppAssets.imgArticle1),
    ];
    babyList = [
      ExploreData(exploreHeading: "Baby development and safety", exploreImage: AppAssets.imgArticle2),
      ExploreData(exploreHeading: "Parental bonding", exploreImage: AppAssets.imgArticle2),
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle2),
    ];
    feedingList = [
      ExploreData(exploreHeading: "Bottle feeding", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Bottle feeding", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Bottle feeding", exploreImage: AppAssets.imgArticle3),
    ];
    weekByWeekList = [
      AppAssets.imgBannerWeek4,
      AppAssets.imgBannerWeek5,
      AppAssets.imgBannerWeek8,
    ];
    motherDietCategory = [
      {
        'image': AppAssets.icAdd,
        'category': "Veg",
      },
      {
        'image': AppAssets.icAdd,
        'category': "Non-Veg",
      },
      {
        'image': AppAssets.icAdd,
        'category': "Vegan",
      },
    ];

    babyDietCategory = ["0-3 Months", "3-6 Months", "7 Month", "8 Month", " 9 Month"];

    articleList = [
      ArticleData(
        articleHeading: "Remedies to fight morning sickness",
        articleImage: AppAssets.imgArticle1,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isArticle: true,
      ),
      ArticleData(
        articleHeading: "how your baby’s organs develop",
        articleImage: AppAssets.imgArticle2,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isVideo: true,
      ),
      ArticleData(
        articleHeading: "Nutrients for pregnant women",
        articleImage: AppAssets.imgArticle3,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isArticle: true,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();

    if (widget.currentIndex == -1) {
      isBabySelected = false;
    } else {
      isBabySelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtDietChart,
            isShowBack: true,
          ),
          selectOptionsView(),
          SizedBox(height: 10.setHeight),
          Expanded(
            child: SingleChildScrollView(
              child: IgnorePointer(
                ignoring: true,
                child: Column(
                  children: [
                    isBabySelected ? babyDietDetailsView() : motherDietDetailsView(),
                    SizedBox(height: 50.setHeight),
                  ],
                ),
              ),
            ),
          )
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

  _cardListView({required List<ExploreData> exploreList}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 10.setHeight),
        child: Wrap(
          spacing: 12,
          children: exploreList.map((item) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          item.exploreImage,
                          fit: BoxFit.cover,
                          height: 136.setHeight,
                          width: 146.setWidth,
                        ),
                      ),
                      SizedBox(height: 3.setHeight),
                      SizedBox(
                        width: 146.setWidth,
                        child: CommonText(
                          text: item.exploreHeading,
                          fontSize: 14.setFontSize,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          fontFamily: Constant.fontFamilySemiBold600,
                        ),
                      ),
                      SizedBox(
                        width: 146.setWidth,
                        child: CommonText(
                          text: Languages.of(context).txtDummy,
                          fontSize: 10.setFontSize,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20.setHeight,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4.setHeight,
                      horizontal: 8.setWidth,
                    ),
                    child: item.isArticle
                        ? Row(
                            children: [
                              Image.asset(
                                AppAssets.icArticle,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 6.setWidth),
                              CommonText(
                                text: "Article",
                                fontSize: 10.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                AppAssets.icVideo,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 6.setWidth),
                              CommonText(
                                text: "Video",
                                fontSize: 10.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  _articleListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: articleList.length,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = articleList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomAppColor.of(context).grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item.articleImage),
                    SizedBox(height: 3.setHeight),
                    CommonText(
                      text: item.articleHeading,
                      fontSize: 18.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                    CommonText(
                      text: item.articleDescription,
                      fontSize: 12.setFontSize,
                      textAlign: TextAlign.start,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.setHeight,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 8.setWidth),
                  child: item.isArticle
                      ? Row(
                          children: [
                            Image.asset(
                              AppAssets.icArticle,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: "Article",
                              fontSize: 10.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).white,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Image.asset(
                              AppAssets.icVideo,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: "Video",
                              fontSize: 10.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).white,
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _headingView({required String heading}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.setWidth, bottom: 10.setHeight),
      child: CommonText(
        text: heading,
        textAlign: TextAlign.start,
        fontFamily: Constant.fontFamilySemiBold600,
        fontSize: 18.setFontSize,
      ),
    );
  }

  Widget selectOptionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IgnorePointer(
          ignoring: true,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isBabySelected = false;
              });
            },
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    if (!isBabySelected)
                      Positioned(
                        bottom: -0,
                        child: Container(
                          height: 90.setHeight,
                          width: 90.setWidth,
                          decoration: BoxDecoration(
                            color: Colors.pink.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomAppColor.of(context).secondary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    Image.asset(
                      AppAssets.icPregnantWomen,
                      width: 80.setWidth,
                      height: 100.setHeight,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: Languages.of(context).txtMother,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: isBabySelected ? CustomAppColor.of(context).txtLightGrey : CustomAppColor.of(context).txtSecondary,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 40.setWidth),
        IgnorePointer(
          ignoring: true,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isBabySelected = true;
              });
            },
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    if (isBabySelected)
                      Positioned(
                        bottom: -0,
                        child: Container(
                          height: 90.setHeight,
                          width: 90.setWidth,
                          decoration: BoxDecoration(
                            color: Colors.pink.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomAppColor.of(context).secondary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    Image.asset(
                      AppAssets.imgBaby,
                      width: 90.setWidth,
                      height: 100.setHeight,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: Languages.of(context).txtBaby,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: isBabySelected ? CustomAppColor.of(context).txtSecondary : CustomAppColor.of(context).txtLightGrey,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget motherDietDetailsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            child: Wrap(
              spacing: 10.setWidth,
              runSpacing: 10.setHeight,
              children: List.generate(motherDietCategory.length, (index) {
                final category = motherDietCategory[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 6.setHeight),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CommonText(
                          text: category["category"]!,
                          fontSize: 12.setFontSize,
                          textColor: isSelected ? Colors.white : Colors.pink,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(height: 10.setHeight),
        _headingView(heading: "First Trimester"),
        _cardListView(exploreList: exerciseList),
        _headingView(heading: "Second Trimester"),
        _cardListView(exploreList: nutritionList),
        _headingView(heading: "Third Trimester"),
        _cardListView(exploreList: medicalList),
        _headingView(heading: "Fourth Trimester"),
        _cardListView(exploreList: bodyList),
      ],
    );
  }

  Widget babyDietDetailsView() {
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            child: Wrap(
              spacing: 10.setWidth,
              runSpacing: 10.setHeight,
              children: List.generate(babyDietCategory.length, (index) {
                final category = babyDietCategory[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 6.setHeight),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CommonText(
                      text: category,
                      fontSize: 12.setFontSize,
                      textColor: isSelected ? Colors.white : Colors.pink,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(height: 10.setHeight),
        _articleListView(),
      ],
    );
  }
}
