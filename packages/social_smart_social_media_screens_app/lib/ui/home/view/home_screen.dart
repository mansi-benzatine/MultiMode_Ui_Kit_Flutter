import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../create_posts/view/create_post_screen.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../discover/view/discover_screen.dart';
import '../../edit_content/view/edit_content_screen.dart';
import '../../inbox/view/inbox_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../datemodel/home_data.dart';

class HomeScreen extends StatefulWidget {
  final bool isFromHome;
  final bool isFromDiscover;
  final bool isFromProfile;
  final bool isFromInbox;
  final bool isFromOptionForPost;
  final bool isForSwitchAccount;
  final bool isForCommentBs;
  final bool isForShareTo;
  final int currentIndex;

  static Route route({
    required bool isFromHome,
    required bool isFromDiscover,
    required bool isFromProfile,
    required bool isFromInbox,
    required bool isFromOptionsForPosts,
    bool isForSwitchAccountBs = false,
    int currentIndex = 0,
    bool isForCommentBs = false,
    bool isForShareTo = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(
        isFromHome: isFromHome,
        isFromProfile: isFromProfile,
        isFromDiscover: isFromDiscover,
        isFromOptionForPost: isFromOptionsForPosts,
        isFromInbox: isFromInbox,
        isForSwitchAccount: isForSwitchAccountBs,
        currentIndex: currentIndex,
        isForCommentBs: isForCommentBs,
        isForShareTo: isForShareTo,
      ),
    );
  }

  const HomeScreen({
    super.key,
    required this.isFromHome,
    required this.isFromDiscover,
    required this.isFromProfile,
    required this.isFromInbox,
    required this.isFromOptionForPost,
    this.isForSwitchAccount = false,
    this.currentIndex = 0,
    this.isForCommentBs = false,
    this.isForShareTo = false,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  bool showTooltip = false;

  List<Widget> screens = [];
  bool isOpen = false;

  @override
  void initState() {
    super.initState();

    if (widget.isFromOptionForPost) {
      showTooltip = true;
    } else if (widget.isFromDiscover) {
      pageIndex = 1;
    } else if (widget.isFromInbox) {
      pageIndex = 3;
    } else if (widget.isFromProfile) {
      pageIndex = 4;
    } else {
      pageIndex = 0; // Default to Home
    }
    screens = [
      DashboardScreen(
        isForShareTo: widget.isForShareTo,
        isForCommentBs: widget.isForCommentBs,
      ),
      DiscoverScreen(currentIndex: widget.currentIndex),
      const CreatePostScreen(
        isVideoSelected: false,
        isTemplateSelected: false,
        isPhotoSelected: false,
        isCameraSelected: false,
        currentIndex: 1,
      ),
      InboxScreen(
        onExpandActivity: (isExpanded) {
          isOpen = isExpanded;
          setState(() {});
        },
      ),
      ProfileScreen(fromPost: false, isForSwitchAccount: widget.isForSwitchAccount),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        extendBody: pageIndex == 0 || pageIndex == 3 ? true : false,
        body: Stack(
          children: [
            Padding(
              padding: pageIndex == 0 ? EdgeInsets.only(bottom: AppSizes.setHeight(58)) : EdgeInsets.zero,
              child: screens[pageIndex],
            ),
            if (showTooltip) _buildTooltipOverlay(context, pageIndex),
          ],
        ),
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  buildMyNavBar(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        padding: EdgeInsets.only(top: AppSizes.setHeight(15), bottom: AppSizes.setHeight(15)),
        decoration: BoxDecoration(
          color: pageIndex == 1 || (pageIndex == 3 && !isOpen) || pageIndex == 4
              ? CustomAppColor.of(context).bgScaffold
              : (pageIndex == 3 && isOpen)
                  ? CustomAppColor.of(context).black
                  : const Color(0xff181A20),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            navItems(context).length,
            (index) {
              final item = navItems(context)[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (index == 2) {
                      showTooltip = !showTooltip;
                    } else {
                      pageIndex = index;
                      showTooltip = false;
                    }
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    pageIndex == index
                        ? Image.asset(
                            item.activeIcon,
                            color: AppColor.btnGradiant2,
                            scale: 4,
                          )
                        : index == 2 && showTooltip
                            ? Image.asset(
                                AppAssets.icClose,
                                scale: 4,
                              )
                            : Image.asset(
                                item.inactiveIcon,
                                scale: 4,
                              ),
                    SizedBox(height: AppSizes.setHeight(3)),
                    Visibility(
                      visible: item.label?.isNotEmpty ?? false,
                      child: CommonText(
                        text: item.label ?? '',
                        textColor: pageIndex == index ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).grey,
                        fontSize: AppSizes.setFontSize(12),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTooltipOverlay(BuildContext context, int index) {
    return Container(
      color: AppColor.black.withOpacityPercent(0.5),
      child: Stack(
        children: [
          Positioned(
            bottom: index == 4 || index == 1 ? AppSizes.setHeight(10) : AppSizes.setHeight(90),
            left: MediaQuery.of(context).size.width / 2 - 65,
            child: Material(
              color: AppColor.transparent,
              child: Column(
                children: [
                  Container(
                    width: AppSizes.setWidth(136),
                    height: AppSizes.setHeight(110),
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24), vertical: AppSizes.setHeight(10)),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppColor.btnGradiant1, AppColor.btnGradiant2]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CreatePostScreen.route(
                                      isVideoSelected: false,
                                      isTemplateSelected: false,
                                      isPhotoSelected: false,
                                      isCameraSelected: false,
                                      currentIndex: 1,
                                    ));
                                setState(() {
                                  showTooltip = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: Languages.of(context).posts,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColor.txtWhite,
                                    fontSize: AppSizes.setFontSize(16),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    AppAssets.icVideoPlay,
                                    height: AppSizes.setHeight(22),
                                    width: AppSizes.setWidth(22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, EditContentScreen.route(isGoLiveScreen: true));
                                setState(() {
                                  showTooltip = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: Languages.of(context).live,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColor.txtWhite,
                                    fontSize: AppSizes.setFontSize(16),
                                  ),
                                  Image.asset(
                                    AppAssets.icLive,
                                    height: AppSizes.setHeight(22),
                                    width: AppSizes.setWidth(22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomPaint(
                    painter: TrianglePainter(
                      gradient: const LinearGradient(
                        colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SizedBox(
                      height: AppSizes.setHeight(20),
                      width: AppSizes.setWidth(35),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (index == 0)
            Positioned.fill(
              child: IgnorePointer(
                child: Image.asset(
                  AppAssets.icPlay,
                  color: AppColor.white.withOpacityPercent(0.7),
                  scale: 1.5,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final LinearGradient gradient;

  TrianglePainter({required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    double radius = 8.0;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2 + radius, size.height - radius)
      ..quadraticBezierTo(size.width / 2, size.height + radius, size.width / 2 - radius, size.height - radius)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
