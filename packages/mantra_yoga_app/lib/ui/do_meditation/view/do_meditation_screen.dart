import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:video_player/video_player.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';

import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class DoMeditationScreen extends StatefulWidget {
  const DoMeditationScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const DoMeditationScreen());
  }

  @override
  State<DoMeditationScreen> createState() => _DoMeditationScreenState();
}

class _DoMeditationScreenState extends State<DoMeditationScreen> implements TopBarClickListener {
  late VideoPlayerController videoController;

  ValueNotifier<bool> isPlay = ValueNotifier(true);
  ValueNotifier<bool> isFullScreen = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.asset(AppAssets.videoMeditation)
      ..initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
      });
  }

  @override
  void deactivate() {
    videoController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: isFullScreen,
            builder: (context, value, child) {
              if (value) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: _videoOrAnimationView(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Column(
            children: [
              TopBar(
                this,
                title: "Meditation",
                isShowVolume: true,
              ),
              ValueListenableBuilder(
                valueListenable: isFullScreen,
                builder: (context, value, child) {
                  return Expanded(
                    child: value ? const SizedBox.shrink() : _videoOrAnimationView(),
                  );
                },
              ),
              _videoControllerView(),
            ],
          ),
        ],
      ),
    );
  }

  _videoOrAnimationView() {
    return ValueListenableBuilder(
      valueListenable: isFullScreen,
      builder: (context, isFullScreenValue, child) {
        return FutureBuilder(
          future: videoController.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return UnconstrainedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isFullScreenValue ? 0 : 18),
                  child: SizedBox(
                    width: isFullScreenValue ? 0.screenWidth : 0.screenWidth / 1.2,
                    height: isFullScreenValue ? 0.screenHeight : 0.screenHeight / 1.8,
                    child: VideoPlayer(videoController),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  _videoControllerView() {
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            SizedBox(width: 15.setWidth),
            CommonText(
              text: "15:00",
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: AnimatedProgressBar(
                color: CustomAppColor.of(context).primary,
                backgroundColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                duration: const Duration(microseconds: 300),
                width: 0.screenWidth,
                height: 6.setHeight,
                value: 0.5,
              ),
            ),
            SizedBox(width: 10.setWidth),
            CommonText(
              text: "30:00",
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(width: 15.setWidth),
          ],
        ),
        SizedBox(height: 15.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 50.setWidth),
            Image.asset(
              AppAssets.icBackward,
              height: 24.setHeight,
              width: 24.setHeight,
              gaplessPlayback: true,
              color: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(width: 10.setWidth),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45.setHeight,
                width: 45.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).containerFillBgScreenAndBlack,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.setWidth),
                child: Image.asset(
                  AppAssets.icPrevious,
                  gaplessPlayback: true,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ),
            ),
            SizedBox(width: 10.setWidth),
            ValueListenableBuilder(
              valueListenable: isPlay,
              builder: (context, value, child) {
                return InkWell(
                  splashColor: CustomAppColor.of(context).transparent,
                  highlightColor: CustomAppColor.of(context).transparent,
                  onTap: () {
                    isPlay.value = !isPlay.value;
                    if (isPlay.value) {
                      videoController.play();
                    } else {
                      videoController.pause();
                    }
                  },
                  child: Image.asset(
                    value ? AppAssets.icPause : AppAssets.icPlay,
                    height: 60.setHeight,
                    width: 60.setHeight,
                    gaplessPlayback: true,
                  ),
                );
              },
            ),
            SizedBox(width: 10.setWidth),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45.setHeight,
                width: 45.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).containerFillBgScreenAndBlack,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.setWidth),
                child: Image.asset(
                  AppAssets.icNext,
                  gaplessPlayback: true,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ),
            ),
            SizedBox(width: 10.setWidth),
            ValueListenableBuilder(
              valueListenable: isFullScreen,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    isFullScreen.value = !isFullScreen.value;
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (videoController.value.isInitialized && !videoController.value.isPlaying && isPlay.value) {
                        videoController.play();
                      }
                    });
                  },
                  splashColor: CustomAppColor.of(context).transparent,
                  highlightColor: CustomAppColor.of(context).transparent,
                  child: Image.asset(
                    value ? AppAssets.icMinimize : AppAssets.icMaximize,
                    height: 24.setHeight,
                    width: 24.setHeight,
                    gaplessPlayback: true,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                );
              },
            ),
            SizedBox(width: 50.setWidth),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 10.setHeight),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
