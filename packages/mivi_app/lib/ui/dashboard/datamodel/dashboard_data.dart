import 'package:flutter/material.dart';

class BottomNavigationBarItemData {
  final String name;
  final String selectedIconPath;
  final String unselectedIconPath;
  final Widget screen;

  BottomNavigationBarItemData({
    required this.name,
    required this.selectedIconPath,
    required this.unselectedIconPath,
    required this.screen,
  });
}
