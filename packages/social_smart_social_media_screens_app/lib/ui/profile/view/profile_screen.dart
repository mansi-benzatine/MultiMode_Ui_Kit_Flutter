import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/edit_profile/view/edit_profile_screen.dart';
import '../../../ui/find_friends/view/find_friends_screen.dart';
import '../../../ui/message/view/message_screen.dart';
import '../../../ui/setting/view/setting_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../followers/view/followers_screen.dart';
import '../datamodel/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  final bool? fromPost;
  final bool isForSwitchAccount;
  final int currentIndex;

  const ProfileScreen({super.key, this.fromPost, this.isForSwitchAccount = false, this.currentIndex = 0});
  static Route route({bool? isFromPost, bool isForSwitchAccount = false, int currentIndex = 0}) {
    return MaterialPageRoute(
      builder: (context) => ProfileScreen(
        fromPost: isFromPost,
        isForSwitchAccount: isForSwitchAccount,
        currentIndex: currentIndex,
      ),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  List<String> tabList = [];
  late TabController _controller;
  List<ProfileData> profileData = [];
  List<ProfileData> profileDetails = [];
  bool _isBottomSheetOpen = true;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3, initialIndex: widget.currentIndex);
    tabList = [
      AppAssets.icCategory,
      AppAssets.icSavePost,
      AppAssets.icHeart,
    ];
    _controller.addListener(() {
      setState(() {});
    });
    if (widget.isForSwitchAccount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSwitchAccountBS();
      });
    }
  }

  void showSwitchAccountBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      backgroundColor: CustomAppColor.of(context).bgBottomSheet,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: AppSizes.setHeight(30),
            left: AppSizes.setWidth(20),
            right: AppSizes.setWidth(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(context).switchAccount,
                fontSize: AppSizes.setFontSize(20),
                fontWeight: FontWeight.w700,
              ),
              const Divider(color: AppColor.btnLightGrey, thickness: 0.4),
              SizedBox(height: AppSizes.setHeight(15)),
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      AppAssets.imgProfile,
                      height: AppSizes.setHeight(50),
                      width: AppSizes.setWidth(50),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(15)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: AppStrings.johnDoe,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(16),
                        ),
                        CommonText(
                          text: AppStrings.john.replaceAll("@", ""),
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtDarkGrey,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(AppAssets.icRightArrow, scale: 4.5)
                ],
              ),
              SizedBox(height: AppSizes.setHeight(14)),
              Row(
                children: [
                  Container(
                    width: AppSizes.setWidth(50),
                    height: AppSizes.setHeight(50),
                    decoration: BoxDecoration(color: AppColor.bgImage, borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      AppAssets.icAdd,
                      scale: 4.5,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(15)),
                  CommonText(
                    text: Languages.of(context).addAccount,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                  ),
                ],
              )
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void fillData() {
    profileData = [
      ProfileData(
        count: "980",
        profileContent: Languages.of(context).posts,
      ),
      ProfileData(
        count: "5.4M",
        profileContent: Languages.of(context).followers,
        screen: const FollowersScreen(),
      ),
      ProfileData(
        count: "556",
        profileContent: Languages.of(context).following,
        screen: const FollowersScreen(),
      ),
      ProfileData(
        count: "48M",
        profileContent: Languages.of(context).likes,
        islike: true,
      ),
    ];
    profileDetails = [
      ProfileData(count: "987", profileContent: Languages.of(context).posts),
      ProfileData(
        count: "6.8M",
        profileContent: Languages.of(context).followers,
        screen: const FollowersScreen(),
      ),
      ProfileData(
        count: "856",
        profileContent: Languages.of(context).following,
        screen: const FollowersScreen(),
      ),
      ProfileData(
        count: "93M",
        profileContent: Languages.of(context).likes,
        islike: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return PopScope(
      canPop: (!_isBottomSheetOpen) || (widget.fromPost ?? false),
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          centerTitle: (widget.fromPost ?? false) ? false : true,
          title: Row(
            mainAxisAlignment: (widget.fromPost ?? false) ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              CommonText(
                text: (widget.fromPost ?? false) ? AppStrings.elizaWoods : AppStrings.johnDoe.toLowerCase().replaceAll(' ', '').replaceFirstMapped(RegExp(r'^\w'), (m) => m.group(0)!.toUpperCase()),
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(18),
              ),
              Visibility(
                visible: !(widget.fromPost ?? false),
                child: IconButton(
                  onPressed: () => showAddAccountBottomSheet(context),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                ),
              )
            ],
          ),
          leading: !(widget.fromPost ?? false)
              ? IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icAddProfile,
                      color: CustomAppColor.of(context).icBlack,
                      width: AppSizes.setWidth(21),
                      height: AppSizes.setHeight(22),
                    ),
                    onPressed: () => Navigator.push(context, FindFriendsScreen.route()),
                  ),
                )
              : IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
          actions: [
            Visibility(
              visible: (widget.fromPost ?? false),
              child: IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                  child: Image.asset(
                    color: CustomAppColor.of(context).icBlack,
                    AppAssets.icNotification,
                    scale: 4.2,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !(widget.fromPost ?? false),
              child: IgnorePointer(
                ignoring: true,
                child: IconButton(
                  onPressed: () => Navigator.push(context, SettingScreen.route()),
                  icon: Image.asset(
                    AppAssets.icSetting,
                    color: CustomAppColor.of(context).icBlack,
                    width: AppSizes.setWidth(26),
                    height: AppSizes.setHeight(26),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(25), bottom: AppSizes.setHeight(10)),
                    child: Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage((widget.fromPost ?? false) ? AppAssets.imgProfile5 : AppAssets.imgProfile),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !(widget.fromPost ?? false),
                    child: Positioned.fill(
                      top: AppSizes.setHeight(90),
                      left: AppSizes.setWidth(80),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppAssets.icProfileEdit,
                          scale: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CommonText(
                text: (widget.fromPost ?? false) ? AppStrings.eliza : AppStrings.john,
                fontSize: AppSizes.setFontSize(18),
                fontWeight: FontWeight.w700,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
                child: CommonText(
                  text: (widget.fromPost ?? false) ? AppStrings.fashionDesigner : AppStrings.designerPhoto,
                  fontSize: AppSizes.setFontSize(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              _profileDetails(context),
              _postButtons(context),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
                  child: TabBar(
                    controller: _controller,
                    tabAlignment: TabAlignment.fill,
                    labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(40)),
                    isScrollable: false,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(width: AppSizes.setWidth(3), color: CustomAppColor.of(context).purple),
                      insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(65)),
                    ),
                    tabs: tabList.map((tab) {
                      int index = tabList.indexOf(tab);
                      return Tab(
                        icon: Image.asset(
                          tab,
                          scale: 4.5,
                          color: _controller.index == index ? CustomAppColor.of(context).purple : CustomAppColor.of(context).grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              _gridPosts(context),
            ],
          ),
        ),
      ),
    );
  }

  _profileDetails(BuildContext context) {
    final data = widget.fromPost ?? false ? profileData : profileDetails;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.setWidth(24),
        vertical: AppSizes.setHeight(10),
      ),
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
          return _postContent(
            counts: profile.count.toString(),
            profileCountDetail: profile.profileContent,
            screen: profile.screen,
            isLike: profile.islike,
          );
        }),
      ),
    );
  }

  _postContent({required String counts, required String profileCountDetail, Widget? screen, bool? isLike}) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          if (screen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          }
          if (isLike ?? false) {
            likeAlert();
          }
        },
        child: Column(
          children: [
            CommonText(
              text: counts,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(22),
              textColor: widget.fromPost ?? false ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).txtBlack,
            ),
            CommonText(
              text: profileCountDetail,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.setFontSize(14),
            )
          ],
        ),
      ),
    );
  }

  _postButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
      child: Row(
        children: [
          Visibility(
            visible: (widget.fromPost ?? false),
            child: Flexible(
              child: CommonButton(
                height: AppSizes.setHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icProfileAdd,
                      width: AppSizes.setWidth(15),
                      height: AppSizes.setHeight(15),
                    ),
                    SizedBox(
                      width: AppSizes.setWidth(8),
                    ),
                    CommonText(
                      text: Languages.of(context).follow,
                      textColor: CustomAppColor.of(context).white,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizes.setWidth(15)),
          Expanded(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                onTap: () => !(widget.fromPost ?? false) ? Navigator.push(context, EditProfileScreen.route()) : Navigator.push(context, MessageScreen.route(false)),
                buttonColor: CustomAppColor.of(context).bgScaffold,
                isOutLinedButton: true,
                height: AppSizes.setHeight(38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icComment,
                      color: CustomAppColor.of(context).bgGradiant2,
                      width: AppSizes.setWidth(18),
                      height: AppSizes.setHeight(18),
                    ),
                    SizedBox(width: AppSizes.setWidth(8)),
                    CommonText(
                      text: !(widget.fromPost ?? false) ? Languages.of(context).editProfile : Languages.of(context).message,
                      textColor: CustomAppColor.of(context).purple,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _gridPosts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(15)),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.65,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          ((widget.fromPost ?? false) && (_controller.index == 0))
              ? profilePosts.length
              : _controller.index == 1
                  ? savePosts.length
                  : _controller.index == 2
                      ? likesPosts.length
                      : profileDetailPost.length,
          (index) {
            return _post(
                profilePosts: widget.fromPost ?? false
                    ? profilePosts[index]
                    : _controller.index == 1
                        ? savePosts[index]
                        : _controller.index == 2
                            ? likesPosts[index]
                            : profileDetailPost[index]);
          },
        ),
      ),
    );
  }

  _post({required ProfilePosts profilePosts}) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              profilePosts.postImage,
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
          bottom: 6,
          left: 8,
          child: Row(
            children: [
              Image.asset(
                profilePosts.isPost ?? false ? AppAssets.icImage : AppAssets.icPlay,
                width: AppSizes.setWidth(13),
                height: AppSizes.setHeight(13),
                color: CustomAppColor.of(context).white,
              ),
              SizedBox(width: AppSizes.setWidth(5)),
              CommonText(
                text: profilePosts.playCount,
                textColor: AppColor.txtWhite,
                fontSize: AppSizes.setFontSize(10),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future likeAlert() {
    return showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          titleText: CommonText(
            text: AppStrings.totalLikes,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.setFontSize(20),
            textColor: CustomAppColor.of(context).purple,
          ),
          descriptionText: CommonText(
            text: AppStrings.elizaWoodsReceivedATotalLikes,
            fontSize: AppSizes.setFontSize(14),
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          icon: Image.asset(
            AppAssets.imgLikes,
            height: AppSizes.setHeight(180),
          ),
          button: CommonButton(
            onTap: () => Navigator.pop(context),
            btnText: Languages.of(context).ok.toUpperCase(),
          ),
        );
      },
    );
  }

  void showAddAccountBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CustomAppColor.of(context).bgBottomSheet,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: AppSizes.setHeight(30),
            left: AppSizes.setWidth(20),
            right: AppSizes.setWidth(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(context).switchAccount,
                fontSize: AppSizes.setFontSize(20),
                fontWeight: FontWeight.w700,
              ),
              const Divider(color: AppColor.btnLightGrey, thickness: 0.4),
              SizedBox(height: AppSizes.setHeight(15)),
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      AppAssets.imgProfile,
                      height: AppSizes.setHeight(50),
                      width: AppSizes.setWidth(50),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(15)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: AppStrings.johnDoe,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(16),
                        ),
                        CommonText(
                          text: AppStrings.john.replaceAll("@", ""),
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtDarkGrey,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(AppAssets.icRightArrow, scale: 4.5)
                ],
              ),
              SizedBox(height: AppSizes.setHeight(14)),
              Row(
                children: [
                  Container(
                    width: AppSizes.setWidth(50),
                    height: AppSizes.setHeight(50),
                    decoration: BoxDecoration(color: AppColor.bgImage, borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      AppAssets.icAdd,
                      scale: 4.5,
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(15)),
                  CommonText(
                    text: Languages.of(context).addAccount,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
