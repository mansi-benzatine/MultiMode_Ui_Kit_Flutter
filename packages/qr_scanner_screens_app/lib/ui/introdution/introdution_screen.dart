import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class IntroductionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const IntroductionScreen());
  }

  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtIntroduction,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: 25.setWidth, vertical: 16.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtScanQrCodeBarcode,
                      fontSize: 18.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsum,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 25.setHeight),
                    CommonText(
                      text: Languages.of(context).txtCreateQrCode,
                      fontSize: 18.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsum,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 25.setHeight),
                    CommonText(
                      text: Languages.of(context).txtShareToYourFriends,
                      fontSize: 18.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: Languages.of(context).txtLoremIpsum,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
