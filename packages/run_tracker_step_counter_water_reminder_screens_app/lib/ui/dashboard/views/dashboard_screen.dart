import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';

import '../../home/views/home_screen.dart';
import '../../location_permission/views/location_permission_screen.dart';
import '../../profile/views/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isAddWeightBs;
  static Route<void> route({required int currentIndex, bool isAddWeightBs = false}) => MaterialPageRoute(
    builder: (_) => DashboardScreen(currentIndex: currentIndex, isAddWeightBs: isAddWeightBs),
  );

  const DashboardScreen({super.key, required this.currentIndex, this.isAddWeightBs = false});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = [];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [const HomeScreen(), const LocationPermissionScreen(), ProfileScreen(isShownAddWeightBs: widget.isAddWeightBs)];
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: _screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selectedIndex == 1
          ? null
          : IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => _onNavTap(1),
                child: Image.asset(AppAssets.icRun, width: 72.setWidth, height: 72.setHeight),
              ),
            ),
      bottomNavigationBar: _selectedIndex == 1 ? null : _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80.setHeight,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: Offset(0, -4))],
          ),
        ),
        BottomAppBar(
          elevation: 0,
          color: CustomAppColor.of(context).bottomNavbar,
          child: Container(
            height: 70.setHeight,
            decoration: BoxDecoration(color: CustomAppColor.of(context).bottomNavbar),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(_selectedIndex == 0 ? AppAssets.icSelectedHome : AppAssets.icUnselectedHome, 0),
                SizedBox(width: 70.setWidth),
                _buildNavItem(_selectedIndex == 2 ? AppAssets.icSelectedProfile : AppAssets.icUnselectedProfile, 2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () => _onNavTap(index),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 20.setWidth),
          child: Image.asset(iconPath, width: 28.setWidth, height: 28.setHeight),
        ),
      ),
    );
  }
}
