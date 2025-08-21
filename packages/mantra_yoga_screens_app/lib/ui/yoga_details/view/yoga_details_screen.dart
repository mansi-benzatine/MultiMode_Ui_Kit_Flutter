import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../do_yoga/view/do_yoga_screen.dart';

class YogaDetailsScreen extends StatefulWidget {
  const YogaDetailsScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const YogaDetailsScreen());
  }

  @override
  State<YogaDetailsScreen> createState() => _YogaDetailsScreenState();
}

class _YogaDetailsScreenState extends State<YogaDetailsScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _sliverAppBar(),
              _sliverDetailsView(),
              _sliverPersistentTabBar(),
              ..._buildSliverTabContent(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtStartExercise,
                onTap: () {
                  Navigator.push(context, DoYogaScreen.route(isVideoSelected: _tabController.index));
                },
                buttonColor: CustomAppColor.of(context).primary,
                borderColor: CustomAppColor.of(context).borderColor,
                borderWidth: 4,
                radius: 18,
                mLeft: 20.setWidth,
                mRight: 20.setWidth,
                mBottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
                mTop: 20.setHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 270.setHeight,
      pinned: true,
      backgroundColor: CustomAppColor.of(context).primary,
      elevation: 0,
      leadingWidth: 42.setHeight,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.setWidth),
        child: IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                AppAssets.icArrowRight,
                height: 20.setHeight,
                width: 20.setHeight,
                color: CustomAppColor.of(context).white,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Image.asset(
          AppAssets.icShare,
          height: 20.setHeight,
          width: 20.setHeight,
          color: CustomAppColor.of(context).white,
        ),
        SizedBox(width: 15.setWidth),
        Padding(
          padding: EdgeInsets.only(right: 20.setWidth),
          child: Image.asset(
            AppAssets.icArchive,
            height: 20.setHeight,
            width: 20.setHeight,
            color: CustomAppColor.of(context).white,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppAssets.imgYogaDummy1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _sliverDetailsView() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: "Full Body Yoga",
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
                Image.asset(
                  AppAssets.icEye,
                  height: 18.setHeight,
                  width: 18.setWidth,
                ),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "21,560 ${Languages.of(context).txtViews}",
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text:
                  "Yoga is a mind and body practice. Relaxation responses include reduced heart rate and blood pressure, reduced muscle tension, and a reduced metabolic rate. Relaxation responses are the opposite of the body's stress response.",
              fontSize: 11.setFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamilyRegular400,
              textColor: CustomAppColor.of(context).txtDarkGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: CustomAppColor.of(context).primary),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icClock,
                          width: 20.setHeight,
                          height: 20.setHeight,
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: Languages.of(context).txtTotalTime,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: Constant.fontFamilyRegular400,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.setHeight),
                        CommonText(
                          text: "48",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: CustomAppColor.of(context).primary),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icMeditation,
                          width: 20.setHeight,
                          height: 20.setHeight,
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: Languages.of(context).txtTotalYoga,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: Constant.fontFamilyRegular400,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.setHeight),
                        CommonText(
                          text: "2",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: CustomAppColor.of(context).primary),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icKcalBurned,
                          width: 20.setHeight,
                          height: 20.setHeight,
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: Languages.of(context).txtKcalBurned,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: Constant.fontFamilyRegular400,
                          textColor: CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.setHeight),
                        CommonText(
                          text: "200",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _sliverPersistentTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(
        tabController: _tabController,
        context: context,
      ),
    );
  }

  List<Widget> _buildSliverTabContent() {
    return [
      AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          if (_tabController.index == 0) {
            return _sliverVideoList();
          } else {
            return _sliverAnimationList();
          }
        },
      ),
    ];
  }

  Widget _sliverVideoList() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10.setHeight, bottom: MediaQuery.of(context).padding.bottom * 3, left: 15.setWidth, right: 15.setWidth),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildVideoItem(index),
          childCount: 20,
        ),
      ),
    );
  }

  Widget _sliverAnimationList() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10.setHeight, bottom: MediaQuery.of(context).padding.bottom * 3, left: 15.setWidth, right: 15.setWidth),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildAnimationItem(index),
          childCount: 20,
        ),
      ),
    );
  }

  Widget _buildVideoItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.setHeight),
      child: InkWell(
        splashColor: CustomAppColor.of(context).transparent,
        highlightColor: CustomAppColor.of(context).transparent,
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 10.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppAssets.imgYogaDummy1,
                  width: 70.setWidth,
                  height: 70.setHeight,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Full Body Yoga",
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 2.setHeight),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.icClock,
                            width: 12.setWidth,
                            height: 12.setHeight,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "25 ${Languages.of(context).txtMin}",
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyRegular400,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                          ),
                          VerticalDivider(
                            color: CustomAppColor.of(context).txtLightGray,
                            thickness: 1,
                            width: 20.setWidth,
                            indent: 2.5.setHeight,
                            endIndent: 2.5.setHeight,
                          ),
                          Image.asset(
                            AppAssets.icKcalBurned,
                            width: 12.setWidth,
                            height: 12.setHeight,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "200 ${Languages.of(context).txtKcal}",
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyRegular400,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.setHeight),
      child: InkWell(
        splashColor: CustomAppColor.of(context).transparent,
        highlightColor: CustomAppColor.of(context).transparent,
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 10.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              Container(
                width: 70.setWidth,
                height: 70.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).containerFillBorderAndBlack,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1)),
                ),
                padding: EdgeInsets.all(10.setHeight),
                child: Image.asset(
                  AppAssets.imgBeginners,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Lord of the Dance",
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 2.setHeight),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.icClock,
                            width: 12.setWidth,
                            height: 12.setHeight,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "25 ${Languages.of(context).txtMin}",
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyRegular400,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                          ),
                          VerticalDivider(
                            color: CustomAppColor.of(context).txtLightGray,
                            thickness: 1,
                            width: 20.setWidth,
                            indent: 2.5.setHeight,
                            endIndent: 2.5.setHeight,
                          ),
                          Image.asset(
                            AppAssets.icKcalBurned,
                            width: 12.setWidth,
                            height: 12.setHeight,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "200 ${Languages.of(context).txtKcal}",
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyRegular400,
                            textColor: CustomAppColor.of(context).txtDarkGray,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final BuildContext context;
  static const double _headerHeight = 68.0;

  _SliverTabBarDelegate({
    required this.tabController,
    required this.context,
  });

  @override
  double get minExtent => _headerHeight;

  @override
  double get maxExtent => _headerHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: _headerHeight,
      child: Container(
        color: CustomAppColor.of(context).bgScreen,
        padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, bottom: 10.setHeight, top: 10.setHeight),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => tabController.animateTo(0),
                child: AnimatedBuilder(
                  animation: tabController,
                  builder: (context, child) {
                    bool isSelected = tabController.index == 0;
                    return Container(
                      height: 48.setHeight,
                      decoration: BoxDecoration(
                        color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Languages.of(context).txtVideo,
                          style: TextStyle(
                            fontSize: 14.setFontSize,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                            color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: GestureDetector(
                onTap: () => tabController.animateTo(1),
                child: AnimatedBuilder(
                  animation: tabController,
                  builder: (context, child) {
                    bool isSelected = tabController.index == 1;
                    return Container(
                      height: 48.setHeight,
                      decoration: BoxDecoration(
                        color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Languages.of(context).txtAnimation,
                          style: TextStyle(
                            fontSize: 14.setFontSize,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                            color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate is! _SliverTabBarDelegate || oldDelegate.tabController != tabController;
  }
}
