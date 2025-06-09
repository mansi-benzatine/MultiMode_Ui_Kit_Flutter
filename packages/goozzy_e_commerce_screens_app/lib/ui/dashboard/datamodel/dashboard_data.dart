import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../account/view/account_screen.dart';
import '../../app/my_app.dart';
import '../../category/view/category_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../../orders/view/orders_screen.dart';

class BottomNavigationBarData {
  BottomNavigationBarData({
    this.image,
    this.title,
    this.screen,
  });

  String? image;
  String? title;
  Widget? screen;
}

List<BottomNavigationBarData> bottomNavigationBarList = [
  BottomNavigationBarData(
    title: Languages.of(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context).home,
    image: AppAssets.icHome,
    screen: const HomeScreen(),
  ),
  BottomNavigationBarData(
    title: Languages.of(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context).category,
    image: AppAssets.icCategory,
    screen: const CategoryScreen(),
  ),
  BottomNavigationBarData(
    title: Languages.of(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context).orders,
    image: AppAssets.icBag,
    screen: const OrdersScreen(),
  ),
  BottomNavigationBarData(
    title: Languages.of(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context).account,
    image: AppAssets.icProfile,
    screen: const AccountScreen(),
  ),
];
