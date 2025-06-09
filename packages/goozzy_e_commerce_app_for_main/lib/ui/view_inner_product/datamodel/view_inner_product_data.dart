import 'dart:core';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/string_constant.dart';
import '../../app/my_app.dart';

class ProductDetail {
  final String productName;
  final String productPrice;
  final String productMrp;
  final String productDiscount;
  final String deliverDate;
  final List<String> productImages;

  ProductDetail(
      {required this.productName,
      required this.productPrice,
      required this.productMrp,
      required this.productDiscount,
      required this.deliverDate,
      required this.productImages});
}

class ProductSize {
  final String size;
  final bool isSelected;

  ProductSize({required this.size, required this.isSelected});
}

List<ProductDetail> productDetail = [
  ProductDetail(
      productName: AppStrings.anniDesignerWomenArt,
      productPrice: "299",
      productMrp: "599",
      productDiscount: AppStrings.productDiscount1,
      deliverDate: AppStrings.dispatch,
      productImages: [
        AppAssets.imgOrangeSaree,
        AppAssets.imgOrangeSaree,
        AppAssets.imgOrangeSaree,
        AppAssets.imgOrangeSaree,
      ]),
];

List<ProductSize> productSize = [
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).s, isSelected: false),
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).m, isSelected: true),
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).l, isSelected: false),
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).xl, isSelected: false),
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).xxl, isSelected: false),
  ProductSize(size: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).free, isSelected: false),
];
