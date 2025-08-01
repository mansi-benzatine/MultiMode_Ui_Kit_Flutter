import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class OnboardingData {
  OnboardingData({
    this.image,
    this.title,
  });

  String? image;
  String? title;
}

List<OnboardingData> onBoardingList(BuildContext context) {
  return [
    OnboardingData(
      image: AppAssets.imgOnBoarding1,
      title: Languages.of(context).txtOnBoardingTitle1,
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding2,
      title: Languages.of(context).txtOnBoardingTitle2,
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding3,
      title: Languages.of(context).txtOnBoardingTitle3,
    ),
  ];
}
