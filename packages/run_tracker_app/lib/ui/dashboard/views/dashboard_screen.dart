import 'package:flutter/material.dart';
import 'package:run_tracker_app/ui/allow_locations_permission/views/allow_locations_permission_screen.dart';
import 'package:run_tracker_app/ui/history/views/history_screen.dart';
import 'package:run_tracker_app/ui/home/view/home_screen.dart';
import 'package:run_tracker_app/ui/reports/views/reports_screen.dart';
import 'package:run_tracker_app/ui/setting/views/setting_screen.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';

import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  static Route<void> route({required int currentIndex}) {
    return MaterialPageRoute(
      builder: (_) => DashboardScreen(currentIndex: currentIndex),
    );
  }

  const DashboardScreen({super.key, required this.currentIndex});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<BottomNavItem> _navItems = [
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedHome,
      unselectedIcon: AppAssets.icUnSelectedHome,
      screen: HomeScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedHistory,
      unselectedIcon: AppAssets.icUnSelectedHistory,
      screen: HistoryScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedReports,
      unselectedIcon: AppAssets.icUnSelectedReport,
      screen: ReportsScreen(),
    ),
    BottomNavItem(
      selectedIcon: AppAssets.icSelectedSetting,
      unselectedIcon: AppAssets.icUnSelectedSetting,
      screen: SettingScreen(),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: _navItems[currentIndex].screen,
        floatingActionButton: SizedBox(
          height: 80.setHeight,
          width: 80.setWidth,
          child: FloatingActionButton(
            backgroundColor: CustomAppColor.of(context).primary,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            elevation: 0,
            child: Icon(
              Icons.directions_run,
              color: CustomAppColor.of(context).icWhite,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context, AllowLocationsPermissionScreen.route());
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 80.setHeight,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.05),
                offset: Offset(0, -2),
                blurRadius: 15,
                spreadRadius: 8,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: PhysicalModel(
            color: CustomAppColor.of(context).transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            clipBehavior: Clip.antiAlias,
            child: BottomAppBar(
              shape: const RoundedNotchedRectangle(radius: 30),
              notchMargin: 8,
              color: CustomAppColor.of(context).bottomNavbar,
              child: SizedBox(
                height: 100.setHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIcon(0),
                    _buildIcon(1),
                    SizedBox(width: 60.setWidth),
                    _buildIcon(2),
                    _buildIcon(3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    final isSelected = currentIndex == index;
    final iconPath = isSelected
        ? _navItems[index].selectedIcon
        : _navItems[index].unselectedIcon;
    final selectedIcon = isSelected
        ? CustomAppColor.of(context).primary
        : CustomAppColor.of(context).icGrey;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Image.asset(
        iconPath,
        height: 26.setHeight,
        width: 26.setWidth,
        color: selectedIcon,
      ),
    );
  }
}

class RoundedNotchedRectangle extends NotchedShape {
  final double radius;

  const RoundedNotchedRectangle({this.radius = 30});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(host, Radius.circular(radius)));
    }

    final notchRadius = guest.width / 2.0;
    final path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(host.width - radius, 0)
      ..quadraticBezierTo(host.width, 0, host.width, radius)
      ..lineTo(host.width, host.height)
      ..lineTo(0, host.height)
      ..close();

    final notchCenter = guest.center.dx;
    final notchTop = guest.top;

    path.addOval(
      Rect.fromCircle(
        center: Offset(notchCenter, notchTop + notchRadius),
        radius: notchRadius + 2,
      ),
    );
    path.fillType = PathFillType.evenOdd;

    return path;
  }
}
