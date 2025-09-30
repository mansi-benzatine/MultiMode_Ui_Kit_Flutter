import 'dart:ui';

class PromoModel {
  final String title;
  final String description;
  final String code;
  final int discount; // percentage
  final Color color;

  PromoModel({
    required this.title,
    required this.description,
    required this.code,
    required this.discount,
    this.color = const Color(0xFF8B5E3C), // default brown
  });
}
