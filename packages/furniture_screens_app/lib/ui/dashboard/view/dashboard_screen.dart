import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';

import '../../home/view/home_screen.dart';
import '../../my_cart/view/my_cart_screen.dart';
import '../../my_favourites/view/my_favourites_screen.dart';
import '../../my_orders/views/my_orders_screen.dart';
import '../../my_profile/view/my_profile_screen.dart';
import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isForEmptyCart;
  final bool isForEmptyFavourite;
  final String selectedTabInOrderScreen;
  final bool isForCancelOrderDialog;
  final bool isForReviewOrder;
  final bool isShowLogoutDialog;

  static Route<void> route({
    int currentIndex = 0,
    bool isForEmptyCart = false,
    bool isForEmptyFavourite = false,
    String selectedTabInOrderScreen = "Active",
    bool isForCancelOrderDialog = false,
    bool isForReviewOrder = false,
    bool isShowlogoutDialog = false,
  }) {
    return MaterialPageRoute(
        builder: (_) => DashboardScreen(
              currentIndex: currentIndex,
              isForEmptyCart: isForEmptyCart,
              isForEmptyFavourite: isForEmptyFavourite,
              selectedTabInOrderScreen: selectedTabInOrderScreen,
              isForReviewOrder: isForReviewOrder,
              isForCancelOrderDialog: isForCancelOrderDialog,
              isShowLogoutDialog: isShowlogoutDialog,
            ));
  }

  const DashboardScreen({
    super.key,
    this.currentIndex = 0,
    this.isForEmptyCart = false,
    this.isForEmptyFavourite = false,
    this.selectedTabInOrderScreen = "Active",
    this.isForCancelOrderDialog = false,
    this.isForReviewOrder = false,
    this.isShowLogoutDialog = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<BottomNavItem> _navItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.currentIndex;
    _navItems = [
      BottomNavItem(
        selectedIcon: AppAssets.icSelectedHome,
        unselectedIcon: AppAssets.icUnselectedHome,
        screen: const HomeScreen(),
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icSelectedCart,
        unselectedIcon: AppAssets.icUnselectedCart,
        screen: MyCartScreen(isForEmptyCart: widget.isForEmptyCart),
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icMyOrder,
        unselectedIcon: AppAssets.icSelectedMyOrder,
        screen: MyOrdersScreen(
          selectedTab: widget.selectedTabInOrderScreen,
          isForCancelOrderDialog: widget.isForCancelOrderDialog,
          isForReviewOrder: widget.isForReviewOrder,
        ),
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icSelectedOrder,
        unselectedIcon: AppAssets.icUnselectedOrder,
        screen: MyFavouritesScreen(isForEmptyFavourite: widget.isForEmptyFavourite),
      ),
      BottomNavItem(
        selectedIcon: AppAssets.icSelectedProfile,
        unselectedIcon: AppAssets.icUnselectedProfile,
        screen: MyProfileScreen(
          isShowLogoutDialog: widget.isShowLogoutDialog,
        ),
      ),
    ];
  }

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
              child: IgnorePointer(
                ignoring: true,
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
