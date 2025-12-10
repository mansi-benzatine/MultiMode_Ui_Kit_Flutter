import 'package:baby_bloom_app/ui/calendar/view/calendar_screen.dart';
import 'package:baby_bloom_app/ui/dashboard/datamodel/dashboard_data.dart';
import 'package:baby_bloom_app/ui/explore/view/explore_screen.dart';
import 'package:baby_bloom_app/ui/home/view/home_screen.dart';
import 'package:baby_bloom_app/ui/store/view/store_screen.dart';
import 'package:baby_bloom_app/ui/tools/view/tools_screen.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class DashboardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DashboardScreen());
  }

  const DashboardScreen({super.key});

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

    fillDataAndInitController();
  }

  void fillDataAndInitController() {
    _tabController = TabController(length: bottomNavbarList.length, vsync: this);
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
        screen: const HomeScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Calendar",
        selectedIconPath: AppAssets.icSelectedCalendar,
        unselectedIconPath: AppAssets.icUnselectedCalendar,
        screen: const CalendarScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Store",
        selectedIconPath: AppAssets.icSelectedShoppingCart,
        unselectedIconPath: AppAssets.icUnselectedShoppingCart,
        screen: const StoreScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Explore",
        selectedIconPath: AppAssets.icSelectedExplore,
        unselectedIconPath: AppAssets.icUnselectedExplore,
        screen: const ExploreScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Tools",
        selectedIconPath: AppAssets.icSelectedTools,
        unselectedIconPath: AppAssets.icUnselectedTools,
        screen: const ToolsScreen(),
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
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            indicatorWeight: 4,
            indicator: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: CustomAppColor.of(context).bgScreen,
                  width: 4,
                ),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.all(0),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 0.setWidth),
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
                      textColor: _selectedIndex == i ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
