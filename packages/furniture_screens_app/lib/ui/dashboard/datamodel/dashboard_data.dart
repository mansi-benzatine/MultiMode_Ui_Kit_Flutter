import 'package:flutter/material.dart';

class BottomNavItem {
  final String selectedIcon;
  final String unselectedIcon;
  final Widget screen;

  BottomNavItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.screen,
  });
}
