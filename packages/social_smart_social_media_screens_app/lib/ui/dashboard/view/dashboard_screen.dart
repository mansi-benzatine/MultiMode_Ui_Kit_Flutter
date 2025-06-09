import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';
import 'package:video_player/video_player.dart';

import '../../../localization/language/languages.dart';
import '../../../ui/dashboard/datamodel/dashboard_datamodel.dart';
import '../../../ui/profile/view/profile_screen.dart';
import '../../../ui/report/view/report_screen.dart';
import '../../../ui/search/view/search_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const DashboardScreen(),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  int currantPageIndex = 0;
  bool isLiked = false;
  List<VideoPlayerController?> controllers = [];
  bool isLoading = true;
  List<DashboardItems> items = [];
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    loadVideos();
    animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  Future<void> loadVideos() async {
    items = dashboardItems(context);
    controllers = [];

    List<Future<void>> controllerInitTasks = [];

    for (var item in items) {
      final controller = item.videoPlayerController;
      if (controller != null) {
        controllerInitTasks.add(controller.initialize().then((_) {
          controller.setLooping(true);
          controllers.add(controller);
        }));
      } else {
        controllers.add(null);
      }
    }

    await Future.wait(controllerInitTasks);

    setState(() {
      isLoading = false;
    });

    playCurrentPauseOthers(0);
  }

  void playCurrentPauseOthers(int index) {
    for (int i = 0; i < controllers.length; i++) {
      final controller = controllers[i];
      if (controller != null && controller.value.isInitialized) {
        if (i == index) {
          controller.play();
        } else {
          controller.pause();
        }
      }
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller?.dispose();
    }
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: CustomAppColor.of(context).bgScaffold,
            ),
          ),
          // Loading spinner
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const SpinKitCircle(
                color: Colors.white,
                size: 70.0,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            currantPageIndex = index;
            for (int i = 0; i < controllers.length; i++) {
              final controller = controllers[i];
              if (controller != null && controller.value.isInitialized) {
                if (i == index) {
                  controller.play();
                } else {
                  controller.pause();
                }
              }
            }
          });
          playCurrentPauseOthers(index);
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _dashboardPosts(items[index], context, controllers[index]);
        },
      ),
    );
  }

  _dashboardPosts(DashboardItems items, BuildContext context, VideoPlayerController? controller) {
    return Stack(
      children: [
        Positioned.fill(
          child: items.postImage.isNotEmpty && controller != null && controller.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.value.isPlaying ? controller.play() : controller.pause();
                    });
                  },
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  ),
                )
              : Image.asset(
                  AppAssets.imgHome,
                  width: AppSizes.fullWidth,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          bottom: AppSizes.setHeight(40),
          right: AppSizes.setWidth(10),
          child: _dashboardIcon(context),
        ),
        Positioned(
          left: AppSizes.setWidth(14),
          bottom: AppSizes.setHeight(40),
          child: IgnorePointer(
            ignoring: true,
            child: _postDetails(items),
          ),
        ),
        Positioned(
          left: AppSizes.setWidth(0),
          right: AppSizes.setWidth(0),
          top: AppSizes.setHeight(40),
          child: IgnorePointer(
            ignoring: true,
            child: _postTopBar(context),
          ),
        ),
      ],
    );
  }

  _dashboardIcon(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IgnorePointer(
            ignoring: true,
            child: _iconButton(
              context,
              asset: AppAssets.icFlag,
              onTap: () => Navigator.push(context, ReportScreen.route()),
            ),
          ),
          _iconWithText(
            asset: isLiked ? AppAssets.icLike : AppAssets.icLikeWhite,
            text: "160.5k",
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
          _iconWithText(
            asset: AppAssets.icComment,
            text: "14.5k",
            onTap: () => _showCommentBottomSheet(context),
          ),
          _iconWithText(
            asset: AppAssets.icShare,
            text: "10.3k",
            onTap: () => _showShareBottomSheet(),
          ),
        ],
      ),
    );
  }

  _iconButton(BuildContext context, {required String asset, required VoidCallback onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(
        asset,
        width: AppSizes.setWidth(30),
        height: AppSizes.setHeight(28),
      ),
    );
  }

  _iconWithText({required String asset, required String text, VoidCallback? onTap}) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Image.asset(
            asset,
            width: AppSizes.setWidth(30),
            height: AppSizes.setHeight(30),
          ),
        ),
        CommonText(
          text: text,
          textColor: AppColor.txtWhite,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.setFontSize(12),
        )
      ],
    );
  }

  _postDetails(DashboardItems items) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context, ProfileScreen.route(isFromPost: true)),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(items.userProfile),
                    ),
                    Positioned(
                      bottom: AppSizes.setHeight(0),
                      top: AppSizes.setHeight(40),
                      right: AppSizes.setWidth(0),
                      left: AppSizes.setWidth(42),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppAssets.icPlus,
                          height: AppSizes.setHeight(10),
                          width: AppSizes.setWidth(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: AppSizes.setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: items.userName,
                      textColor: AppColor.txtWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                    CommonText(
                      text: items.userDesignation,
                      textColor: AppColor.txtWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(14),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          CommonText(
            text: items.postDescription,
            textColor: AppColor.txtWhite,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(14),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(AppAssets.icSound, scale: 4.6),
              SizedBox(width: AppSizes.setWidth(8)),
              Image.asset(AppAssets.icMusic, scale: 4.6),
              SizedBox(width: AppSizes.setWidth(8)),
              CommonText(
                text: AppStrings.believerImagineDragons,
                textColor: AppColor.txtWhite,
                fontWeight: FontWeight.w500,
                fontSize: AppSizes.setFontSize(12),
              ),
            ],
          )
        ],
      ),
    );
  }

  _postTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(13)),
      width: AppSizes.fullWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.icLive,
            scale: 4,
          ),
          _buildTabItem(Languages.of(context).following, isActive: false),
          _buildTabItem(Languages.of(context).friends, isActive: false),
          _buildTabItem(Languages.of(context).forYou, isActive: true),
          IconButton(
            onPressed: () => Navigator.push(context, SearchScreen.route()),
            icon: Image.asset(
              AppAssets.icSearchFilled,
              scale: 4,
            ),
          )
        ],
      ),
    );
  }

  _buildTabItem(String label, {required bool isActive}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonText(
          text: label,
          textColor: isActive ? AppColor.txtPurple : AppColor.txtWhite,
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.setFontSize(16),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: AppSizes.setHeight(8)),
        Container(
          height: AppSizes.setHeight(1.6),
          width: AppSizes.setWidth(60),
          color: isActive ? AppColor.txtPurple : AppColor.white,
        ),
      ],
    );
  }

  void _showShareBottomSheet() {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 5.5,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgBottomSheet,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(bottom: AppSizes.setHeight(30), left: AppSizes.setWidth(30), right: AppSizes.setWidth(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: Languages.of(context).shareTo,
                  fontSize: AppSizes.setFontSize(22),
                  fontWeight: FontWeight.w600,
                ),
                Divider(
                  color: CustomAppColor.of(context).divider,
                  thickness: 0.4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icRepost,
                        iconName: Languages.of(context).repost,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.imgProfile,
                        fit: BoxFit.cover,
                        iconName: AppStrings.johnDoe,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icSearch,
                        iconName: Languages.of(context).search,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icCopyLink,
                        iconName: Languages.of(context).copyLink,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: CustomAppColor.of(context).divider,
                  thickness: 0.8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icInstagram,
                        iconName: Languages.of(context).instagram,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icWhatsapp,
                        iconName: Languages.of(context).whatsapp,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icFacebook,
                        iconName: Languages.of(context).facebook,
                        fit: BoxFit.contain,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icTwitter,
                        iconName: Languages.of(context).twitter,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColor.btnLightGrey,
                  thickness: 0.4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icNotInterested,
                        iconName: Languages.of(context).notInterest,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icSaveVideo,
                        iconName: Languages.of(context).saveVideo,
                      ),
                      shareSheetList(
                        context: context,
                        iconPath: AppAssets.icGif,
                        iconName: Languages.of(context).shareAsGif,
                      ),
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

  void _showCommentBottomSheet(BuildContext context) {
    final commentList = comments(context);
    final view = View.of(context);
    showModalBottomSheet(
      backgroundColor: CustomAppColor.of(context).bgBottomSheet,
      scrollControlDisabledMaxHeightRatio: 0.8,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setModalState) {
          return SafeArea(
            child: Container(
                padding: EdgeInsets.only(
                  bottom: AppSizes.setHeight(view.viewInsets.bottom / view.devicePixelRatio),
                  left: AppSizes.setWidth(16),
                  right: AppSizes.setWidth(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: AppStrings.commentCount,
                      fontSize: AppSizes.setFontSize(22),
                      fontWeight: FontWeight.w600,
                    ),
                    const Divider(color: AppColor.btnLightGrey, thickness: 0.4),
                    SizedBox(height: AppSizes.setHeight(10)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: commentList.length,
                        itemBuilder: (context, index) {
                          final comment = commentList[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(comment.avatar),
                                    ),
                                    SizedBox(width: AppSizes.setWidth(14)),
                                    CommonText(
                                      text: comment.name,
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppSizes.setFontSize(15),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSizes.setHeight(12)),
                                CommonText(
                                  text: comment.text,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppSizes.setFontSize(13),
                                  textAlign: TextAlign.start,
                                  letterSpacing: 0.1,
                                ),
                                SizedBox(height: AppSizes.setHeight(12)),
                                SizedBox(
                                  width: AppSizes.setWidth(180),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setModalState(() {
                                                comment.isLiked = !(comment.isLiked ?? false);
                                              });
                                            },
                                            child: Image.asset(
                                              comment.isLiked ?? false ? AppAssets.icLike : AppAssets.icHeartFilled,
                                              width: AppSizes.setWidth(24),
                                              height: AppSizes.setHeight(24),
                                            ),
                                          ),
                                          SizedBox(width: AppSizes.setWidth(4)),
                                          CommonText(
                                            text: "${comment.likes}",
                                            fontWeight: FontWeight.w300,
                                            fontSize: AppSizes.setFontSize(10),
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        text: comment.timeAgo ?? '',
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppSizes.setFontSize(10),
                                      ),
                                      CommonText(
                                        text: Languages.of(context).reply,
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppSizes.setFontSize(10),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: AppSizes.setHeight(10)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextFormField(
                            fillColor: CustomAppColor.of(context).bgShadow,
                            isPasswordField: false,
                            hintText: Languages.of(context).addComment,
                            hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                            suffixIcon: Image.asset(
                              AppAssets.icEmoji,
                              scale: 4.5,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSizes.setWidth(10)),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            AppAssets.icSend,
                            scale: 5.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.setHeight(12),
                    )
                  ],
                )),
          );
        });
      },
    );
  }

  shareSheetList({BoxFit? fit, required BuildContext context, required String iconPath, required String iconName}) {
    return Column(
      children: [
        Container(
          height: AppSizes.setHeight(50),
          width: AppSizes.setWidth(50),
          decoration: BoxDecoration(
            color: AppColor.txtPurple.withOpacityPercent(0.2),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              iconPath,
              scale: 4.5,
              fit: fit,
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.setHeight(4),
        ),
        CommonText(
          text: iconName,
          fontSize: AppSizes.setFontSize(12),
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
