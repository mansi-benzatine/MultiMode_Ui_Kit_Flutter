import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeData themeData;
  final Function(ThemeData) onThemeChanged;

  const ThemeProvider({
    super.key,
    required this.themeData,
    required this.onThemeChanged,
    required super.child,
  });

  static ThemeProvider? of(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    } catch (e) {
      return null;
    }
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return themeData != oldWidget.themeData;
  }
}
