import 'package:flutter/material.dart';
import 'package:step_counter_app_package/ui/history/view/history_screen.dart';
import 'package:step_counter_app_package/ui/home/view/home_screen.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/curved_navigation_bar/curved_navigation_bar.dart';

import '../../../utils/app_assets.dart';
import '../../profile/view/profile_screen.dart';
import '../../setting/view/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const DashboardScreen());
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            currentPage.value = index;
            _bottomNavigationKey.currentState?.setPage(index);
          },
          children: const [
            HomeScreen(),
            HistoryScreen(),
            ProfileScreen(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentPage,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.10),
                    blurRadius: 25,
                    spreadRadius: 0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CurvedNavigationBar(
                backgroundColor: CustomAppColor.of(context).transparent,
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                buttonBackgroundColor: CustomAppColor.of(context).primary,
                key: _bottomNavigationKey,
                height: 75.setHeight,
                items: <Widget>[
                  Image.asset(
                    value == 0 ? AppAssets.icBottomBarHomeSelected : AppAssets.icBottomBarHome,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    value == 1 ? AppAssets.icBottomBarHistorySelected : AppAssets.icBottomBarHistory,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    value == 2 ? AppAssets.icBottomBarProfileSelected : AppAssets.icBottomBarProfile,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    value == 3 ? AppAssets.icBottomBarSettingSelected : AppAssets.icBottomBarSetting,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                ],
                onTap: (index) {
                  currentPage.value = index;
                  _pageController.jumpToPage(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
