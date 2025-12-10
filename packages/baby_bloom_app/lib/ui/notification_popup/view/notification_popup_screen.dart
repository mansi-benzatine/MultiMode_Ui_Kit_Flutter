import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class NotificationPopupScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationPopupScreen());
  }

  const NotificationPopupScreen({super.key});

  @override
  State<NotificationPopupScreen> createState() => _NotificationPopupScreenState();
}

class _NotificationPopupScreenState extends State<NotificationPopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgBgUpgradePlan,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 0.screenHeight / 3,
            right: 20.setWidth,
            left: 20.setWidth,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: CustomAppColor.of(context).bgScreen,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.icClock,
                    width: 84.setWidth,
                    height: 84.setHeight,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: "10:00",
                    fontSize: 36.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "It’s time to take medicine.",
                    textColor: CustomAppColor.of(context).txtLightGrey,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                  SizedBox(height: 10.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icMedicine,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      const CommonText(
                        text: "Folic Acid",
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtSkip,
                          buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                          buttonColor: CustomAppColor.of(context).btnGrey,
                          borderColor: CustomAppColor.of(context).btnGrey,
                          height: 45.setHeight,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(width: 15.setWidth),
                      Expanded(
                        child: CommonButton(
                          height: 45.setHeight,
                          text: Languages.of(context).txtTaken,
                          onTap: () => Navigator.pop(context),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
