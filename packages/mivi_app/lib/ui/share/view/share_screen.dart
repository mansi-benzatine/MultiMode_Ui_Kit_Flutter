import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/button/common_button.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

class ShareScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ShareScreen());
  }

  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.imgChooseImage1),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.8), BlendMode.darken),
              ),
            ),
          ),
          Positioned(
              left: 20.setWidth,
              top: 50.setHeight,
              child: Row(
                children: [
                  GestureDetector(
                    child: Image.asset(
                      AppAssets.icBack,
                      height: 22.setHeight,
                      width: 22.setWidth,
                      color: CustomAppColor.of(context).white,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 15.setWidth),
                  CommonText(
                    text: "Share",
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: CustomAppColor.of(context).white,
                  )
                ],
              )),
          Positioned(
              left: 20.setWidth,
              top: 0.setHeight,
              bottom: 90.setHeight,
              right: 20.setWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      AppAssets.imgChooseImage1,
                      height: 450.setHeight,
                    ),
                  ),
                  Image.asset(
                    AppAssets.icPlay,
                    width: 22.setWidth,
                    height: 22.setHeight,
                  )
                ],
              )),
          Positioned(
              left: 24.setWidth,
              bottom: 80.setHeight,
              right: 24.setWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            AppAssets.icFacebook,
                            height: 36.setHeight,
                            width: 36.setWidth,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: "Facebook",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).white,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            AppAssets.icInstagram,
                            height: 36.setHeight,
                            width: 36.setWidth,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: "Instagram",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).white,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            AppAssets.icYoutube,
                            height: 36.setHeight,
                            width: 36.setWidth,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: "Youtube",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).white,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            AppAssets.icTwitter,
                            height: 36.setHeight,
                            width: 36.setWidth,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: "Twitter",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).white,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonButton(
                    text: "Done",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )),
        ],
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
