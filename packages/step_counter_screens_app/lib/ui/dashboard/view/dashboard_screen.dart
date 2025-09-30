import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/ui/history/view/history_screen.dart';
import 'package:step_counter_screens_app_package/ui/home/view/home_screen.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/curved_navigation_bar/curved_navigation_bar.dart';

import '../../../utils/app_assets.dart';
import '../../profile/view/profile_screen.dart';
import '../../setting/view/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isShowDeleteDialogInHistory;
  final bool isShowEmptyHistoryScreen;
  final int setCurrentIndexForBs;
  final bool isSelectedFeet;
  final bool isSelectedBedTimeSchedule;

  const DashboardScreen({
    super.key,
    this.currentIndex = 0,
    this.isShowDeleteDialogInHistory = false,
    this.isShowEmptyHistoryScreen = false,
    this.setCurrentIndexForBs = 0,
    this.isSelectedFeet = false,
    this.isSelectedBedTimeSchedule = false,
  });

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const DashboardScreen());
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(initialPage: widget.currentIndex);
    currentPage.value = widget.currentIndex;
    _pageController.addListener(
      () {},
    );
  }

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
          children: [
            HomeScreen(),
            HistoryScreen(
              isForDeleteBs: widget.isShowDeleteDialogInHistory,
              isForEmptyHistory: widget.isShowEmptyHistoryScreen,
            ),
            ProfileScreen(),
            SettingScreen(
              setCurrentBs: widget.setCurrentIndexForBs,
              isSelectedFeet: widget.isSelectedFeet,
              isSelectedBedTimeSchedule: widget.isSelectedBedTimeSchedule,
            ),
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
                    currentPage.value == 0 ? AppAssets.icBottomBarHomeSelected : AppAssets.icBottomBarHome,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    currentPage.value == 1 ? AppAssets.icBottomBarHistorySelected : AppAssets.icBottomBarHistory,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    currentPage.value == 2 ? AppAssets.icBottomBarProfileSelected : AppAssets.icBottomBarProfile,
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                  Image.asset(
                    currentPage.value == 3 ? AppAssets.icBottomBarSettingSelected : AppAssets.icBottomBarSetting,
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
