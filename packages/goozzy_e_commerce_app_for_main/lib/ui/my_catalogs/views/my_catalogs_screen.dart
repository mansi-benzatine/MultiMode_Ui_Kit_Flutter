import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/product/product_card.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../app/my_app.dart';
import '../../home_screen/datamodel/home_screen_data.dart';
import '../../view_inner_product/view/view_inner_product_screen.dart';

class MyCatalogsScreen extends StatefulWidget {
  const MyCatalogsScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const MyCatalogsScreen());
  }

  @override
  State<MyCatalogsScreen> createState() => _MyCatalogsScreenState();
}

class _MyCatalogsScreenState extends State<MyCatalogsScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [Languages.of(context).wishlist, Languages.of(context).shared];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).myCatalogs,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgTopBar,
            ),
            _tabBar(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _centeredContent(_wishlistList()),
                  _centeredContent(_emptySharedList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _centeredContent(Widget child) {
    return Center(
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }

  _wishlistList() {
    return Container(
      color: CustomAppColor.of(context).bgTopBar,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppSizes.setHeight(0.02)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2), horizontal: AppSizes.setWidth(22)),
              color: CustomAppColor.of(context).bgScaffold,
              height: AppSizes.setHeight(49),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).showInStockCategory,
                    fontSize: AppSizes.setFontSize(15),
                    fontWeight: FontWeight.w600,
                  ),
                  FlutterSwitch(
                    value: true,
                    onToggle: (bool newValue) {},
                    activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
                    inactiveColor: CustomAppColor.of(context).txtGrey,
                    activeToggleColor: CustomAppColor.of(context).icPurple,
                    inactiveToggleColor: CustomAppColor.of(context).white,
                    width: AppSizes.setWidth(38),
                    height: AppSizes.setHeight(20),
                    toggleSize: 22.0,
                    borderRadius: 16.0,
                    padding: 0,
                  )
                ],
              ),
            ),
          ),
          ProductsDetail(
            onTap: () => Navigator.push(context, ViewInnerProductScreen.route()),
            productsList: anniDesignerSareeList.reversed.toList(),
            isShowMrp: true,
            isShowTrusted: true,
            isRatingShown: false,
            isFilledFavouriteVisible: true,
            btnText: Languages.of(context).buyNow,
          ),
        ],
      ),
    );
  }

  _tabBar(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgTopBar,
      child: TabBar(
        controller: _tabController,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(19), vertical: AppSizes.setHeight(12)),
        isScrollable: true,
        unselectedLabelColor: AppColor.txtGrey,
        labelStyle: TextStyle(
          fontFamily: Constant.fontFamilyUrbanist,
          fontSize: AppSizes.setFontSize(18),
          fontWeight: FontWeight.w600,
        ),
        labelColor: AppColor.txtPurple,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
          insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
        ),
        tabs: tabList.map((tab) {
          return Tab(
            text: tab,
          );
        }).toList(),
      ),
    );
  }

  /*_emptyWishlistList() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgWishlist,
          width: AppSizes.setWidth(250),
          height: AppSizes.setHeight(180),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          child: CommonText(
            text: Languages.of(context).yourWishlistIsEmptyNow,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        CommonText(
          text: Languages.of(context).youHaveNotAddedAnyProductToWishlist,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: AppSizes.setFontSize(15),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          child: CommonButton(
            width: AppSizes.setWidth(173),
            height: AppSizes.setHeight(34),
            fontSize: AppSizes.setFontSize(14),
            radius: 3,
            btnText: Languages.of(context).toShoppingNow,
          ),
        )
      ],
    );
  }*/

  _emptySharedList() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgShared,
          width: AppSizes.setWidth(238),
          height: AppSizes.setHeight(180),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          child: CommonText(
            text: Languages.of(context).itsQuiteEmptyHere,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        CommonText(
          text: Languages.of(context).seemaLikeYouHaventShareAnyCatalog,
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.setFontSize(15),
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          child: CommonButton(
            width: AppSizes.setWidth(173),
            height: AppSizes.setHeight(34),
            fontSize: AppSizes.setFontSize(14),
            radius: 3,
            btnText: Languages.of(context).showMeCatalogs,
          ),
        )
      ],
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceMyApp.navigatorKey.currentState!.context);
    }
  }
}
