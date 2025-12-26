import 'package:flutter/cupertino.dart';

class BottomNavItem {
  final String screenName;
  final String selectedIcon;
  final String unselectedIcon;
  final Widget screen;

  BottomNavItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.screen,
    required this.screenName,
  });
}
