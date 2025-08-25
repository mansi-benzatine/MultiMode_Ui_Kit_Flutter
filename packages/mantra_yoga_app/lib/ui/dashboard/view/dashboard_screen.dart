import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/ui/profile/view/profile_screen.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/bottom_bar/bottom_bar_with_custom_painter.dart';
import '../../../widgets/text/common_text.dart';
import '../../analysis/view/analysis_screen.dart';
import '../../discover/view/discover_screen.dart';
import '../../history/view/history_screen.dart';
import '../../home/view/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const DashboardScreen());
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        // bottom: false,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            _currentIndex.value = index;
          },
          children: const [
            HomeScreen(),
            DiscoverScreen(),
            HistoryScreen(),
            AnalysisScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: MediaQuery.of(context).padding.bottom > 0 ? EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom) : EdgeInsets.zero,
        child: CustomPaint(
          size: Size(0.screenWidth, MediaQuery.of(context).size.height * 0.1),
          painter: BottomBarWithCustomPainter(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
            height: MediaQuery.of(context).size.height * 0.1,
            width: 0.screenWidth,
            alignment: Alignment.center,
            child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _itemBottomBar(_currentIndex.value == 0, Languages.of(context).txtHome, AppAssets.icBottomHome, AppAssets.icBottomHomeSelected, 0),
                    _itemBottomBar(_currentIndex.value == 1, Languages.of(context).txtDiscover, AppAssets.icBottomDiscover, AppAssets.icBottomDiscoverSelected, 1),
                    InkWell(
                      splashColor: CustomAppColor.of(context).transparent,
                      highlightColor: CustomAppColor.of(context).transparent,
                      onTap: () {
                        _pageController.jumpToPage(2);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03, right: 2.setWidth),
                        child: Image.asset(
                          _currentIndex.value == 2 ? AppAssets.icFloatingHistorySelected : AppAssets.icFloatingHistory,
                          width: 46.setHeight,
                          height: 46.setHeight,
                        ),
                      ),
                    ),
                    _itemBottomBar(_currentIndex.value == 3, Languages.of(context).txtAnalysis, AppAssets.icBottomAnalysis, AppAssets.icBottomAnalysisSelected, 3),
                    _itemBottomBar(_currentIndex.value == 4, Languages.of(context).txtProfile, AppAssets.icBottomProfile, AppAssets.icBottomProfileSelected, 4),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _itemBottomBar(bool isSelected, String text, String image, String imageSelected, int index) {
    return InkWell(
      splashColor: CustomAppColor.of(context).transparent,
      highlightColor: CustomAppColor.of(context).transparent,
      onTap: () {
        _pageController.jumpToPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isSelected ? imageSelected : image,
            width: 20.setHeight,
            height: 20.setHeight,
            color: isSelected ? null : CustomAppColor.of(context).txtBlackAndGray,
          ),
          SizedBox(height: 3.setHeight),
          CommonText(
            text: text,
            fontSize: 9.setFontSize,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontFamily: isSelected ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
            textColor: isSelected ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlackAndGray,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        ],
      ),
    );
  }
}
