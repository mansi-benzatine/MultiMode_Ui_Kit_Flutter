import 'package:flutter/material.dart';
import 'package:grokit_screens_app/ui/categories/view/categories_screen.dart';
import 'package:grokit_screens_app/ui/my_cart/view/my_cart_screen.dart';
import 'package:grokit_screens_app/ui/profile/views/profile_screen.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../home/view/home_screen.dart';
import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isShowDeliveryLocationBs;
  final bool isForEmptyCartView;
  final bool isForLogoutAlert;

  static Route<void> route({
    int currentIndex = 0,
    bool isShowDeliveryLocationBs = false,
    bool isForEmptyCartView = false,
    bool isForLogoutAlert = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => DashboardScreen(
        currentIndex: currentIndex,
        isShowDeliveryLocationBs: isShowDeliveryLocationBs,
        isForEmptyCartView: isForEmptyCartView,
        isForLogoutAlert: isForLogoutAlert,
      ),
    );
  }

  const DashboardScreen({
    super.key,
    this.currentIndex = 0,
    this.isShowDeliveryLocationBs = false,
    this.isForEmptyCartView = false,
    this.isForLogoutAlert = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  List<BottomNavigationBarItemData> bottomNavbarList = [];
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _fillData();
    _selectedIndex = widget.currentIndex;
    fillDataAndInitController();
  }

  void fillDataAndInitController() {
    _tabController = TabController(
      length: bottomNavbarList.length,
      vsync: this,
      initialIndex: widget.currentIndex,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  void _fillData() {
    bottomNavbarList = [
      BottomNavigationBarItemData(
        name: "Home",
        selectedIconPath: AppAssets.icSelectedHome,
        unselectedIconPath: AppAssets.icUnselectedHome,
        screen: HomeScreen(
          isShowDeliveryLocationBs: widget.isShowDeliveryLocationBs,
        ),
      ),
      BottomNavigationBarItemData(
        name: "Categories",
        selectedIconPath: AppAssets.icSelectedCategory,
        unselectedIconPath: AppAssets.icUnselectedCategory,
        screen: const CategoriesScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Cart",
        selectedIconPath: AppAssets.icSelectedBag,
        unselectedIconPath: AppAssets.icUnselectedBag,
        screen: MyCartScreen(isForEmptyView: widget.isForEmptyCartView),
      ),
      BottomNavigationBarItemData(
        name: "Profile",
        selectedIconPath: AppAssets.icSelectedUser,
        unselectedIconPath: AppAssets.icUnselectedUser,
        screen: ProfileScreen(isShowLogoutAlert: widget.isForLogoutAlert),
      ),
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: true,
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: bottomNavbarList.map((item) => item.screen).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: true,
        child: IgnorePointer(
          ignoring: true,
          child: Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).cardBgBlackWhite,
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.05),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: TabBar(
              dividerColor: CustomAppColor.of(context).cardBgBlackWhite,
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              indicatorWeight: 4,
              indicatorColor: CustomAppColor.of(context).cardBgBlackWhite,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              labelColor: CustomAppColor.of(context).primary,
              unselectedLabelColor: CustomAppColor.of(context).txtGray,
              tabs: bottomNavbarList.map((item) {
                int i = bottomNavbarList.indexOf(item);
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.setHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.setHeight),
                        child: Image.asset(
                          _selectedIndex == i ? item.selectedIconPath : item.unselectedIconPath,
                          height: 20.setHeight,
                          width: 20.setWidth,
                        ),
                      ),
                      SizedBox(height: 6.setHeight),
                      CommonText(
                        text: item.name,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: _selectedIndex == i ? CustomAppColor.of(context).txtOrange : CustomAppColor.of(context).txtGray,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
