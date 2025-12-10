import 'package:flutter/material.dart';
import 'package:grokit_app/ui/enter_your_location/view/enter_your_location.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class YourLocationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourLocationScreen());
  }

  const YourLocationScreen({super.key});

  @override
  State<YourLocationScreen> createState() => _YourLocationScreenState();
}

class _YourLocationScreenState extends State<YourLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.setHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 55.setHeight, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtYourLocation.replaceAll(" ", "\n"),
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 165.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 0.setHeight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).cardBgBlackWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.07),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtYourLocationDesc,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Image.asset(AppAssets.imgLocation),
                      SizedBox(height: 30.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtSearchLocationManually,
                        borderColor: CustomAppColor.of(context).txtBlack,
                        buttonColor: CustomAppColor.of(context).transparent,
                        buttonTextColor: CustomAppColor.of(context).txtBlack,
                        onTap: () {
                          Navigator.push(context, EnterYourLocation.route());
                        },
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonButton(
                        text: Languages.of(context).txtDetectMyLocation,
                        borderColor: CustomAppColor.of(context).borderPrimary,
                        buttonColor: CustomAppColor.of(context).buttonPrimary,
                        onTap: () {
                          Navigator.push(context, EnterYourLocation.route());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
