import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../filter/view/filter_screen.dart';
import '../../meditation_details/view/meditation_details_screen.dart';
import '../../yoga_details/view/yoga_details_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> yogaLevels = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];

  final List<String> meditationLevels = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];

  final ValueNotifier<int> _selectedYogaLevel = ValueNotifier(0);
  final ValueNotifier<int> _selectedMeditationLevel = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView(),
        _searchView(),
        _tabBarView(),
        _tabsView(),
      ],
    );
  }

  _topBarView() {
    return Container(
      padding: EdgeInsets.only(
        left: 15.setWidth,
        right: 15.setWidth,
        top: 10.setHeight,
      ),
      child: CommonText(
        text: Languages.of(context).txtDiscover,
        fontSize: 18.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        textColor: CustomAppColor.of(context).txtBlack,
        height: 1,
      ),
    );
  }

  _searchView() {
    return Padding(
      padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 20.setHeight, bottom: 10.setHeight),
      child: Row(
        children: [
          Expanded(
            child: CommonTextFormFieldWithPrefix(
              controller: TextEditingController(),
              hintText: Languages.of(context).txtSearch,
              prefixIcon: AppAssets.icSearch,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, FilterScreen.route());
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).containerFillBorderAndBlack,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomAppColor.of(context).primary),
              ),
              height: 48.setHeight,
              width: 48.setWidth,
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.icFilterSearch,
                width: 20.setWidth,
                height: 20.setHeight,
                color: CustomAppColor.of(context).txtBlackAndGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tabBarView() {
    return TabBar(
      controller: _tabController,
      padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth),
      dividerHeight: 1,
      dividerColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: CustomAppColor.of(context).primary,
      indicatorWeight: 3,
      labelStyle: TextStyle(
        fontSize: 14.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        color: CustomAppColor.of(context).txtPrimary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.setFontSize,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamilyMedium500,
        color: CustomAppColor.of(context).txtBlack,
      ),
      overlayColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
      tabs: [
        Tab(text: Languages.of(context).txtYoga),
        Tab(text: Languages.of(context).txtMeditation),
      ],
    );
  }

  _tabsView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight),
            child: Column(
              children: [
                _yogaLevelView(),
                SizedBox(height: 20.setHeight),
                _yogaPopularView(),
                SizedBox(height: 20.setHeight),
                _yogaStressReliefView(),
                SizedBox(height: 20.setHeight),
                _yogaPostureCorrectionView(),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight),
            child: Column(
              children: [
                _meditationLevelView(),
                SizedBox(height: 20.setHeight),
                _meditationPopularView(),
                SizedBox(height: 20.setHeight),
                _meditationStressReliefView(),
                SizedBox(height: 20.setHeight),
                _meditationPeacefulView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _yogaLevelView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtYogaLevel,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              yogaLevels.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedYogaLevel,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedYogaLevel.value = index;
                    },
                    child: Container(
                      height: 40.setHeight,
                      margin: EdgeInsets.only(right: 10.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: yogaLevels[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaPopularView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtPopular,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, YogaDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.setHeight),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                AppAssets.imgYogaDummy1,
                                width: 130.setWidth,
                                height: 130.setHeight,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerFillBorderAndBlack,
                              border: Border.all(color: CustomAppColor.of(context).primary),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                            child: CommonText(
                              text: "Beginners",
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Morning Yoga",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
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
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaStressReliefView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtStressRelief,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Column(
            children: List.generate(
              3,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, YogaDetailsScreen.route());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerFillBorderAndBlack,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: CustomAppColor.of(context).borderPrimaryAndGray),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
                  margin: EdgeInsets.only(bottom: index != 2 ? 10.setHeight : 0),
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
                      SizedBox(width: 10.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Spiritual Growth",
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
                                  CommonText(
                                    text: "10 ${Languages.of(context).txtPoses}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                  VerticalDivider(
                                    color: CustomAppColor.of(context).txtLightGray,
                                    thickness: 1,
                                    width: 15.setWidth,
                                    indent: 2.5.setHeight,
                                    endIndent: 2.5.setHeight,
                                  ),
                                  CommonText(
                                    text: "25 ${Languages.of(context).txtMin}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppAssets.icArrowRight,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlackAndGray,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaPostureCorrectionView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtPostureCorrection,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, YogaDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          AppAssets.imgYogaDummy1,
                          width: 130.setWidth,
                          height: 130.setHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Flexible Strech",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).containerFillBorderAndBlack,
                          border: Border.all(color: CustomAppColor.of(context).primary),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        margin: EdgeInsets.only(top: 5.setHeight),
                        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                        child: CommonText(
                          text: "Beginners",
                          fontSize: 10.setFontSize,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamilyMedium500,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationLevelView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtMeditationLevel,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              meditationLevels.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedMeditationLevel,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedMeditationLevel.value = index;
                    },
                    child: Container(
                      height: 40.setHeight,
                      margin: EdgeInsets.only(right: 10.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: meditationLevels[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationPopularView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtPopular,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, MeditationDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.setHeight),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                AppAssets.imgMeditationDummy1,
                                width: 130.setWidth,
                                height: 130.setHeight,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerFillBorderAndBlack,
                              border: Border.all(color: CustomAppColor.of(context).primary),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                            child: CommonText(
                              text: "Beginners",
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Mindfulness",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
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
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationPeacefulView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtPeaceful,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, MeditationDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.setHeight),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                AppAssets.imgMeditationDummy1,
                                width: 130.setWidth,
                                height: 130.setHeight,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerFillBorderAndBlack,
                              border: Border.all(color: CustomAppColor.of(context).primary),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                            child: CommonText(
                              text: "Beginners",
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Morning Mood",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
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
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationStressReliefView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtStressRelief,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Column(
            children: List.generate(
              3,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, MeditationDetailsScreen.route());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerFillBorderAndBlack,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: CustomAppColor.of(context).borderPrimaryAndGray),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
                  margin: EdgeInsets.only(bottom: index != 2 ? 10.setHeight : 0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.imgMeditationDummy1,
                          width: 70.setWidth,
                          height: 70.setHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Spiritual Growth",
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
                                  CommonText(
                                    text: "10 ${Languages.of(context).txtPoses}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                  VerticalDivider(
                                    color: CustomAppColor.of(context).txtLightGray,
                                    thickness: 1,
                                    width: 15.setWidth,
                                    indent: 2.5.setHeight,
                                    endIndent: 2.5.setHeight,
                                  ),
                                  CommonText(
                                    text: "25 ${Languages.of(context).txtMin}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppAssets.icArrowRight,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlackAndGray,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
