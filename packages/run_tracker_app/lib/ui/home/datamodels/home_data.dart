import 'package:flutter/cupertino.dart';

class RecentActivity {
  final String date;
  final double distance;
  final String duration;
  final String pace;
  final double calories;
  final String? mapThumbnail;

  RecentActivity({
    required this.date,
    required this.distance,
    required this.duration,
    required this.pace,
    required this.calories,
    this.mapThumbnail,
  });
}

class BestRecords {
  final String icon;
  final String title;
  final String description;
  final String? trailingString;
  final String? date;

  BestRecords({
    required this.icon,
    required this.description,
    required this.title,
    this.trailingString,
    this.date,
  });
}

class DetailsItem {
  final String icon;
  final Color iconBackground;
  final String value;
  final String unit;
  final String label;

  DetailsItem({
    required this.icon,
    required this.iconBackground,
    required this.value,
    required this.unit,
    required this.label,
  });
}
