import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';

class VideoCallScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const VideoCallScreen());
  }

  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
          backgroundColor: CustomAppColor.of(context).white,
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
                      color: CustomAppColor.of(context).icPrimary,
                      height: 40.setHeight,
                      width: 40.setWidth,
                    ),
                  ),
                ),
                const OutgoingCallView(),
                const Positioned(bottom: 0, left: 0, right: 0, child: BottomActionView())
              ],
            ),
          )),
    );
  }
}

class OutgoingCallView extends StatelessWidget {
  const OutgoingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 59.setHeight,
      right: 23.setWidth,
      child: SizedBox(
        height: 180.setHeight,
        width: 100.setWidth,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: Container(
                height: 140.setHeight,
                width: 100.setWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.imgBgIncomingVideoCall),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120.setHeight,
              right: 30.setWidth,
              child: Container(
                width: 36.setWidth,
                height: 36.setHeight,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: CustomAppColor.of(context).icPrimary, shape: BoxShape.circle),
                child: Image.asset(
                  AppAssets.icSwapCamera,
                  width: 16.setWidth,
                  height: 16.setHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomingCallView extends StatelessWidget {
  const IncomingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imgBgOutgoingVideoCall,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
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
                  Colors.black..withOpacityPercent(0.9),
                  Colors.black..withOpacityPercent(0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200.setHeight,
          left: 30.setWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Julie Young",
                textColor: CustomAppColor.of(context).white,
                fontWeight: FontWeight.w700,
                fontSize: 28.setFontSize,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "HR manager",
                textColor: CustomAppColor.of(context).white,
                fontWeight: FontWeight.w400,
                fontSize: 14.setFontSize,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 23.setHeight),
              Container(
                height: 32.setHeight,
                width: 70.setWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomAppColor.of(context).white..withOpacityPercent(0.3),
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
                  text: Languages.of(context).txtYourCallIsSecure,
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
