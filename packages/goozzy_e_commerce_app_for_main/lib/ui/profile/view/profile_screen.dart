import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../widgets/text/common_text.dart';
import '../../../../../widgets/topbar/topbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../edit_profile/view/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ProfileScreen());
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).timeline,
      Languages.of(context).reviews,
      Languages.of(context).wishlist,
      Languages.of(context).shared,
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgTopBar,
      body: Column(
        children: [
          TopBar(
            this,
            topBarColor: CustomAppColor.of(context).btnPurple,
            isShowBack: true,
            title: Languages.of(context).profile,
            isShowEditProfile: true,
            isBackIconWhite: true,
          ),
          _profileDetails(context),
          _aboutMe(context),
          Expanded(child: Padding(padding: EdgeInsets.only(top: AppSizes.setHeight(16)), child: _myActivity(context)))
        ],
      ),
    );
  }

  _profileDetails(BuildContext context) {
    return Container(
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).btnPurple,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.setHeight(15)),
                child: Stack(
                  children: [
                    Container(
                      height: AppSizes.setHeight(70),
                      width: AppSizes.setWidth(70),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).white,
                        border: Border.all(color: CustomAppColor.of(context).white, width: 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(12)),
                        child: Image.asset(
                          AppAssets.icAvatar,
                          fit: BoxFit.fitHeight,
                          height: AppSizes.setHeight(70),
                          width: AppSizes.setWidth(70),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(5)),
                          height: AppSizes.setHeight(24),
                          width: AppSizes.setWidth(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: CustomAppColor.of(context).borderGrey, width: 2),
                            color: CustomAppColor.of(context).bgTopBar,
                          ),
                          child: Image.asset(AppAssets.icCamera)),
                    ),
                  ],
                ),
              ),
              CommonText(
                text: Languages.of(context).johnDoe,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).white,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(24), horizontal: AppSizes.setWidth(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CommonText(
                      text: "49",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(18),
                      textColor: CustomAppColor.of(context).white,
                    ),
                    CommonText(
                      text: Languages.of(context).helpful,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).white.withOpacityPercent(0.6),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonText(
                      text: "15",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(18),
                      textColor: CustomAppColor.of(context).white,
                    ),
                    CommonText(
                      text: Languages.of(context).followers,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).white.withOpacityPercent(0.6),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonText(
                      text: "10",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(18),
                      textColor: CustomAppColor.of(context).white,
                    ),
                    CommonText(
                      text: Languages.of(context).followings,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).white.withOpacityPercent(0.6),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _aboutMe(BuildContext context) {
    return Container(
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).bgScaffold,
      // padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).aboutMe.toUpperCase(),
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(18),
                ),
                CommonText(
                  text: Languages.of(context).addDetails.toUpperCase(),
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtPurple,
                  fontSize: AppSizes.setFontSize(14),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: Languages.of(context).shareYourJourneyOnGozzyWithFollowResellers,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: CustomAppColor.of(context).txtGrey,
              fontSize: AppSizes.setFontSize(15),
            ),
          )
        ],
      ),
    );
  }

  _myActivity(BuildContext context) {
    return Container(
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.only(
        top: AppSizes.setHeight(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: AppSizes.setWidth(14)),
            child: CommonText(
              text: Languages.of(context).myActivity.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          _tabBar(context),
          _emptyView(),
        ],
      ),
    );
  }

  _tabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabAlignment: TabAlignment.center,
      labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(19), vertical: AppSizes.setHeight(12)),
      isScrollable: true,
      unselectedLabelColor: AppColor.txtGrey,
      labelStyle: TextStyle(
        fontFamily: Constant.fontFamilyUrbanist,
        fontSize: AppSizes.setFontSize(16),
        fontWeight: FontWeight.w500,
      ),
      labelColor: AppColor.txtPurple,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
        insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      ),
      tabs: tabList.map((tab) {
        return Tab(
          text: tab,
        );
      }).toList(),
    );
  }

  _emptyView() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.setHeight(48)),
        child: Column(
          children: [
            Image.asset(
              AppAssets.imgNoPost,
              width: AppSizes.setWidth(110),
              height: AppSizes.setHeight(84),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(16)),
              child: CommonText(
                text: Languages.of(context).youHaveNotPublishedAnyPosts,
                textColor: CustomAppColor.of(context).txtGrey,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.edit) {
      Navigator.push(context, EditProfileScreen.route());
    }
    if (name == AppStrings.back) {
      Navigator.pop(context);
    }
  }
}
