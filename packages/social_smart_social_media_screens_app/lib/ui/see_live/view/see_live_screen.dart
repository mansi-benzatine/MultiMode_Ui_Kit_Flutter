import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../../../../../../../localization/language/languages.dart';
import '../../../../../../../../../ui/home/view/home_screen.dart';
import '../../../../../../../../../utils/string_constant.dart';
import '../../../../../../../../../widgets/button/common_button.dart';
import '../../../../../../../../../widgets/text/gradiant_text.dart';
import '../../../../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../create_posts/datamodel/create_posts_data.dart';
import '../datamodel/see_live_data.dart';

class SeeLiveScreen extends StatefulWidget {
  const SeeLiveScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SeeLiveScreen(),
    );
  }

  @override
  State<SeeLiveScreen> createState() => _SeeLiveScreenState();
}

class _SeeLiveScreenState extends State<SeeLiveScreen> with TickerProviderStateMixin {
  List<String> tabList = [];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);

    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).weeklyRanking,
      Languages.of(context).risingStars,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfile,
              width: AppSizes.fullWidth,
              height: AppSizes.fullHeight,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
            ),
            Positioned(top: AppSizes.setHeight(70), left: AppSizes.setWidth(20), child: liveDetails()),
            Positioned(
              bottom: AppSizes.setHeight(60),
              left: AppSizes.setWidth(0),
              right: AppSizes.setWidth(0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.setWidth(20),
                  vertical: AppSizes.setHeight(10),
                ),
                child: usersComments(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: liveActionIcons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget liveDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AppAssets.imgProfile),
            ),
            SizedBox(width: AppSizes.setWidth(14)),
            GestureDetector(
              onTap: () => _showProfileBottomSheet(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: AppStrings.johnDoe,
                    textColor: CustomAppColor.of(context).white,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(14),
                  ),
                  SizedBox(
                    width: AppSizes.setWidth(82),
                    child: CommonText(
                      text: AppStrings.designerPhoto,
                      fontSize: AppSizes.setFontSize(12),
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      textColor: const Color(0xFFE0E0E0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSizes.setWidth(14)),
            CommonButton(
              width: AppSizes.setWidth(66),
              height: AppSizes.setHeight(28),
              borderColor: AppColor.transparent,
              child: CommonText(
                text: Languages.of(context).follow,
                fontSize: AppSizes.setFontSize(12),
                fontWeight: FontWeight.w600,
                textColor: AppColor.txtWhite,
              ),
            ),
            SizedBox(width: AppSizes.setWidth(16)),
            GestureDetector(
              onTap: () => _showViewersBottomSheet(context),
              child: Container(
                width: AppSizes.setWidth(72),
                height: AppSizes.setHeight(28),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.black.withOpacityPercent(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icViewer,
                      scale: 4.5,
                    ),
                    SizedBox(width: AppSizes.setWidth(8)),
                    CommonText(
                      text: "8.8K",
                      fontSize: AppSizes.setFontSize(12),
                      fontWeight: FontWeight.w600,
                      textColor: AppColor.txtWhite,
                    ),
                  ],
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    HomeScreen.route(
                      isFromProfile: false,
                      isFromDiscover: false,
                      isFromInbox: false,
                      isFromHome: false,
                      isFromOptionsForPosts: false,
                    )),
                icon: const Icon(
                  Icons.clear,
                  color: AppColor.white,
                  size: 18,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: AppSizes.setHeight(12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showWeeklyRankingBottomSheet(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
                height: AppSizes.setHeight(28),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.black.withOpacityPercent(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icStar,
                      scale: 4.5,
                    ),
                    SizedBox(width: AppSizes.setWidth(6)),
                    CommonText(
                      text: Languages.of(context).weeklyRanking,
                      fontSize: AppSizes.setFontSize(12),
                      textColor: AppColor.txtWhite,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              height: AppSizes.setHeight(28),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColor.black.withOpacityPercent(0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icExplore,
                    scale: 4.5,
                  ),
                  SizedBox(width: AppSizes.setWidth(6)),
                  CommonText(
                    text: Languages.of(context).explore,
                    fontSize: AppSizes.setFontSize(12),
                    textColor: AppColor.txtWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget usersComments() {
    final commentList = seeLiveUsers(context);

    return ListView.builder(
      itemCount: commentList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final comment = commentList[index];

        final isLightened = index < 2;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(comment.avatar),
                  ),
                  SizedBox(width: AppSizes.setWidth(16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: comment.name,
                        textColor: isLightened ? AppColor.txtWhite.withOpacityPercent(0.5) : AppColor.txtWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(14),
                      ),
                      SizedBox(height: AppSizes.setHeight(2)),
                      CommonText(
                        text: comment.text,
                        textColor: isLightened ? AppColor.txtWhite.withOpacityPercent(0.5) : AppColor.txtWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: AppSizes.setFontSize(12),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget liveActionIcons() {
    final List<IconItem> items = liveIcon(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: CommonTextFormField(
              fillColor: Color(0xFF1F222A),
              hintText: AppStrings.comments,
              hintStyle: TextStyle(color: AppColor.txtDarkGrey),
            ),
          ),
          SizedBox(width: AppSizes.setWidth(10)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: items.map((item) => iconList(item: item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget iconList({required IconItem item}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              handleIconTap(item.label, context);
            },
            child: Image.asset(
              item.iconAsset,
              height: AppSizes.setHeight(20),
              width: AppSizes.setWidth(22),
              fit: BoxFit.contain,
            ),
          ),
          CommonText(
            text: item.label ?? '',
            textColor: AppColor.txtWhite,
            fontSize: AppSizes.setFontSize(10),
          ),
        ],
      ),
    );
  }

  void handleIconTap(String? label, BuildContext context) {
    switch (label) {
      case "Live to":
        _showGoLiveTogetherBottomSheet(context);
        break;
      case 'QnA':
        _showQnABottomSheet(context);
        break;
      case 'comment':
        break;
      default:
    }
  }

  void _showProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppAssets.imgProfile),
                ),
                SizedBox(height: AppSizes.setHeight(12)),
                CommonText(
                  text: "@${AppStrings.johnDoe.toLowerCase()}",
                  fontSize: AppSizes.setFontSize(20),
                  fontWeight: FontWeight.w700,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                  child: CommonText(
                    text: AppStrings.designerPhoto,
                    fontSize: AppSizes.setFontSize(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(thickness: 0.4),
                // SizedBox(height: AppSizes.setHeight(4)),
                profileDetails(context),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14)),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          height: AppSizes.setHeight(45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icProfileAdd,
                                color: CustomAppColor.of(context).white,
                                width: AppSizes.setWidth(22),
                                height: AppSizes.setHeight(22),
                              ),
                              SizedBox(width: AppSizes.setWidth(8)),
                              CommonText(
                                text: Languages.of(context).follow,
                                fontSize: AppSizes.setFontSize(16),
                                fontWeight: FontWeight.w700,
                                textColor: AppColor.txtWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.setWidth(10)),
                      Expanded(
                        child: CommonButton(
                          height: AppSizes.setHeight(45),
                          isOutLinedButton: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icComment,
                                color: AppColor.txtPurple,
                                width: AppSizes.setWidth(20),
                                height: AppSizes.setHeight(20),
                              ),
                              SizedBox(width: AppSizes.setWidth(8)),
                              GradientText(
                                child: CommonText(
                                  text: Languages.of(context).message,
                                  fontSize: AppSizes.setFontSize(16),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget profileDetails(BuildContext context) {
    final data = seeLiveProfileData(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10), vertical: AppSizes.setHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(data.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Container(
              width: AppSizes.setWidth(2),
              height: AppSizes.setHeight(50),
              color: CustomAppColor.of(context).divider,
            );
          }
          final profile = data[index ~/ 2];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
            child: postContent(
              counts: profile.count.toString(),
              profileCountDetail: profile.profileContent,
              screen: profile.screen,
              isLike: profile.islike,
            ),
          );
        }),
      ),
    );
  }

  Widget postContent({required String counts, required String profileCountDetail, Widget? screen, bool? isLike}) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          CommonText(
            text: counts,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(22),
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          CommonText(
            text: profileCountDetail,
            fontWeight: FontWeight.w200,
            fontSize: AppSizes.setFontSize(14),
          )
        ],
      ),
    );
  }

  Widget suggestedFollowersList({required BuildContext context, bool? isQnA, bool? isRisingStar, bool? isWeeklyRanking, bool? isGoLiveTogether}) {
    final followers = isQnA ?? false
        ? getQnAList
        : isWeeklyRanking ?? false
            ? (isRisingStar ?? false ? getRisingStarsList : getWeeklyRankingList)
            : isGoLiveTogether ?? false
                ? getGoLiveTogether
                : getViewersList;

    return ListView.builder(
      itemCount: followers.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final follower = followers[index];
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.setWidth(8),
              vertical: (isWeeklyRanking ?? false)
                  ? AppSizes.setHeight(0)
                  : ((isGoLiveTogether ?? false) || (isQnA ?? false))
                      ? AppSizes.setHeight(2)
                      : AppSizes.setHeight(8)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: AssetImage(follower.followerProfile),
              radius: 26,
            ),
            title: CommonText(
              text: follower.followerName,
              fontSize: isQnA ?? false ? AppSizes.setFontSize(13) : AppSizes.setFontSize(15),
              fontWeight: isQnA ?? false ? FontWeight.w400 : FontWeight.w700,
              textColor: isQnA ?? false ? CustomAppColor(context).txtGrey : CustomAppColor.of(context).txtDarkGrey,
              textAlign: TextAlign.start,
            ),
            subtitle: isQnA ?? false
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(5)),
                    child: CommonText(
                      text: follower.message ?? '',
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : isWeeklyRanking ?? false
                    ? CommonText(
                        text: follower.followerDetails ?? '',
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontSize: AppSizes.setFontSize(12),
                      )
                    : isGoLiveTogether ?? false
                        ? CommonText(
                            text: "${follower.followerDetails} min ago",
                            textAlign: TextAlign.start,
                            textColor: CustomAppColor.of(context).txtGrey,
                            fontSize: AppSizes.setFontSize(12),
                          )
                        : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isQnA ?? false
                    ? Column(
                        children: [
                          follower.isLiked ?? false
                              ? Image.asset(
                                  AppAssets.icLike,
                                  scale: 5.5,
                                )
                              : Image.asset(
                                  AppAssets.icHeartFilled,
                                  scale: 5.5,
                                ),
                          CommonText(
                            text: follower.likeCount ?? '',
                            fontSize: AppSizes.setFontSize(10),
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )
                    : CommonButton(
                        isOutLinedButton: follower.isFollowing ?? false ? true : false,
                        width: follower.isFollowing ?? false ? AppSizes.setWidth(74) : AppSizes.setWidth(70),
                        height: AppSizes.setHeight(32),
                        child: CommonText(
                          text: follower.isFollowing ?? false ? Languages.of(context).following : Languages.of(context).follow,
                          fontSize: AppSizes.setFontSize(12),
                          fontWeight: FontWeight.w700,
                          textColor: follower.isFollowing ?? false ? AppColor.txtPurple : AppColor.txtWhite,
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget textField() {
    return Row(
      children: [
        Expanded(
          child: CommonTextFormField(
            hintText: "${Languages.of(context).askAQuestion}...",
            hintStyle: const TextStyle(color: AppColor.btnLightGrey, fontWeight: FontWeight.w400, fontFamily: Constant.fontFamilyUrbanist),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.icEmoji,
                  width: AppSizes.setWidth(22),
                  height: AppSizes.setHeight(20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: AppSizes.setWidth(20)),
        Image.asset(
          AppAssets.icSend,
          scale: 4,
        )
      ],
    );
  }

  void _showViewersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: "8.8K ${Languages.of(context).viewers}",
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(20),
                  textAlign: TextAlign.center,
                ),
                const Divider(thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonTextFormField(
                    fillColor: CustomAppColor.of(context).bgShadow,
                    borderColor: AppColor.transparent,
                    leadingIcon: Image.asset(
                      AppAssets.icSearchFilled,
                      color: CustomAppColor.of(context).grey,
                      scale: 5.5,
                    ),
                    hintText: Languages.of(context).search,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CommonText(
                    text: AppStrings.questionsFromGuests,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                    textAlign: TextAlign.start,
                  ),
                ),
                Flexible(
                  child: suggestedFollowersList(
                    context: context,
                    isQnA: false,
                    isWeeklyRanking: false,
                    isRisingStar: false,
                    isGoLiveTogether: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showQnABottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: Languages.of(context).questionAndAnswer,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(20),
                  textAlign: TextAlign.center,
                ),
                const Divider(thickness: 0.5),
                SizedBox(height: AppSizes.setHeight(15)),
                Align(
                  alignment: Alignment.topLeft,
                  child: CommonText(
                    text: AppStrings.questionsFromGuests,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                    textAlign: TextAlign.start,
                    textColor: const Color(0xFF424242),
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(15)),
                Flexible(
                  child: suggestedFollowersList(
                    context: context,
                    isQnA: true,
                    isWeeklyRanking: false,
                    isRisingStar: false,
                    isGoLiveTogether: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                  child: textField(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showGoLiveTogetherBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.54,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: AppStrings.goLiveTogether,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(20),
                  textAlign: TextAlign.center,
                ),
                const Divider(thickness: 0.5),
                SizedBox(height: AppSizes.setHeight(15)),
                Align(
                  alignment: Alignment.topLeft,
                  child: CommonText(
                    text: AppStrings.guestRequest,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                    textAlign: TextAlign.start,
                    textColor: const Color(0xFF424242),
                  ),
                ),
                SizedBox(height: AppSizes.setHeight(15)),
                Flexible(
                  child: suggestedFollowersList(
                    context: context,
                    isQnA: false,
                    isWeeklyRanking: false,
                    isRisingStar: false,
                    isGoLiveTogether: true,
                  ),
                ),
                Divider(color: CustomAppColor.of(context).containerGrey, thickness: 0.5),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                  child: CommonButton(btnText: Languages.of(context).request),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWeeklyRankingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(30)),
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
                        borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
                      ),
                      tabs: tabList.map((tab) => Tab(text: tab)).toList(),
                    ),
                  ),
                  Flexible(
                    child: TabBarView(
                      children: [
                        suggestedFollowersList(
                          context: context,
                          isQnA: false,
                          isWeeklyRanking: true,
                          isRisingStar: false,
                          isGoLiveTogether: false,
                        ),
                        suggestedFollowersList(
                          context: context,
                          isQnA: false,
                          isWeeklyRanking: true,
                          isRisingStar: true,
                          isGoLiveTogether: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
