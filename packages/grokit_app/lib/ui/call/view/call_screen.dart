import 'package:flutter/material.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/text/common_text.dart';

class CallScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CallScreen());
  }

  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _topbar(),
            Padding(
              padding: EdgeInsets.only(bottom: 30.setHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).unselectedCard,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AppAssets.icMute,
                          width: 30.setWidth,
                          height: 30.setHeight,
                          color: CustomAppColor.of(context).icBlackWhite,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "Mute",
                        fontSize: 12.setFontSize,
                      )
                    ],
                  ),
                  SizedBox(width: 20.setWidth),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).unselectedCard,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AppAssets.icSpeaker,
                          width: 30.setWidth,
                          height: 30.setHeight,
                          color: CustomAppColor.of(context).icBlackWhite,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "Speaker",
                        fontSize: 12.setFontSize,
                      )
                    ],
                  ),
                  SizedBox(width: 20.setWidth),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).red,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AppAssets.icEndCall,
                          width: 30.setWidth,
                          height: 30.setHeight,
                          color: CustomAppColor.of(context).icBlackWhite,
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

  _topbar() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: 220.setHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [CustomAppColor.of(context).topbarGradiant, CustomAppColor.of(context).bgScreen],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 60.setHeight,
            left: 20.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: CustomAppColor.of(context).icBlackWhite,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(height: 25.setHeight),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.imgDummyProfile,
                      height: 48.setHeight,
                      width: 48.setWidth,
                    ),
                    SizedBox(width: 15.setWidth),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Roman Nick",
                          fontSize: 24.setFontSize,
                          fontFamily: Constant.fontFamilyBold700,
                        ),
                        CommonText(
                          text: "Connecting...",
                          fontSize: 18.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
