import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:video_player/video_player.dart';

import '../../../dialogs/alerts/completed_dialog.dart';
import '../../../dialogs/alerts/mood_dialog.dart';
import '../../../dialogs/alerts/review_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class DoYogaScreen extends StatefulWidget {
  final int isVideoSelected;

  const DoYogaScreen({super.key, required this.isVideoSelected});

  static Route<dynamic> route({int isVideoSelected = 0}) {
    return MaterialPageRoute(
      builder: (context) => DoYogaScreen(isVideoSelected: isVideoSelected),
    );
  }

  @override
  State<DoYogaScreen> createState() => _DoYogaScreenState();
}

class _DoYogaScreenState extends State<DoYogaScreen> implements TopBarClickListener {
  late VideoPlayerController videoController;

  ValueNotifier<int> isVideoSelected = ValueNotifier(0);
  ValueNotifier<bool> isPlay = ValueNotifier(true);
  ValueNotifier<bool> isFullScreen = ValueNotifier(false);
  ValueNotifier<bool> isWaiting = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isVideoSelected.value = widget.isVideoSelected;
    videoController = VideoPlayerController.asset(AppAssets.videoYoga)
      ..initialize().then((_) {
        videoController.setLooping(true);
        if (isVideoSelected.value == 0) {
          videoController.play();
        }
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
                title: "Full Body Yoga",
                isShowVolume: true,
              ),
              _tabBar(),
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

  _tabBar() {
    return ValueListenableBuilder(
      valueListenable: isVideoSelected,
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, bottom: 10.setHeight),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isVideoSelected.value = 0;
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (videoController.value.isInitialized && !videoController.value.isPlaying && isPlay.value) {
                        videoController.play();
                      }
                    });
                  },
                  child: AnimatedBuilder(
                    animation: isVideoSelected,
                    builder: (context, child) {
                      bool isSelected = isVideoSelected.value == 0;
                      return Container(
                        height: 48.setHeight,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtVideo,
                            style: TextStyle(
                              fontSize: 14.setFontSize,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                              color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: GestureDetector(
                  onTap: () => isVideoSelected.value = 1,
                  child: AnimatedBuilder(
                    animation: isVideoSelected,
                    builder: (context, child) {
                      bool isSelected = isVideoSelected.value == 1;
                      return Container(
                        height: 48.setHeight,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtAnimation,
                            style: TextStyle(
                              fontSize: 14.setFontSize,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                              color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _videoOrAnimationView() {
    return ValueListenableBuilder(
      valueListenable: isVideoSelected,
      builder: (context, isVideoSelectedValue, child) {
        if (isVideoSelectedValue == 0) {
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
                          width: isFullScreenValue ? 0.screenWidth : 0.screenWidth / 1.5,
                          height: isFullScreenValue ? 0.screenHeight : 0.screenHeight / 2.2,
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
        return ValueListenableBuilder(
          valueListenable: isFullScreen,
          builder: (context, isFullScreenValue, child) {
            return UnconstrainedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isFullScreenValue ? 0 : 18),
                child: Image.asset(
                  AppAssets.imgDummyAnimation1,
                  fit: BoxFit.contain,
                  gaplessPlayback: true,
                  width: isFullScreenValue ? 0.screenWidth : 0.screenWidth / 1.5,
                  height: isFullScreenValue ? 0.screenHeight : 0.screenHeight / 2.2,
                ),
              ),
            );
          },
        );
      },
    );
  }

  _videoControllerView() {
    return ValueListenableBuilder(
      valueListenable: isWaiting,
      builder: (context, isWaitingValue, child) {
        return Column(
          children: [
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "${Languages.of(context).txtStep} 6/12",
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamilySemiBold600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            if (isWaitingValue) ...[
              CommonText(
                text: "02:15",
                fontSize: 40.setFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constant.fontFamilySemiBold600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              CommonButton(
                text: Languages.of(context).txtResume,
                onTap: () {
                  isWaiting.value = false;
                  isPlay.value = true;
                  videoController.play();
                },
                buttonColor: CustomAppColor.of(context).primary,
                borderColor: CustomAppColor.of(context).borderColor,
                borderWidth: 4,
                radius: 18,
                mLeft: 25.setWidth,
                mRight: 25.setWidth,
                mBottom: 10.setHeight,
                mTop: 10.setHeight,
              ),
              CommonButton(
                text: Languages.of(context).txtRestart,
                onTap: () {
                  CompletedDialog.show(context, onTap: () {
                    MoodDialog.show(context, onTap: () {
                      ReviewDialog.show(context, onTap: () {});
                    });
                  });
                },
                buttonColor: CustomAppColor.of(context).bgScreen,
                borderColor: CustomAppColor.of(context).txtBlack,
                buttonTextColor: CustomAppColor.of(context).txtBlack,
                buttonFontFamily: Constant.fontFamilySemiBold600,
                buttonTextWeight: FontWeight.w600,
                borderWidth: 1,
                radius: 18,
                mLeft: 25.setWidth,
                mRight: 25.setWidth,
              ),
            ],
            if (!isWaitingValue) ...[
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
                    onTap: () {
                      isWaiting.value = true;
                      isPlay.value = false;
                      isFullScreen.value = false;
                      videoController.pause();
                    },
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
                    onTap: () {
                      isWaiting.value = true;
                      isPlay.value = false;
                      isFullScreen.value = false;
                      videoController.pause();
                    },
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
            ],
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.setHeight),
          ],
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
