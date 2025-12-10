import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../explore/datamodel/explore_data.dart';

class ExploreExerciseDetailScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ExploreExerciseDetailScreen());
  }

  const ExploreExerciseDetailScreen({super.key});

  @override
  State<ExploreExerciseDetailScreen> createState() => _ExploreExerciseDetailScreenState();
}

class _ExploreExerciseDetailScreenState extends State<ExploreExerciseDetailScreen> implements TopBarClickListener {
  List<ExploreData> exerciseList = [];
  void _fillData() {
    exerciseList = [
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Exercises safely during Pregnancy", exploreImage: AppAssets.imgArticle2),
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle3),
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
            title: Languages.of(context).txtExercise,
            isShowBack: true,
          ),
          Image.asset(
            AppAssets.imgExerciseVideo,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.setHeight),
                  _sectionTitle("Pregnancy Exercise"),
                  SizedBox(height: 8.setHeight),
                  _sectionDescription(
                    "Pregnancy exercise involves safe, moderate-intensity activities like walking, swimming, and prenatal yoga, aiming for 150 minutes weekly, while avoiding overheating and high-risk activities. Key exercises include Kegels for pelvic floor strength, core and back health, and for delivery preparation.",
                  ),
                  SizedBox(height: 10.setHeight),
                  _sectionTitle("Benefits of Pregnancy Exercise"),
                  SizedBox(height: 8.setHeight),
                  _bulletList([
                    {"title": "Improved Physical Health", "desc": "Helps regulate blood sugar, improve digestion, and maintain muscle tone."},
                    {"title": "Easier Labor and Delivery", "desc": "Strengthens pelvic floor and core muscles, preparing the body for childbirth."},
                    {"title": "Better Recovery", "desc": "Can lead to a faster postpartum recovery."},
                    {"title": "Mental and Emotional Well-being", "desc": "Reduces stress and improves overall well-being."},
                  ]),
                  SizedBox(height: 10.setHeight),
                  _sectionTitle("Recommended Exercises"),
                  SizedBox(height: 8.setHeight),
                  _bulletList([
                    {"title": "Walking", "desc": "A simple, accessible exercise that can be done at any stage of pregnancy to improve circulation and digestion."},
                    {"title": "Swimming", "desc": "An excellent, low-impact aerobic exercise, especially beneficial for those with joint pain, due to buoyancy reducing stress on the body."},
                    {"title": "Parental Yoga", "desc": "Focuses on strengthening muscles, improving balance, and teaching breathing techniques that are invaluable during labor."},
                    {"title": "Kegel Exercises", "desc": " Strengthens the pelvic floor muscles, which is crucial for bladder control and can aid in labor and delivery"},
                  ]),
                  SizedBox(height: 20.setHeight),
                  _sectionTitle("How to Exercise Safely"),
                  SizedBox(height: 8.setHeight),
                  _bulletList([
                    {"title": "Listen to Your Body", "desc": "Pay attention to how your body feels and adjust intensity as needed."},
                    {"title": "Stay Hydrated", "desc": "Drink plenty of water before, during, and after exercise to prevent dehydration and overheating."},
                    {"title": "Avoid Overheating", "desc": "Exercise in a cool, safe environment."},
                    {"title": "Avoid Certain Activities", "desc": "High-risk activities with a high chance of falling or abdominal trauma, like scuba diving, should be avoided."},
                    {"title": "Consult Your Provider", "desc": "Always talk to your doctor or healthcare provider before beginning or changing your exercise routine"},
                  ]),
                  SizedBox(height: 8.setHeight),
                  _sectionTitle("More like this"),
                  SizedBox(height: 8.setHeight),
                  _cardListView(exploreList: exerciseList),
                  SizedBox(height: 40.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return CommonText(
      text: "$title :",
      fontSize: 16.setFontSize,
      fontWeight: FontWeight.bold,
      textColor: CustomAppColor.of(context).txtBlack,
      textAlign: TextAlign.start,
    );
  }

  Widget _sectionDescription(String text) {
    return CommonText(
      text: text,
      fontSize: 13.setFontSize,
      height: 1.5,
      textAlign: TextAlign.start,
      textColor: CustomAppColor.of(context).txtLightGrey,
    );
  }

  Widget _bulletList(List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 5.setHeight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "• ",
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  height: 1.5,
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              if (item['title']?.isNotEmpty ?? false)
                                TextSpan(
                                  text: "${item['title']}: ",
                                  style: TextStyle(
                                    package: 'baby_bloom_screens_app',
                                    fontSize: 13.setFontSize,
                                    height: 1.5,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                    color: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                              if (item['desc']?.isNotEmpty ?? false)
                                TextSpan(
                                  text: item['desc'],
                                  style: TextStyle(
                                    package: 'baby_bloom_screens_app',
                                    fontSize: 13.setFontSize,
                                    height: 1.5,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    color: CustomAppColor.of(context).txtLightGrey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  _cardListView({required List<ExploreData> exploreList}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.setHeight),
        child: Wrap(
          spacing: 12,
          children: exploreList.map((item) {
            return Stack(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
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
                      vertical: 3.setHeight,
                      horizontal: 6.setWidth,
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
