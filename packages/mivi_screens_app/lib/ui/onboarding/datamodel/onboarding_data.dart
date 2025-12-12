import 'package:flutter/cupertino.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';

import '../../../localization/language/languages.dart';

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
      image: AppAssets.imgOnboarding1,
      descrption: Languages.of(context).txtDummyText,
      heading: Languages.of(context).txtOnBoarding1,
    ),
    OnBoardingData(
      image: AppAssets.imgOnboarding2,
      descrption: Languages.of(context).txtDummyText,
      heading: Languages.of(context).txtOnBoarding2,
    ),
    OnBoardingData(
      image: AppAssets.imgOnboarding3,
      descrption: Languages.of(context).txtDummyText,
      heading: Languages.of(context).txtOnBoarding3,
    ),
    OnBoardingData(
      image: AppAssets.imgOnboarding4,
      descrption: Languages.of(context).txtDummyText,
      heading: Languages.of(context).txtOnBoarding4,
    ),
  ];
}
