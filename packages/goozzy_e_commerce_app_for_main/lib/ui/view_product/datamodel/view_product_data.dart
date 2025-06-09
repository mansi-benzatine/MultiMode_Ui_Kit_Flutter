import 'dart:ui';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/string_constant.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../app/my_app.dart';

class Images {
  final String imagePath;

  Images({required this.imagePath});
}

class ReviewData {
  final String username;
  final String review;
  final String date;
  final List<String> imagePath;
  final double rating;

  ReviewData({
    required this.username,
    required this.review,
    required this.date,
    required this.imagePath,
    required this.rating,
  });
}

class RatingData {
  final String label;
  final int percentage;
  final Color color;

  RatingData({
    required this.label,
    required this.percentage,
    required this.color,
  });
}

List<Images> imageList = [
  Images(imagePath: AppAssets.imgOrangeSaree2),
  Images(imagePath: AppAssets.imgOrangeSaree1),
  Images(imagePath: AppAssets.imgSaree1),
  Images(imagePath: AppAssets.imgWomenArtSilk),
  Images(imagePath: AppAssets.imgOrangeSaree2)
];

List<ReviewData> reviewList = [
  ReviewData(
    username: AppStrings.user1,
    review: AppStrings.review1,
    date: AppStrings.eighteenDays,
    imagePath: [
      AppAssets.imgOrangeSaree2,
      AppAssets.imgOrangeSaree1,
    ],
    rating: 4.4,
  ),
  ReviewData(
    username: AppStrings.user2,
    review: AppStrings.review2,
    date: "15 Jan,2021",
    imagePath: [
      AppAssets.imgOrangeSaree2,
      AppAssets.imgOrangeSaree1,
    ],
    rating: 4.4,
  ),
  ReviewData(
      username: AppStrings.user3,
      review: AppStrings.review3,
      date: "22 May,2021",
      imagePath: [
        AppAssets.imgOrangeSaree2,
        AppAssets.imgOrangeSaree1,
      ],
      rating: 1.0),
];

final List<RatingData> mockRatings = [
  RatingData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).excellent,
    percentage: 57,
    color: AppColor.darkGreen,
  ),
  RatingData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).veryGood,
    percentage: 27,
    color: AppColor.green,
  ),
  RatingData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).good,
    percentage: 12,
    color: AppColor.yellow,
  ),
  RatingData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).average,
    percentage: 7,
    color: AppColor.orange,
  ),
  RatingData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).poor,
    percentage: 13,
    color: AppColor.red,
  ),
];
