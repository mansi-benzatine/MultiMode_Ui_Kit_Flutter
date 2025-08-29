import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class VoiceCallScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const VoiceCallScreen());
  }

  const VoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
          backgroundColor: CustomAppColor.of(context).bgContainerPrimary,
          body: IgnorePointer(
            ignoring: true,
            child: Stack(
              children: [
                const IncomingCallView(),
                Positioned(
                  top: 59.setHeight,
                  left: 23.setWidth,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
                        AppAssets.icCloseSquare,
                        width: 40.setWidth,
                        height: 40.setHeight,
                      )),
                ),
                const Positioned(bottom: 0, left: 0, right: 0, child: BottomActionView())
              ],
            ),
          )),
    );
  }
}

class IncomingCallView extends StatelessWidget {
  const IncomingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 400.setHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacityPercent(0.9),
                  Colors.black.withOpacityPercent(0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 300.setHeight,
          left: 0.setWidth,
          right: 0.setWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                child: Image.asset(
                  AppAssets.imgAvatarMessage3,
                  width: 200.setWidth,
                  height: 200.setHeight,
                ),
              ),
              SizedBox(height: 23.setHeight),
              CommonText(
                text: "Julie Young",
                textColor: CustomAppColor.of(context).white,
                fontWeight: FontWeight.w700,
                fontSize: 28.setFontSize,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "HR manager",
                textColor: CustomAppColor.of(context).white,
                fontWeight: FontWeight.w400,
                fontSize: 14.setFontSize,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 23.setHeight),
              Container(
                height: 32.setHeight,
                width: 70.setWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomAppColor.of(context).white.withOpacityPercent(0.3),
                ),
                child: CommonText(
                  text: "00:21:45",
                  textColor: CustomAppColor.of(context).white,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BottomActionView extends StatelessWidget {
  const BottomActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.setHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 120.setHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.imgBgBottomCallAction),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRoundButton(AppAssets.icRecording, CustomAppColor.of(context).white),
                CommonText(
                  text: "Your call is secure",
                  fontWeight: FontWeight.w500,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                _buildRoundButton(AppAssets.icVideoCall, CustomAppColor.of(context).white),
              ],
            ),
          ),
          Positioned(
            bottom: 80.setHeight,
            left: 0.setWidth,
            right: 0.setWidth,
            child: Image.asset(
              AppAssets.icEndCall,
              height: 74.setHeight,
              width: 74.setWidth,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRoundButton(String icon, Color? color) {
  return GestureDetector(
    child: Container(
      width: 56.setWidth,
      height: 56.setHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        icon,
        width: 30.setWidth,
        height: 30.setHeight,
      ),
    ),
  );
}
