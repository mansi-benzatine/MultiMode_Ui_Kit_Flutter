import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class OnboardingData {
  OnboardingData({
    this.image,
    this.title,
    this.description,
  });

  String? image;
  String? title;
  String? description;
}

List<OnboardingData> onBoardingList(BuildContext context) {
  return [
    OnboardingData(
      image: AppAssets.imgOnBoarding1,
      title: Languages.of(context).txtOnBoardingTitle1,
      description: Languages.of(context).txtLoremIpsum,
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding2,
      title: Languages.of(context).txtOnBoardingTitle2,
      description: Languages.of(context).txtLoremIpsum,
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding3,
      title: Languages.of(context).txtOnBoardingTitle3,
      description: Languages.of(context).txtLoremIpsum,
    ),
  ];
}
