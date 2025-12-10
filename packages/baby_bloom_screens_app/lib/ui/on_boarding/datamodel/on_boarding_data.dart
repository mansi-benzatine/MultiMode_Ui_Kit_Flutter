import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class OnBoardingData {
  final String image;
  final String heading;
  final String descrption;

  OnBoardingData({
    required this.image,
    required this.descrption,
    required this.heading,
  });
}

List<OnBoardingData> onboardingList(BuildContext context) {
  return [
    OnBoardingData(
      image: AppAssets.imgOnBoarding1,
      descrption: Languages.of(context).txtOnBoarding1Desc,
      heading: Languages.of(context).txtOnBoarding1,
    ),
    OnBoardingData(
      image: AppAssets.imgOnBoarding2,
      descrption: Languages.of(context).txtOnBoarding2Desc,
      heading: Languages.of(context).txtOnBoarding2,
    ),
    OnBoardingData(
      image: AppAssets.imgOnBoarding3,
      descrption: Languages.of(context).txtOnBoarding3Desc,
      heading: Languages.of(context).txtOnBoarding3,
    ),
  ];
}
