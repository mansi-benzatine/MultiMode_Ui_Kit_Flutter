import 'package:flutter/material.dart';

class AccountNavigationList {
  final String? iconString;
  final String title;
  final String? subTitle;
  final Widget screen;

  AccountNavigationList({
    this.iconString,
    required this.title,
    this.subTitle,
    required this.screen,
  });
}
