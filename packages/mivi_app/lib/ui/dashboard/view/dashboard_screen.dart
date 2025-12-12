import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mivi_app/ui/home/view/home_screen.dart';
import 'package:mivi_app/ui/setting/view/setting_screen.dart';
import 'package:mivi_app/ui/templates/view/templates_screen.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DashboardScreen());
  }

  const DashboardScreen({super.key});

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
        screen: const HomeScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Templates",
        selectedIconPath: AppAssets.icSelectedTemplates,
        unselectedIconPath: AppAssets.icUnSelectedTemplates,
        screen: const TemplatesScreen(),
      ),
      BottomNavigationBarItemData(
        name: "Store",
        selectedIconPath: AppAssets.icSelectedSetting,
        unselectedIconPath: AppAssets.icUnselectedSetting,
        screen: const SettingScreen(),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: bottomNavbarList[selectedIndex].screen,
      bottomNavigationBar: Padding(
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
    );
  }
}
