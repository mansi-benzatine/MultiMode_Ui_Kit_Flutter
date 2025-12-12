import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mivi_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/ui/choose_media/view/choose_media_screen.dart';
import 'package:mivi_screens_app/ui/search/view/search_screen.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';
import 'package:mivi_screens_app/widgets/top_bar/topbar.dart';

class HomeScreen extends StatefulWidget {
  final bool isForListView;

  static Route<void> route({bool isForListView = false}) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(isForListView: isForListView),
    );
  }

  const HomeScreen({super.key, this.isForListView = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> socialMediaPostList = [];
  List<Map<String, dynamic>> recentProjects = [];
  bool isGridView = true;

  void fillData() {
    socialMediaPostList = [
      {
        'image': AppAssets.icInstagram,
        'social_media_platform': "Instagram Post",
        "post_size": "1080 x 1080",
        "color_shadow": const Color(0xFFD4467E),
      },
      {
        'image': AppAssets.icFacebook,
        'social_media_platform': "Facebook Post",
        "post_size": "1080 x 1080",
        "color_shadow": const Color(0xFF0A77E8),
      },
      {
        'image': AppAssets.icYoutube,
        'social_media_platform': "Youtube Post",
        "post_size": "1080 x 1080",
        "color_shadow": const Color(0xFFFC0D1B),
      },
    ];

    recentProjects = [
      {
        'image': AppAssets.imgRecentProject1,
        'title': "Nature Explorer",
        "time": "01:25",
        "date": "12/03/2025",
      },
      {
        'image': AppAssets.imgRecentProject2,
        'title': "Mystic Dream",
        "time": "01:25",
        "date": "12/03/2025",
      },
      {
        'image': AppAssets.imgRecentProject3,
        'title': "Beach Escape",
        "time": "01:25",
        "date": "12/03/2025",
      },
      {
        'image': AppAssets.imgRecentProject4,
        'title': "Red Glow",
        "time": "01:25",
        "date": "12/03/2025",
      }
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();

    isGridView = widget.isForListView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: false,
            title: "MIVI",
            appBarColor: CustomAppColor.of(context).transparent,
            isShowAppLogo: true,
            textAlign: TextAlign.center,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  socialMediaList(socialMediaPostList),
                  SizedBox(height: 16.setHeight),
                  newProjectView(),
                  SizedBox(height: 10.setHeight),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtRecentProject,
                          fontFamily: Constant.fontFamilyBold700,
                          fontSize: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).socialMediaCard,
                            border: Border.all(color: CustomAppColor.of(context).cardBorder),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildOption(
                                icon: AppAssets.icList,
                                selected: !isGridView,
                                onTap: () => setState(() => isGridView = false),
                              ),
                              _buildOption(
                                icon: AppAssets.icGrid,
                                selected: isGridView,
                                onTap: () => setState(() => isGridView = true),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: isGridView ? _buildGridView() : _buildListView(),
                  ),
                  SizedBox(height: 125.setHeight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOption({required String icon, required bool selected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
        decoration: BoxDecoration(
          color: selected ? CustomAppColor.of(context).secondary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          icon,
          height: 14.setHeight,
          width: 14.setHeight,
          color: selected ? CustomAppColor.of(context).black : CustomAppColor.of(context).icBlackWhite,
        ),
      ),
    );
  }

  Widget socialMediaList(List<Map<String, dynamic>> socialMediaPlatformList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 2.setHeight),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(socialMediaPlatformList.length, (index) {
            final item = socialMediaPlatformList[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).socialMediaCard,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InnerShadow(
                    blur: 5,
                    color: item["color_shadow"]!.withValues(alpha: 0.2),
                    offset: const Offset(2, 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        color: CustomAppColor.of(context).socialMediaCard,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        item["image"]!,
                        width: 28.setWidth,
                        height: 28.setHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: item['social_media_platform']!,
                    fontSize: 12.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  SizedBox(height: 6.setHeight),
                  CommonText(
                    text: item['post_size']!,
                    fontSize: 12,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget newProjectView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: IgnorePointer(
        ignoring: true,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, ChooseMediaScreen.route());
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 18.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: CustomAppColor.of(context).cardBorder,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.icAdd,
                  height: 24.setHeight,
                  width: 24.setWidth,
                ),
                SizedBox(height: 15.setHeight),
                CommonText(
                  text: Languages.of(context).txtNewProject,
                  fontFamily: Constant.fontFamilyMedium500,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisCount = 2;
    const spacing = 12.0;

    final itemWidth = (screenWidth - (20.setWidth * 2) - (crossAxisCount - 1) * spacing) / crossAxisCount;

    return SingleChildScrollView(
      child: Padding(
        key: const ValueKey('grid'),
        padding: EdgeInsets.only(
          left: 20.setWidth,
          right: 20.setWidth,
          top: 10.setHeight,
        ),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: recentProjects.map((item) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth,
              child: _buildProjectCard(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    const spacing = 12.0;

    return SingleChildScrollView(
      child: Padding(
        key: const ValueKey('list'),
        padding: EdgeInsets.only(
          left: 20.setWidth,
          right: 20.setWidth,
          top: 10.setHeight,
        ),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: recentProjects.map((item) {
            return SizedBox(
              width: double.infinity,
              height: 160.setHeight,
              child: _buildProjectCard(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project, {bool isList = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Stack(
            children: [
              Image.asset(
                project['image'],
                height: isList ? 160.setHeight : double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: isList ? 160.setHeight : double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      CustomAppColor.of(context).transparent,
                      CustomAppColor.of(context).black.withValues(alpha: 0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 4.setHeight),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CommonText(
                text: project['time']!,
                textColor: Colors.white,
                fontSize: 9.setFontSize,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 4.setHeight),
              decoration: const BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.more_horiz,
                color: CustomAppColor.of(context).white,
                size: 18,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: project['title'],
                  textColor: Colors.white,
                  fontSize: 12,
                  fontFamily: Constant.fontFamilyMedium500,
                ),
                CommonText(
                  text: project['date'],
                  textColor: Colors.white,
                  fontSize: 12,
                  fontFamily: Constant.fontFamilyMedium500,
                ),
              ],
            ),
          )
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
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    super.key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    required Widget child,
  }) : super(child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RenderInnerShadow renderObject = RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child as RenderObject, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child as RenderObject, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
