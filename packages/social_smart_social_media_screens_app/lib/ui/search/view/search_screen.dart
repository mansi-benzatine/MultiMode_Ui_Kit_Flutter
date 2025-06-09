import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../../localization/language/languages.dart';
import '../../../../../../../../../utils/app_assets.dart';
import '../../../../../../../../../utils/app_color.dart';
import '../../../../../../../../../utils/sizer_utils.dart';
import '../../../../../../../../../widgets/text/common_text.dart';
import '../../../../../../../../../widgets/text/gradiant_text.dart';
import '../../../../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../followers/datamodel/followers_data.dart';
import '../datamodel/search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SearchScreen(),
    );
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;
  late TabController _controller;

  List<String> tabList = [];
  bool _isSeeResult = false;
  List<FollowersData> localFollowers = [];
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 6);
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
    localFollowers = getUsers;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).top,
      Languages.of(context).users,
      Languages.of(context).videos,
      Languages.of(context).sounds,
      Languages.of(context).live,
      Languages.of(context).hashTags,
    ];
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
        statusBarBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(
            top: AppSizes.setHeight(50),
          ),
          bottom: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
                child: CommonTextFormField(
                  focusNode: _focusNode,
                  borderColor: _isTextFieldFocused ? AppColor.txtPurple : AppColor.transparent,
                  leadingIcon: Image.asset(
                    AppAssets.icSearchFilled,
                    color: CustomAppColor.of(context).icBlack.withOpacityPercent(0.6),
                    scale: 5.5,
                  ),
                  fillColor: _isTextFieldFocused ? AppColor.txtPurple.withOpacityPercent(0.18) : CustomAppColor.of(context).bgShadow,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: (_isTextFieldFocused || !_isSeeResult) ? searchUser(context) : searchFromTabBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchUser(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).recent,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(18),
                ),
                CommonText(
                  text: Languages.of(context).clearAll,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(15),
                  textColor: AppColor.txtPurple,
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: recentSearch.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final recent = recentSearch[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: recent.userName ?? '',
                        fontWeight: FontWeight.w400,
                        fontSize: AppSizes.setFontSize(16),
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      ),
                      const Icon(
                        Icons.clear,
                        color: AppColor.grey,
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
              child: CommonText(
                text: Languages.of(context).suggestedSearches,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(18),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: suggestedSearch.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final suggested = suggestedSearch[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: suggested.userName ?? '',
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                        fontSize: AppSizes.setFontSize(16),
                      ),
                      Image.asset(
                        AppAssets.icSearchFilled,
                        scale: 5.5,
                        color: AppColor.grey,
                      )
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSeeResult = true;
                  _isTextFieldFocused = false;
                  _focusNode.unfocus();
                });
              },
              child: Center(
                child: GradientText(
                  child: CommonText(
                    text: Languages.of(context).seeAllResult,
                    fontSize: AppSizes.setFontSize(17),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchFromTabBar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppSizes.setWidth(22), right: AppSizes.setWidth(14)),
          child: TabBar(
            controller: _controller,
            tabAlignment: TabAlignment.center,
            labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: AppColor.txtGrey,
            labelStyle: TextStyle(
              fontFamily: Constant.fontFamilyUrbanist,
              fontSize: AppSizes.setFontSize(16),
              fontWeight: FontWeight.w600,
            ),
            labelColor: AppColor.txtPurple,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: AppSizes.setWidth(2), color: AppColor.txtPurple),
            ),
            tabs: tabList.map((tab) {
              return SizedBox(
                width: AppSizes.setWidth(68),
                child: Tab(
                  text: tab,
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              topTabView(context),
              usersTabView(context: context, users: localFollowers),
              videoTabView(isVideoShown: true),
              soundTabView(sound: sounds),
              liveTabView(),
              hashtagTabView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget usersTabView({required BuildContext context, int? userLength, bool? fromTopTabView, List? users}) {
    final followers = users;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
      itemCount: userLength ?? followers?.length,
      physics: fromTopTabView ?? false ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final follower = followers?[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(follower.followerProfile),
            radius: 26,
          ),
          title: CommonText(
            text: follower.followerName,
            fontSize: AppSizes.setFontSize(15),
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          subtitle: CommonText(
            text: follower.followerDetails,
            fontSize: AppSizes.setFontSize(12),
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
            textAlign: TextAlign.start,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    follower.isFollowing = !follower.isFollowing;
                  });
                  ToastUtils.showToast(
                    follower.isFollowing! ? "Followed !" : "Unfollowed !",
                  );
                },
                child: CommonButton(
                  isOutLinedButton: follower.isFollowing ?? false ? true : false,
                  width: AppSizes.setWidth(74),
                  height: AppSizes.setHeight(30),
                  child: CommonText(
                    text: follower.isFollowing ?? false ? Languages.of(context).following : Languages.of(context).follow,
                    fontSize: AppSizes.setFontSize(12),
                    fontWeight: FontWeight.w700,
                    textColor: follower.isFollowing ?? false ? AppColor.txtPurple : AppColor.txtWhite,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget soundTabView({bool? fromTopTabView, List? sound}) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(0), horizontal: AppSizes.setWidth(16)),
      itemCount: sound?.length,
      physics: fromTopTabView ?? false ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final sounds = sound?[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    sounds?.post ?? '',
                    fit: BoxFit.fill,
                    height: AppSizes.setHeight(70),
                    width: AppSizes.setWidth(70),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.black.withOpacityPercent(0.2),
                            AppColor.btnGradiant2.withOpacityPercent(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.icPlay,
                      scale: 3,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: sounds?.soundName ?? '',
                        fontSize: AppSizes.setFontSize(15),
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: AppSizes.setHeight(2)),
                      CommonText(
                        text: sounds?.userName ?? '',
                        fontSize: AppSizes.setFontSize(14),
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtDarkGrey,
                      ),
                      SizedBox(height: AppSizes.setHeight(2)),
                      CommonText(
                        text: sounds?.time ?? "01:00",
                        fontSize: AppSizes.setFontSize(13),
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtDarkGrey,
                      ),
                    ],
                  ),
                ),
              ),
              CommonText(
                text: sounds?.soundCount,
                fontSize: AppSizes.setFontSize(13),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget topTabView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: Languages.of(context).users,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: AppSizes.setHeight(150)),
            child: usersTabView(
              context: context,
              userLength: 2,
              fromTopTabView: true,
              users: getTopUsers,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: CommonText(
              text: Languages.of(context).videos,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: AppSizes.setHeight(210)),
            child: videoTabView(
              videoLength: 3,
              gridCount: 3,
              fromTopTabView: true,
            ),
          ),
          SizedBox(height: AppSizes.setHeight(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: CommonText(
              text: Languages.of(context).sounds,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: AppSizes.setHeight(200)),
            child: soundTabView(fromTopTabView: true, sound: topSounds),
          ),
        ],
      ),
    );
  }

  Widget videoTabView({int? videoLength, int? gridCount, bool? isVideoShown, bool? fromTopTabView}) {
    final list = fromTopTabView ?? false ? topVideos : videos;
    return GridView.count(
      padding: EdgeInsets.only(
        top: AppSizes.setHeight(16),
        left: AppSizes.setWidth(16),
        right: AppSizes.setWidth(16),
      ),
      crossAxisCount: gridCount ?? 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 8.0,
      childAspectRatio: fromTopTabView == true ? 0.65 : 0.60,
      shrinkWrap: true,
      physics: fromTopTabView ?? false ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      children: List.generate(
        videoLength ?? videos.length,
        (index) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          list[index].post ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [AppColor.black.withOpacityPercent(0.2), AppColor.btnGradiant2.withOpacityPercent(0.5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: AppSizes.setHeight(6),
                      left: AppSizes.setWidth(8),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.icPlay,
                            scale: 4.2,
                          ),
                          SizedBox(width: AppSizes.setWidth(4)),
                          CommonText(
                            text: list[index].soundCount ?? '',
                            textColor: AppColor.txtWhite,
                            fontSize: AppSizes.setFontSize(11),
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: isVideoShown ?? false,
                child: Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(videos[index].userAvatar ?? ''),
                        radius: 12,
                      ),
                      SizedBox(width: AppSizes.setWidth(8)),
                      CommonText(
                        text: videos[index].userName ?? '',
                        fontSize: AppSizes.setFontSize(10),
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget liveTabView() {
    return GridView.count(
      padding: EdgeInsets.only(
        top: AppSizes.setHeight(16),
        left: AppSizes.setWidth(16),
        right: AppSizes.setWidth(16),
      ),
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.60,
      shrinkWrap: true,
      children: List.generate(
        lives.length,
        (index) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          lives[index].post ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 6,
                        left: 8,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: AppSizes.setWidth(4)),
                              child: Container(
                                height: AppSizes.setHeight(20),
                                width: AppSizes.setWidth(35),
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.btnGradiant2,
                                ),
                                child: CommonText(
                                  text: Languages.of(context).live.toUpperCase(),
                                  textColor: AppColor.txtWhite,
                                  fontSize: AppSizes.setFontSize(9),
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: AppSizes.setHeight(24),
                              width: AppSizes.setWidth(60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.black.withOpacityPercent(0.4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    AppAssets.icViewer,
                                    scale: 4.2,
                                  ),
                                  CommonText(
                                    text: lives[index].soundCount ?? '',
                                    textColor: AppColor.txtWhite,
                                    fontSize: AppSizes.setFontSize(11),
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(lives[index].userAvatar ?? ''),
                      radius: 12,
                    ),
                    SizedBox(
                      width: AppSizes.setWidth(8),
                    ),
                    CommonText(
                      text: lives[index].userName ?? '',
                      fontSize: AppSizes.setFontSize(10),
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget hashtagTabView() {
    return ListView.builder(
      itemCount: hashTags.length,
      itemBuilder: (context, index) {
        final hasTag = hashTags[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(8)),
          leading: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(140),
            ),
            child: Image.asset(
              AppAssets.icHashTag,
            ),
          ),
          title: CommonText(
            text: hasTag.userName?.toLowerCase() ?? '',
            fontSize: AppSizes.setFontSize(15),
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          trailing: CommonText(
            text: hasTag.soundCount ?? '',
            fontSize: AppSizes.setFontSize(14),
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtDarkGrey,
            textAlign: TextAlign.start,
          ),
        );
      },
    );
  }
}
