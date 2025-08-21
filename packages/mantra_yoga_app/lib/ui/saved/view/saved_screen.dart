import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../meditation_details/view/meditation_details_screen.dart';
import '../../yoga_details/view/yoga_details_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const SavedScreen());
  }

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> with TickerProviderStateMixin implements TopBarClickListener {
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
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSaved,
          ),
          _tabBarView(),
          _tabsView(),
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
          _buildYogaList(),
          _buildMeditationList(),
        ],
      ),
    );
  }

  _buildYogaList() {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(top: 20.setHeight, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        children: List.generate(
          50,
          (index) => InkWell(
            splashColor: CustomAppColor.of(context).transparent,
            highlightColor: CustomAppColor.of(context).transparent,
            onTap: () {
              Navigator.push(context, YogaDetailsScreen.route());
            },
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
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
                                CommonText(
                                  text: "10 ${Languages.of(context).txtPoses}",
                                  fontSize: 11.setFontSize,
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
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).containerFillBorderAndBlack,
                        border: Border.all(color: CustomAppColor.of(context).primary),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                      child: CommonText(
                        text: "Beginners",
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                if (index != 50 - 1)
                  Divider(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                    thickness: 1,
                    height: 25.setHeight,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMeditationList() {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(top: 20.setHeight, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        children: List.generate(
          50,
          (index) => InkWell(
            splashColor: CustomAppColor.of(context).transparent,
            highlightColor: CustomAppColor.of(context).transparent,
            onTap: () {
              Navigator.push(context, MeditationDetailsScreen.route());
            },
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
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
                            text: "Meditation",
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
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).containerFillBorderAndBlack,
                        border: Border.all(color: CustomAppColor.of(context).primary),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                      child: CommonText(
                        text: "Beginners",
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                if (index != 50 - 1)
                  Divider(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                    thickness: 1,
                    height: 25.setHeight,
                  ),
              ],
            ),
          ),
        ),
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
