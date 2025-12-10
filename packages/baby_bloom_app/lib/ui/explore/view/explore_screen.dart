import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/explore/datamodel/explore_data.dart';
import 'package:baby_bloom_app/ui/explore_exercise_detail/view/explore_exercise_detail_screen.dart';
import 'package:baby_bloom_app/ui/explore_week_detail/view/explore_detail_screen.dart';
import 'package:baby_bloom_app/ui/search/view/search_screen.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';

class ExploreScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ExploreScreen());
  }

  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> implements TopBarClickListener {
  List<ExploreData> exerciseList = [];
  List<ExploreData> nutritionList = [];
  List<ExploreData> bodyList = [];
  List<ExploreData> medicalList = [];
  List<ExploreData> babyList = [];
  List<ExploreData> feedingList = [];
  List<String> weekByWeekList = [];
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
    weekByWeekList = [AppAssets.imgBannerWeek4, AppAssets.imgBannerWeek5, AppAssets.imgBannerWeek8];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupBackground,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtExplore,
                appBarColor: CustomAppColor.of(context).transparent,
                isShowSearch: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headingView(heading: Languages.of(context).txtWeekByWeek),
                      _weekByWeekListView(weekByWeekList: weekByWeekList),
                      _headingView(heading: Languages.of(context).txtExercise),
                      _cardListView(exploreList: exerciseList),
                      _headingView(heading: Languages.of(context).txtNutrition),
                      _cardListView(exploreList: nutritionList),
                      _headingView(heading: Languages.of(context).txtBody),
                      _cardListView(exploreList: bodyList),
                      _headingView(heading: Languages.of(context).txtMedical),
                      _cardListView(exploreList: medicalList),
                      _headingView(heading: Languages.of(context).txtBaby),
                      _cardListView(exploreList: babyList),
                      _headingView(heading: Languages.of(context).txtFeeding),
                      _cardListView(exploreList: feedingList),
                    ],
                  ),
                ),
              )
            ],
          ),
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
                GestureDetector(
                  onTap: () => Navigator.push(context, ExploreExerciseDetailScreen.route()),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
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

  _weekByWeekListView({required List<String> weekByWeekList}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 10.setHeight),
        child: Wrap(
          spacing: 12,
          children: weekByWeekList.map((item) {
            return GestureDetector(
              onTap: () => Navigator.push(context, ExploreDetailScreen.route()),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    height: 136.setHeight,
                    width: 146.setWidth,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
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
}
