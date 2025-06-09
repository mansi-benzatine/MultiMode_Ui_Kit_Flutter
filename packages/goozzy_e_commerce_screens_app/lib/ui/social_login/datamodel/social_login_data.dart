import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class SocialLoginData {
  final String? assetPath;
  final String? buttonText;

  SocialLoginData({this.assetPath, this.buttonText});
}

List<SocialLoginData> socialLoginList(BuildContext context) {
  return [
    SocialLoginData(
      assetPath: AppAssets.icGoogle,
      buttonText: Languages.of(context).continueWithGoogle,
    ),
    SocialLoginData(
      assetPath: AppAssets.icFacebook,
      buttonText: Languages.of(context).continueWithFacebook,
    ),
    SocialLoginData(
      assetPath: AppAssets.icApple,
      buttonText: Languages.of(context).continueWithApple,
    ),
  ];
}
