import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class PauseRunTrackerScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => PauseRunTrackerScreen());
  }

  const PauseRunTrackerScreen({super.key});

  @override
  State<PauseRunTrackerScreen> createState() => _PauseRunTrackerScreenState();
}

class _PauseRunTrackerScreenState extends State<PauseRunTrackerScreen>
    implements TopBarClickListener {
  bool _showPauseOverlay = false;
  bool _showUnlockOverlay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox.expand(
                child: Image.asset(AppAssets.imgMap, fit: BoxFit.cover),
              ),
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(
                        this,
                        iconColor: CustomAppColor.of(context).white,
                        appbarColor: CustomAppColor.of(context).transparent,
                        isShowSimpleTitle: true,
                        isShowBack: true,
                        simpleTitle: Languages.of(
                          context,
                        ).txtRunTracker.toUpperCase(),
                        textColor: CustomAppColor.of(context).white,
                        isShowFilter: true,
                      ),
                      SizedBox(height: 12.setHeight),
                      Center(
                        child: Text(
                          "10:50:25",
                          style: TextStyle(
                            color: CustomAppColor.of(context).white,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.w400,
                            fontSize: 60.setFontSize,
                          ),
                        ),
                      ),
                      Center(
                        child: CommonText(
                          text: "MIN",
                          textColor: CustomAppColor.of(context).black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStat("10:65", "KM"),
                          _buildStat("45:30", "PACE(MIN/KM)"),
                          _buildStat("88:23", "KCAL"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.setWidth,
                    vertical: 20.setHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Image.asset(
                        AppAssets.icGPS,
                        width: 32.setWidth,
                        height: 32.setHeight,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.setWidth,
                    bottom: 20.setHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Image.asset(
                        AppAssets.icNetwork,
                        width: 30.setWidth,
                        height: 30.setHeight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).primary,
                        ),
                        child: Image.asset(
                          AppAssets.icLocation,
                          width: 30.setWidth,
                          height: 30.setHeight,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showPauseOverlay = true;
                            _showUnlockOverlay = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.setHeight,
                            horizontal: 16.setWidth,
                          ),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).primary,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CommonText(
                                text: Languages.of(
                                  context,
                                ).txtPause.toUpperCase(),
                                fontWeight: FontWeight.w900,
                                fontSize: 18.setFontSize,
                                textColor: CustomAppColor.of(context).white,
                              ),
                              SizedBox(width: 10.setWidth),
                              Image.asset(
                                AppAssets.icPause,
                                color: CustomAppColor.of(context).white,
                                height: 30.setHeight,
                                width: 30.setWidth,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showUnlockOverlay = true;
                            _showPauseOverlay = false;
                          });
                        },

                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).black,
                          ),
                          child: Image.asset(
                            AppAssets.icLock,
                            width: 30.setWidth,
                            height: 30.setHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_showPauseOverlay)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPauseOverlay = false;
                    });
                  },
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.black.withValues(alpha: 0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _showPauseOverlay = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.icRestart,
                                  width: 18.setWidth,
                                  height: 18.setHeight,
                                ),
                                SizedBox(width: 2.setWidth),

                                CommonText(
                                  text: Languages.of(
                                    context,
                                  ).txtRestart.toUpperCase(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.setHeight),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showPauseOverlay = false;
                                        showFinishTrainingDialog(context);
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Icon(
                                        Icons.stop,
                                        color: CustomAppColor.of(context).white,
                                        size: 30.setWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),

                                  CommonText(
                                    text: Languages.of(
                                      context,
                                    ).txtStop.toUpperCase(),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.setFontSize,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                              SizedBox(width: 60.setWidth),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showPauseOverlay = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: CustomAppColor.of(context).white,
                                        size: 30.setWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(
                                      context,
                                    ).txtResume.toUpperCase(),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.setFontSize,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30.setHeight),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            if (_showUnlockOverlay)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showUnlockOverlay = false;
                    });
                  },
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.black.withValues(alpha: 0.7),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 45.setHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(30.setHeight),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).primary,
                              ),
                              child: Icon(
                                Icons.lock,
                                color: CustomAppColor.of(context).white,
                                size: 30.setWidth,
                              ),
                            ),
                            SizedBox(height: 10.setHeight),
                            CommonText(
                              textColor: CustomAppColor.of(context).white,
                              text: Languages.of(context).txtLongPressToUnlock,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  _showUnlockOverlay = false;
                                });
                              },
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        CommonText(
          text: value,
          textColor: CustomAppColor.of(context).white,
          fontWeight: FontWeight.w400,
          fontSize: 32.setFontSize,
        ),
        CommonText(
          text: label,
          textColor: CustomAppColor.of(context).black,
          fontWeight: FontWeight.w500,
          fontSize: 14.setFontSize,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  void showFinishTrainingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: CustomAppColor.of(context).white,

          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20.setWidth,
              vertical: 26.setHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.imgFinish,
                  height: 181.setHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: Languages.of(context).txtFinishTraining.toUpperCase(),
                  fontWeight: FontWeight.w900,
                  fontSize: 20.setFontSize,
                  textColor: CustomAppColor.of(context).black,
                ),
                SizedBox(height: 24.setHeight),
                CommonButton(
                  text: Languages.of(context).txtFinish.toUpperCase(),
                  onTap: () {
                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                      // Navigator.push(context, WellDoneScreen.route());
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
