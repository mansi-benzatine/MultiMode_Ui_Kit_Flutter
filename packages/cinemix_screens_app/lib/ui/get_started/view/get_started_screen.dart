import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/login/view/login_screen.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/animated_image_row/animated_image_row.dart';
import '../../../widgets/text/common_text.dart';

class GetStartedScreen extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(builder: (_) => const GetStartedScreen());

  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageLists = [
      [
        AppAssets.imgGetStarted1,
        AppAssets.imgGetStarted2,
        AppAssets.imgGetStarted3,
        AppAssets.imgGetStarted4,
        AppAssets.imgGetStarted5,
        AppAssets.imgGetStarted6,
      ],
      [
        AppAssets.imgGetStarted4,
        AppAssets.imgGetStarted5,
        AppAssets.imgGetStarted6,
        AppAssets.imgGetStarted7,
        AppAssets.imgGetStarted8,
        AppAssets.imgGetStarted9,
      ],
      [
        AppAssets.imgGetStarted7,
        AppAssets.imgGetStarted8,
        AppAssets.imgGetStarted9,
        AppAssets.imgGetStarted1,
        AppAssets.imgGetStarted2,
        AppAssets.imgGetStarted3,
      ],
    ];

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Positioned(
            top: -110,
            left: -92,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(imageLists.length, (i) {
                return AnimatedImageRow(
                  images: imageLists[i],
                  reverse: i.isOdd,
                );
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 70.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.05),
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.8),
                    CustomAppColor.of(context).bgLinearShadow,
                    CustomAppColor.of(context).bgLinearShadow,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.2, 0.3, 0.9],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 70.setHeight),
                  CommonText(
                    text: Languages.of(context).txtGetAccessToYourFavoriteMovie,
                    textAlign: TextAlign.center,
                    fontSize: 30.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                  ),
                  SizedBox(height: 18.setHeight),
                  CommonText(
                    text: Languages.of(context).txtDummyText,
                    textAlign: TextAlign.center,
                    fontSize: 13.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskRegular400,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 18.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtGetStarted.toUpperCase(),
                      buttonTextColor: CustomAppColor.of(context).white,
                      onTap: () => Navigator.push(context, LoginScreen.route()),
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
