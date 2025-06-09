import 'dart:core';

import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/string_constant.dart';

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
