import 'package:flutter/material.dart';
import 'package:stoxy_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_app_package/ui/news/views/news_screen.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/sizer_utils.dart';
import '../../exchange_stock/view/exchange_stock_screen.dart';
import '../../portfolio/view/portfolio_screen.dart';
import '../../profile/view/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _pages = [];

  ValueNotifier<bool> isMusicPlaying = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const PortfolioScreen(),
      const ExchangeStockScreen(),
      const NewsScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),
            _bottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Main bottom bar container
        Container(
          height: 70.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bottomNavigation,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                icon: AppAssets.icBottomHome,
                selectedIcon: AppAssets.icBottomHomeSelected,
                text: "Home",
                index: 0,
              ),
              _buildNavItem(
                icon: AppAssets.icBottomPortfolio,
                selectedIcon: AppAssets.icBottomPortfolioSelected,
                text: "Portfolio",
                index: 1,
              ),
              SizedBox(width: 50.setWidth), // Space for center diamond button
              _buildNavItem(
                icon: AppAssets.icBottomNews,
                selectedIcon: AppAssets.icBottomNewsSelected,
                text: "News",
                index: 3,
              ),
              _buildNavItem(
                icon: AppAssets.icBottomProfile,
                selectedIcon: AppAssets.icBottomProfileSelected,
                text: "Profile",
                index: 4,
              ),
            ],
          ),
        ),

        // Diamond center button
        Positioned(
          top: -25.setHeight,
          child: GestureDetector(
            onTap: () {
              if (_selectedIndex != 2) {
                _pageController.jumpToPage(2);
              }
            },
            child: Transform.rotate(
              angle: 0.785398, // 45 degrees in radians
              child: Container(
                width: 55.setWidth,
                height: 55.setHeight,
                decoration: BoxDecoration(
                  gradient: CustomAppColor.of(context).primaryGradient,
                  borderRadius: BorderRadius.circular(12.setWidth),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(18),
                child: Transform.rotate(
                  angle: -0.785398, // Rotate back to keep icon upright
                  child: Image.asset(
                    AppAssets.icBottomSwap,
                    width: 24.setWidth,
                    height: 24.setHeight,
                    fit: BoxFit.contain,
                    color: CustomAppColor.of(context).white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({required String icon, required String selectedIcon, required String text, required int index}) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          _pageController.jumpToPage(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24.setWidth,
            height: 24.setHeight,
            child: Image.asset(
              isSelected ? selectedIcon : icon,
              height: 24.setHeight,
              fit: BoxFit.contain,
              color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtDescriptionGray,
            ),
          ),
          SizedBox(height: 4.setHeight),
          CommonText(
            text: text,
            fontSize: 12.setFontSize,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }
}
