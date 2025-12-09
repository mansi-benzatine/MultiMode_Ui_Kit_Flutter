import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/explore_self_care/view/explore_self_care_screen.dart';
import 'package:flowly_app/ui/home/datamodel/home_data.dart';
import 'package:flowly_app/utils/app_assets.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const BookmarkScreen());
  }

  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> implements TopBarClickListener {
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
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
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
            title: Languages.of(context).txtBookmarks,
            isShowBack: true,
          ),
          Expanded(
            child: periodBasicList.isNotEmpty
                ? suggestedForYouListView(list: periodBasicList)
                : Padding(
                    padding: EdgeInsets.only(top: 0.screenHeight / 3.3),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icEmptyBookmark,
                          height: 60.setHeight,
                          width: 60.setWidth,
                        ),
                        SizedBox(height: 18.setHeight),
                        CommonText(
                          text: Languages.of(context).txtNoBookmarksYet,
                          fontFamily: Constant.fontFamilyMulishExtraBold800,
                          fontSize: 20.setFontSize,
                        ),
                        SizedBox(height: 10.setHeight),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
                          child: CommonText(
                            text: Languages.of(context).txtNoBookmarksYetDesc,
                            fontSize: 16.setFontSize,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget suggestedForYouListView({required List<SuggestedForYouModel> list}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
