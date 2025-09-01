import 'package:flutter/material.dart';

import '../../../../../../../ui/search/view/search_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/hashtag_details/view/hashtag_details_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/post/post_item.dart';
import '../../../widgets/text/common_text.dart';
import '../../trending_sound/view/trending_sound_screen.dart';
import '../datamodel/discover_data.dart';

class DiscoverScreen extends StatefulWidget {
  final int currentIndex;

  const DiscoverScreen({super.key, this.currentIndex = 0});
  static Route route({int currentIndex = 0}) {
    return MaterialPageRoute(
      builder: (context) => DiscoverScreen(
        currentIndex: currentIndex,
      ),
    );
  }

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with TickerProviderStateMixin {
  List<String> tabList = [];

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: widget.currentIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).trendingSounds,
      Languages.of(context).hashTags,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        title: CommonText(
          text: Languages.of(context).discover,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
        actions: [
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              child: InkWell(
                onTap: () => Navigator.push(context, SearchScreen.route()),
                child: Image.asset(
                  AppAssets.icSearchFilled,
                  scale: 4,
                  color: CustomAppColor.of(context).icBlack,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [Expanded(child: searchFromTabBar())],
      ),
    );
  }

  Widget searchFromTabBar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(15), right: AppSizes.setWidth(22), left: AppSizes.setWidth(20)),
          child: IgnorePointer(
            ignoring: true,
            child: TabBar(
              controller: _controller,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              unselectedLabelColor: CustomAppColor.of(context).icGrey,
              labelStyle: TextStyle(
                fontFamily: Constant.fontFamilyUrbanist,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w600,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColor.txtPurple,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: AppSizes.setWidth(4), color: AppColor.txtPurple),
              ),
              tabs: tabList.map((tab) {
                return SizedBox(
                  width: AppSizes.setWidth(140),
                  child: Tab(text: tab),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              tabview(discoverList, false),
              tabview(hashTagsList, true),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabview(List<DiscoverList> trendingList, bool? isHashTagTab) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: trendingList.length,
      itemBuilder: (context, index) {
        return discoverItems(trendingList[index], isHashTagTab, index);
      },
    );
  }

  Widget discoverItems(DiscoverList item, bool? isHashTagTab, int? index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            ignoring: true,
            child: GestureDetector(
              onTap: () {
                if (isHashTagTab ?? false) {
                  Navigator.push(context, HashtagDetailsScreen.route());
                } else {
                  Navigator.push(context, TrendingSoundScreen.route());
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isHashTagTab ?? false
                      ? Image.asset(
                          AppAssets.icHashTagAvatar,
                          width: AppSizes.setWidth(46),
                          height: AppSizes.setHeight(46),
                        )
                      : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.profile ?? '',
                                width: AppSizes.setWidth(75),
                                height: AppSizes.setHeight(75),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Visibility(
                              visible: index == 0,
                              child: Positioned.fill(
                                child: Image.asset(
                                  AppAssets.icPlay,
                                  scale: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(width: AppSizes.setWidth(12)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: item.title,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(15),
                        ),
                        CommonText(
                          text: item.username ?? '',
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                          fontSize: AppSizes.setFontSize(12),
                        ),
                        Visibility(
                          visible: !(isHashTagTab ?? false),
                          child: CommonText(
                            text: item.time ?? '',
                            textColor: CustomAppColor.of(context).txtLightGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: AppSizes.setFontSize(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CommonText(
                        text: item.count,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.setFontSize(12),
                      ),
                      SizedBox(width: AppSizes.setWidth(10)),
                      Image.asset(
                        AppAssets.icArrow,
                        height: AppSizes.setHeight(14),
                        width: AppSizes.setWidth(18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          gridPosts(context, item.list),
        ],
      ),
    );
  }

  Widget gridPosts(BuildContext context, List<DiscoverData> itemList) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.setHeight(15)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 7.0,
          childAspectRatio: 0.62,
        ),
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return post(itemList[index]);
        },
      ),
    );
  }

  Widget post(DiscoverData trendingSound) {
    return PostWidget(
      postImage: trendingSound.postImage,
      playIcon: AppAssets.icPlay,
      likeCountText: trendingSound.viewCount ?? '',
      postTitle: trendingSound.postImage,
      userName: AppStrings.johnDoe,
      duration: "00:30",
    );
  }
}
