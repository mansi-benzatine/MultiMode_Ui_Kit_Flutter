import '../../../../../utils/app_assets.dart';
import '../../../../../utils/string_constant.dart';

class Category {
  final String? imagePath;
  final String? label;

  Category({this.imagePath, this.label});
}

List<Category> topWearList = [
  Category(label: AppStrings.allTopWear, imagePath: AppAssets.imgShirt),
  Category(label: AppStrings.tShirt, imagePath: AppAssets.imgTShirt),
  Category(label: AppStrings.shirt, imagePath: AppAssets.imgTopWear),
  Category(label: AppStrings.winter, imagePath: AppAssets.imgWinter),
  Category(label: AppStrings.jacket, imagePath: AppAssets.imgJacket),
  Category(label: AppStrings.sweater, imagePath: AppAssets.imgSweater),
];

List<Category> bottomWearList = [
  Category(label: AppStrings.allBottomWear, imagePath: AppAssets.imgJeans),
  Category(label: AppStrings.track, imagePath: AppAssets.imgTrackSuit),
  Category(label: AppStrings.jeans, imagePath: AppAssets.imgTrousers)
];
List<Category> accessoriesList = [
  Category(label: AppStrings.allAccessories, imagePath: AppAssets.imgAccessories),
  Category(label: AppStrings.watches, imagePath: AppAssets.imgWatch),
  Category(label: AppStrings.belt, imagePath: AppAssets.imgLeatherBelt)
];
