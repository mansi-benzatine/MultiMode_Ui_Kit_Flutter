import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class OnboardingData {
  OnboardingData({
    this.image,
    this.title,
    this.subTitle,
    this.description,
  });

  String? image;
  String? title;
  String? subTitle;
  String? description;
}

List<OnboardingData> onBoardingList(BuildContext context) {
  return [
    OnboardingData(
      image: AppAssets.imgOnBoarding1,
      title: Languages.of(context).txtOnBoardingTitle1,
      subTitle: Languages.of(context).txtOnBoardingSubTitle1,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding2,
      title: Languages.of(context).txtOnBoardingTitle2,
      subTitle: Languages.of(context).txtOnBoardingSubTitle2,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    ),
    OnboardingData(
      image: AppAssets.imgOnBoarding3,
      title: Languages.of(context).txtOnBoardingTitle3,
      subTitle: Languages.of(context).txtOnBoardingSubTitle3,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    ),
  ];
}
