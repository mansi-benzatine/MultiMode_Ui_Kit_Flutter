import 'dart:ui';

import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class VideoCallScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const VideoCallScreen());
  }

  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppAssets.imgProfile1,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    CustomAppColor.of(context).black.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: 53.setHeight,
              left: 21.setWidth,
              child: IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.icBack,
                    height: 26.setHeight,
                    width: 26.setWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 130.setHeight,
              right: 20.setWidth,
              child: Container(
                width: 150.setWidth,
                height: 200.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.imgProfile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30.setHeight,
              left: 0.setWidth,
              right: 0.setWidth,
              child: const CallActionButtonsView(),
            ),
            Positioned(
              bottom: 130.setHeight,
              left: 21.setWidth,
              child: const CallDetailsView(),
            )
          ],
        ),
      ),
    );
  }
}

class CallActionButtonsView extends StatelessWidget {
  const CallActionButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.icVolume,
              width: 24,
              height: 24,
            ),
          ],
        ),
        SizedBox(width: 24.setWidth),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 74.setWidth,
                  height: 74.setHeight,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.icPhone,
              width: 55.setWidth,
              height: 60.setHeight,
            ),
          ],
        ),
        SizedBox(width: 24.setWidth),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 60.setWidth,
                  height: 60.setWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.icMicrophone,
              width: 30.setWidth,
              height: 24.setHeight,
            ),
          ],
        ),
      ],
    );
  }
}

class CallDetailsView extends StatelessWidget {
  const CallDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Rose ward",
          fontWeight: FontWeight.w700,
          fontSize: 20.setFontSize,
          textColor: CustomAppColor.of(context).white,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 8.setHeight),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CommonText(
            text: "00:21:45",
            fontWeight: FontWeight.w300,
            fontSize: 12.setFontSize,
            textColor: CustomAppColor.of(context).white,
          ),
        ),
      ],
    );
  }
}
