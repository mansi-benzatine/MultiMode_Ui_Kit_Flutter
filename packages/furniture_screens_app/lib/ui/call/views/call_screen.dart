import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

class CallScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CallScreen());
  }

  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).containerBg,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              appBarColor: CustomAppColor.of(context).containerBg,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomAppColor.of(context).primary,
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.imgDummyProfile,
                      height: 190.setHeight,
                      width: 190.setHeight,
                    ),
                  ),
                  SizedBox(height: 30.setHeight),
                  CommonText(
                    text: "Customer Service",
                    textColor: CustomAppColor.of(context).txtBlack,
                    fontSize: 24.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  CommonText(
                    text: "Connecting....",
                    textColor: CustomAppColor.of(context).txtGray,
                    fontSize: 18.setFontSize,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.setHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                        ),
                        child: const Icon(
                          Icons.mic_off_rounded,
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "Mute",
                        fontSize: 12.setFontSize,
                      )
                    ],
                  ),
                  SizedBox(width: 24.setWidth),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                        ),
                        child: const Icon(
                          Icons.volume_off_rounded,
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "Mute",
                        fontSize: 12.setFontSize,
                      )
                    ],
                  ),
                  SizedBox(width: 24.setWidth),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).red,
                        ),
                        child: const Icon(
                          Icons.call_end_rounded,
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "End",
                        fontSize: 12.setFontSize,
                      )
                    ],
                  ),
                ],
              ),
            )
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
