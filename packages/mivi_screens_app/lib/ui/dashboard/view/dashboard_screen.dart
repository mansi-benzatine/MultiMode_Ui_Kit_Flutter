import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/home/view/home_screen.dart';
import 'package:mivi_screens_app/ui/setting/view/setting_screen.dart';
import 'package:mivi_screens_app/ui/templates/view/templates_screen.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isForListViewHome;
  final int currentIndexOfTemplates;
  final bool isShowLogoutAlert;

  static Route<void> route({
    int currentIndex = 0,
    bool isForListViewHome = false,
    int currentIndexOfTemplates = 0,
    bool isShowLogoutAlert = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => DashboardScreen(
        currentIndex: currentIndex,
        isForListViewHome: isForListViewHome,
        currentIndexOfTemplates: currentIndexOfTemplates,
        isShowLogoutAlert: isShowLogoutAlert,
      ),
    );
  }

  const DashboardScreen({
    super.key,
    this.currentIndex = 0,
    this.isForListViewHome = false,
    this.currentIndexOfTemplates = 0,
    this.isShowLogoutAlert = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<BottomNavigationBarItemData> bottomNavbarList = [];
  int selectedIndex = 0;

  void _fillData() {
    bottomNavbarList = [
      BottomNavigationBarItemData(
        name: "Home",
        selectedIconPath: AppAssets.icSelectedHome,
        unselectedIconPath: AppAssets.icUnSelectedHome,
        screen: HomeScreen(isForListView: widget.isForListViewHome),
      ),
      BottomNavigationBarItemData(
        name: "Templates",
        selectedIconPath: AppAssets.icSelectedTemplates,
        unselectedIconPath: AppAssets.icUnSelectedTemplates,
        screen: TemplatesScreen(currentIndex: widget.currentIndexOfTemplates),
      ),
      BottomNavigationBarItemData(
        name: "Store",
        selectedIconPath: AppAssets.icSelectedSetting,
        unselectedIconPath: AppAssets.icUnselectedSetting,
        screen: SettingScreen(isShowLogoutAlert: widget.isShowLogoutAlert),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fillData();

    selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: bottomNavbarList[selectedIndex].screen,
      bottomNavigationBar: IgnorePointer(
        ignoring: true,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 60.setHeight,
            left: 0.screenWidth / 5,
            right: 0.screenWidth / 5,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgScreen.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(bottomNavbarList.length, (index) {
                    final item = bottomNavbarList[index];
                    final isSelected = selectedIndex == index;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 15.setHeight),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                        child: Image.asset(
                          isSelected ? item.selectedIconPath : item.unselectedIconPath,
                          height: 20.setHeight,
                          width: 20.setHeight,
                          color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).icBlackWhite,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
