import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/ui/generate_qr/view/generate_qr_screen.dart';
import 'package:qr_scanner_app_package/ui/scan/view/scan_screen.dart';
import 'package:qr_scanner_app_package/utils/app_assets.dart';
import 'package:qr_scanner_app_package/utils/app_color.dart';
import 'package:qr_scanner_app_package/utils/debug.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_app_package/utils/utils.dart';

import '../../favorite/view/favorite_screen.dart';
import '../../history/view/history_screen.dart';
import '../../setting/view/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(-1);
  final PageController _pageController = PageController();

  late final List<Widget> _pages = [
    const GenerateQrScreen(),
    const HistoryScreen(),
    ScanScreen(key: UniqueKey()),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    Debug.printLog("OnItemTapped: $index");
    _selectedIndex.value = index;
    if (index >= 2) {
      _pageController.jumpToPage(index + 1);
    } else {
      _pageController.jumpToPage(index);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      _selectedIndex.value = -1;
      _pageController.jumpToPage(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: PageView.builder(
          itemCount: _pages.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemBuilder: (context, index) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, child) {
          return _BottomBar(selectedTabIndex: value, onTabIndexChanged: _onItemTapped);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 72.setHeight,
        height: 72.setHeight,
        child: FloatingActionButton(
          backgroundColor: CustomAppColor.of(context).primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(16.setHeight),
            child: Image.asset(
              AppAssets.icTabScan,
              color: CustomAppColor.of(context).txtWhite,
            ),
          ),
          onPressed: () {
            Debug.printLog("Floating Action Button pressed - navigating to scan screen");
            _selectedIndex.value = -1;
            _pageController.jumpToPage(2);
          },
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  _BottomBar({required this.selectedTabIndex, required this.onTabIndexChanged});

  final int selectedTabIndex;
  final Function(int) onTabIndexChanged;

  final iconList = [
    AppAssets.icTabCreate,
    AppAssets.icTabHistory,
    AppAssets.icTabFavorite,
    AppAssets.icTabSetting,
  ];

  final iconSelectedList = [
    AppAssets.icTabCreateSelected,
    AppAssets.icTabHistorySelected,
    AppAssets.icTabFavoriteSelected,
    AppAssets.icTabSettingSelected,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      splashSpeedInMilliseconds: 0,
      backgroundColor: CustomAppColor.of(context).bgBottomBar,
      splashColor: CustomAppColor.of(context).red,
      notchMargin: 10.setHeight,
      height: 60.setHeight,
      gapWidth: 100.setHeight,
      shadow: BoxShadow(
        color: CustomAppColor.of(context).black.withOpacityPercent(0.05),
        blurRadius: 20,
        offset: const Offset(0, -10),
      ),
      tabBuilder: (index, isActive) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.setHeight, vertical: 18.setHeight),
          child: Image.asset(
            isActive ? iconSelectedList[index] : iconList[index],
            gaplessPlayback: true,
            color: !isActive ? null : CustomAppColor.of(context).primary,
          ),
        );
      },
      activeIndex: selectedTabIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      onTap: (index) {
        onTabIndexChanged(index);
      },
      itemCount: iconList.length,
      //other params
    );
  }
}
