import 'package:flutter/material.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/sign_in/view/sign_in_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';

import '../../../widgets/button/swip_button.dart';

class GetStartScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GetStartScreen());
  }

  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppAssets.imgGetStart,
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 30,
            left: 22.setWidth,
            right: 22.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailsView(),
                SizedBox(height: 10.setHeight),
                SwipeToNavigateButton(
                  text: Languages.of(context).txtGetStarted,
                  destinationPage: const SignInScreen(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _detailsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 4.setHeight),
              height: 64.setHeight,
              child: VerticalDivider(
                indent: 0.1,
                color: CustomAppColor.of(context).white,
                thickness: 1,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtFindYourDream.toUpperCase(),
                  fontSize: 34.setFontSize,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).white,
                ),
                CommonText(
                  text: Languages.of(context).txtFurniture.toUpperCase(),
                  fontSize: 34.setFontSize,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtCream,
                  height: 0.8,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 7.setHeight),
          child: CommonText(
            text: Languages.of(context).txtGetStartedDesc,
            fontSize: 14.setFontSize,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).white,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
