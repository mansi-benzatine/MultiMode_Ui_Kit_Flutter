import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/bookmark/view/bookmark_screen.dart';
import 'package:flowly_app/ui/explore_self_care/view/explore_self_care_screen.dart';
import 'package:flowly_app/ui/search/view/search_screen.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/datamodel/home_data.dart';

class SelfCareScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SelfCareScreen());
  }

  const SelfCareScreen({super.key});

  @override
  State<SelfCareScreen> createState() => _SelfCareScreenState();
}

class _SelfCareScreenState extends State<SelfCareScreen> implements TopBarClickListener {
  List<SuggestedForYouModel> periodBasicList = [
    SuggestedForYouModel(
      title: "First period?",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "Handle a period during work",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<SuggestedForYouModel> periodCrampsReliefList = [
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "Foot message to relieve cramps",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<SuggestedForYouModel> periodHacksList = [
    SuggestedForYouModel(
      title: "Experience 0 period symptoms",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "Painful period cramps",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<SuggestedForYouModel> healthyBodyMindList = [
    SuggestedForYouModel(
      title: "Common period cravings",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "5 Period friendly fruits to much on",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<SuggestedForYouModel> fertilityAndPregnancyList = [
    SuggestedForYouModel(
      title: "Am i pregnant?",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "How do i know if i am fertile?",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<SuggestedForYouModel> periodCareTipsList = [
    SuggestedForYouModel(
      title: "Stay Hydrated",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "Avoid junk & Salty Foods",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
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
            title: Languages.of(context).txtSelfCare,
            isShowSearch: true,
            isShowBookmark: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  suggestedForYouListView(
                    title: Languages.of(context).txtPeriodBasics,
                    list: periodBasicList,
                  ),
                  suggestedForYouListView(
                    title: Languages.of(context).txtPeriodCrampsRelief,
                    list: periodCrampsReliefList,
                  ),
                  suggestedForYouListView(
                    title: Languages.of(context).txtPeriodHacks,
                    list: periodHacksList,
                  ),
                  suggestedForYouListView(
                    title: Languages.of(context).txtHealthBodyAndMind,
                    list: healthyBodyMindList,
                  ),
                  suggestedForYouListView(
                    title: Languages.of(context).txtFertilityAndPregnancy,
                    list: fertilityAndPregnancyList,
                  ),
                  suggestedForYouListView(
                    title: Languages.of(context).txtPeriodCareTips,
                    list: periodCareTipsList,
                  ),
                  SizedBox(
                    height: 100.setHeight,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget suggestedForYouListView({
    required List<SuggestedForYouModel> list,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, bottom: 12.setHeight),
            child: CommonText(
              text: title,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 20.setWidth),
              child: Wrap(
                children: list.map((item) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, ExploreSelfCareScreen.route(selfCare: item)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.setHeight),
                          child: Container(
                            width: 160.setWidth,
                            height: 184.setHeight,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).cardBg,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.08),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(right: 15.setHeight),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                  child: Image.asset(
                                    item.imageName,
                                    height: 140.setHeight,
                                    width: 160.setWidth,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: item.title,
                                        fontFamily: Constant.fontFamilyMulishBold700,
                                        fontSize: 12.setFontSize,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (item.isVideo)
                          Positioned(
                            top: 22.setHeight,
                            left: 0.setWidth,
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 4.setHeight),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icVideoPlay,
                                    width: 12.setWidth,
                                    height: 12.setHeight,
                                  ),
                                  SizedBox(width: 2.setWidth),
                                  CommonText(
                                    text: item.duration ?? "",
                                    fontSize: 10.setFontSize,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
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
    if (name == Constant.strBookmark) {
      Navigator.push(context, BookmarkScreen.route());
    }
  }
}
