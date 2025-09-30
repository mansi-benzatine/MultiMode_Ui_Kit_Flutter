import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../login/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgGetStarted),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 20.setWidth,
                right: 20.setWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppAssets.icGetStarted, width: 40.setWidth),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLetExploreYourFavouriteMusic.toUpperCase(),
                      fontSize: 28.setFontSize,
                      fontWeight: FontWeight.w800,
                      textColor: CustomAppColor.of(context).white,
                      textAlign: TextAlign.start,
                      height: 0,
                      maxLines: 2,
                    ),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).white,
                      height: 0,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonButton(
                      text: Languages.of(context).txtGetStarted,
                      mBottom: 21.setHeight,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
