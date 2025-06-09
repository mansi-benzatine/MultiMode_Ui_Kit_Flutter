import 'dart:ui';

import '../../../../../../ui/home_screen/datamodel/home_screen_data.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/string_constant.dart';

class OfferData {
  final String title;
  final String imagePath;
  final String subTitle;
  final Color cardColor;

  OfferData({required this.title, required this.imagePath, required this.subTitle, required this.cardColor});
}

class CategoryProducts {
  final String productName;
  final String productPrice;
  final String? productMrp;
  final String discount;
  final String productImage;
  final List<String> productImageList;

  CategoryProducts({
    required this.productName,
    required this.productPrice,
    required this.discount,
    required this.productImage,
    required this.productImageList,
    this.productMrp,
  });
}

List<OfferData> offerList = [
  OfferData(
    title: AppStrings.newArrival,
    imagePath: AppAssets.icPercentage,
    subTitle: AppStrings.newOffer,
    cardColor: AppColor.btnPurple,
  ),
  OfferData(
    title: AppStrings.topSelling,
    imagePath: AppAssets.icPercentage,
    subTitle: AppStrings.underOffer,
    cardColor: AppColor.containerLightBlue,
  ),
];

List<Products> categoryProductsList = [
  Products(
    productName: AppStrings.dennisLingoMensSolidSlimFitCasualShirt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgDennisShirt,
    productImageList: [
      AppAssets.imgShirt1,
      AppAssets.imgShirt2,
      AppAssets.imgShirt3,
      AppAssets.imgShirt4,
    ],
  ),
  Products(
    productName: AppStrings.dennisLingoMensSolidSlimFitCasualShirt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgDennisShirt2,
    productImageList: [
      AppAssets.imgShirt1,
      AppAssets.imgShirt2,
      AppAssets.imgShirt3,
      AppAssets.imgShirt4,
    ],
  ),
];
