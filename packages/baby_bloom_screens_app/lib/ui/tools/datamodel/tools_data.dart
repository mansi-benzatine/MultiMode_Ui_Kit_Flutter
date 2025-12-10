import 'package:flutter/cupertino.dart';

class ToolsData {
  final String toolName;
  final String toolImage;
  final Color toolColor;
  bool isUpgradePlan;
  final Widget widget;

  ToolsData({
    required this.toolName,
    required this.toolImage,
    required this.toolColor,
    this.isUpgradePlan = false,
    required this.widget,
  });
}
