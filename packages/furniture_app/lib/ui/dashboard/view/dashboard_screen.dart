import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/home/view/home_screen.dart';
import 'package:furniture_app_package/ui/my_cart/view/my_cart_screen.dart';
import 'package:furniture_app_package/ui/my_favourites/view/my_favourites_screen.dart';
import 'package:furniture_app_package/ui/my_orders/views/my_orders_screen.dart';
import 'package:furniture_app_package/ui/my_profile/view/my_profile_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';

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
  int currentIndex = 0;
  final List<BottomNavItem> _navItems = [
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedHome,
      unselectedIcon: AppAssets.icUnselectedHome,
      screen: const HomeScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedCart,
      unselectedIcon: AppAssets.icUnselectedCart,
      screen: const MyCartScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icMyOrder,
      unselectedIcon: AppAssets.icSelectedMyOrder,
      screen: const MyOrdersScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedOrder,
      unselectedIcon: AppAssets.icUnselectedOrder,
      screen: const MyFavouritesScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedProfile,
      unselectedIcon: AppAssets.icUnselectedProfile,
      screen: const MyProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _navItems[currentIndex].screen,
            CustomPaint(
              size: const Size(double.infinity, 110),
              painter: MyPainter(bgColor: CustomAppColor.of(context).bottomNavbar),
              child: Container(
                height: 110.setHeight,
                padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 0.setHeight),
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildIcon(0),
                    _buildIcon(1),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03, right: 2.setWidth),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomAppColor.of(context).bgScreen,
                            width: 8.setWidth,
                          ),
                        ),
                        child: Image.asset(
                          currentIndex == 2 ? AppAssets.icSelectedMyOrder : AppAssets.icMyOrder,
                          width: 60.setWidth,
                          height: 60.setHeight,
                        ),
                      ),
                    ),
                    _buildIcon(3),
                    _buildIcon(4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    final isSelected = currentIndex == index;
    final iconPath = isSelected ? _navItems[index].selectedIcon : _navItems[index].unselectedIcon;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Image.asset(
            iconPath,
            height: 24.setHeight,
            width: 26.setWidth,
          ),
        ),
        SizedBox(height: 26.setHeight),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final Color bgColor;

  MyPainter({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = bgColor;
    path = Path();
    path.lineTo(size.width * 0.42, size.height * 0.28);
    path.cubicTo(size.width * 0.58, size.height * 0.28, size.width * 0.93, size.height * 0.38, size.width * 0.93, size.height * 0.38);
    path.cubicTo(size.width * 0.99, size.height * 0.39, size.width, size.height * 0.56, size.width, size.height * 0.77);
    path.cubicTo(size.width, size.height * 0.77, size.width, size.height * 1.28, size.width, size.height * 1.28);
    path.cubicTo(size.width, size.height * 1.28, 0, size.height * 1.28, 0, size.height * 1.28);
    path.cubicTo(0, size.height * 1.28, 0, size.height * 0.77, 0, size.height * 0.77);
    path.cubicTo(0, size.height * 0.56, size.width * 0.03, size.height * 0.39, size.width * 0.07, size.height * 0.38);
    path.cubicTo(size.width * 0.07, size.height * 0.38, size.width * 0.42, size.height * 0.28, size.width * 0.42, size.height * 0.28);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
