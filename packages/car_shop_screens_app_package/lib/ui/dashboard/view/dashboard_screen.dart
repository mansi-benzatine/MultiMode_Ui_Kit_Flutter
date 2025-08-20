import 'package:car_shop_screens_app_package/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../favourite/view/favourite_car_screen.dart';
import '../../home/view/home_screen.dart';
import '../../my_profile/view/my_profile_screen.dart';
import '../../news/view/news_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int selectedIndex;

  static Route<void> route({required int selectedIndex}) {
    return MaterialPageRoute(builder: (_) => DashboardScreen(selectedIndex: selectedIndex));
  }

  const DashboardScreen({super.key, required this.selectedIndex});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _pageController = PageController(initialPage: widget.selectedIndex);
    _pages = [
      HomeScreen(
        onTopBarClick: (name) {
          if (name == Constant.strFavorite) {
            _navigateToFavorite();
          }
        },
      ),
      const NewsScreen(),
      const FavouriteCarScreen(),
      const MyProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 50.setHeight,
            left: 0,
            right: 0,
            child: _bottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 0.screenWidth * 0.15,
        ),
        padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
        decoration: BoxDecoration(
          gradient: CustomAppColor.of(context).primaryGradient,
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(AppAssets.icTabHome, AppAssets.icTabHomeSelected, 0),
            _buildNavItem(AppAssets.icTabNews, AppAssets.icTabNewsSelected, 1),
            _buildNavItem(AppAssets.icTabFavourite, AppAssets.icTabFavouriteSelected, 2),
            _buildNavItem(AppAssets.icTabProfile, AppAssets.icTabProfileSelected, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String selectedIcon, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          _pageController.jumpToPage(index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(12.setWidth),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          width: 22.setWidth,
          height: 22.setHeight,
          child: Image.asset(
            isSelected ? selectedIcon : icon,
            height: 24.setHeight,
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }

  void _navigateToFavorite() {
    _pageController.jumpToPage(2);
  }
}
