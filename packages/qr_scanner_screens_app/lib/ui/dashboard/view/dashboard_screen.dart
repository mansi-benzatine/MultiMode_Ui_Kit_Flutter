import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/ui/generate_qr/view/generate_qr_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/scan/view/scan_screen.dart';
import 'package:qr_scanner_screens_app_package/utils/app_assets.dart';
import 'package:qr_scanner_screens_app_package/utils/app_color.dart';
import 'package:qr_scanner_screens_app_package/utils/debug.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

import '../../favorite/view/favorite_screen.dart';
import '../../history/view/history_screen.dart';
import '../../setting/view/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;

  static Route<void> route({required int currentIndex}) {
    return MaterialPageRoute(
        builder: (_) => DashboardScreen(
              currentIndex: currentIndex,
            ));
  }

  const DashboardScreen({super.key, required this.currentIndex});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const GenerateQrScreen(),
    const HistoryScreen(),
    ScanScreen(key: UniqueKey()),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    Debug.printLog("OnItemTapped: $index");
    _selectedIndex.value = index;
    final pageIndex = index == 2
        ? 3
        : index == 3
            ? 4
            : index;
    _pageController.jumpToPage(pageIndex);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      int initialBarIndex;
      if (widget.currentIndex == 3) {
        initialBarIndex = 2; // Favorites
      } else if (widget.currentIndex == 4) {
        initialBarIndex = 3; // Settings
      } else if (widget.currentIndex == 2) {
        initialBarIndex = -1; // Scan screen (FAB)
      } else {
        initialBarIndex = widget.currentIndex; // GenerateQr (0), History (1)
      }
      _selectedIndex.value = initialBarIndex;
      _pageController.jumpToPage(widget.currentIndex);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.dispose();
    super.dispose();
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
          return IgnorePointer(
            ignoring: true,
            child: _BottomBar(
              selectedTabIndex: value,
              onTabIndexChanged: _onItemTapped,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 72.setHeight,
        height: 72.setHeight,
        child: IgnorePointer(
          ignoring: true,
          child: FloatingActionButton(
            backgroundColor: CustomAppColor.of(context).primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(16.setHeight),
              child: Image.asset(
                AppAssets.icTabScan,
                color: CustomAppColor.of(context).txtWhite,
              ),
            ),
            onPressed: () {
              Debug.printLog(
                  "Floating Action Button pressed - navigating to scan screen");
              _selectedIndex.value = -1; // No bottom bar icon selected
              _pageController.jumpToPage(2); // Scan screen
            },
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  _BottomBar({
    required this.selectedTabIndex,
    required this.onTabIndexChanged,
  });

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
        // Only mark as active if selectedTabIndex is not -1 and matches the index
        final isTabActive = selectedTabIndex >= 0 && selectedTabIndex == index;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.setHeight,
            vertical: 18.setHeight,
          ),
          child: Image.asset(
            isTabActive ? iconSelectedList[index] : iconList[index],
            gaplessPlayback: true,
            color: isTabActive ? CustomAppColor.of(context).primary : null,
          ),
        );
      },
      activeIndex: selectedTabIndex >= 0
          ? selectedTabIndex
          : 0, // Required by AnimatedBottomNavigationBar
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      onTap: onTabIndexChanged,
      itemCount: iconList.length,
    );
  }
}
