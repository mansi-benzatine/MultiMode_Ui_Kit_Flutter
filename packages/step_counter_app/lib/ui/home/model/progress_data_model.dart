import 'package:flutter/material.dart';

class ProgressDataModel {
  final String title;
  final String value;
  final String unit;
  final String icon;
  final Color color;
  final Color containerColor;
  final Color containerBgColor;

  ProgressDataModel({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
    required this.containerColor,
    required this.containerBgColor,
  });
}
