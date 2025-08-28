import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/ui/expanded_map/views/expand_map_screen.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/constant.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';

class StartRunningDetailsScreen extends StatefulWidget {
  final bool isLockShown;
  final bool isRestartStopResumeShown;
  final bool isFinishRunTrackingShown;
  static Route<void> route({bool isLockShown = false, bool isRestartStopResumeShown = false, bool isFinishRunTrackingShown = false}) {
    return MaterialPageRoute(
      builder: (_) => StartRunningDetailsScreen(isLockShown: isLockShown, isRestartStopResumeShown: isRestartStopResumeShown, isFinishRunTrackingShown: isFinishRunTrackingShown),
    );
  }

  const StartRunningDetailsScreen({super.key, this.isLockShown = false, this.isRestartStopResumeShown = false, this.isFinishRunTrackingShown = false});

  @override
  State<StartRunningDetailsScreen> createState() => _StartRunningDetailsScreenState();
}

class _StartRunningDetailsScreenState extends State<StartRunningDetailsScreen> implements TopBarClickListener {
  bool _showOverlay = false;
  bool _showOverlayLock = false;
  bool _isLocked = false;
  bool _isBottomSheetOpen = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  void _toggleOverlayLock() {
    setState(() {
      _showOverlay = false;
      _showOverlayLock = true;
    });
  }

  void showFinishBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      enableDrag: false,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      scrollControlDisabledMaxHeightRatio: 0.6,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.setHeight,
                      width: 50.setWidth,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFBDBDBD)),
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                Image.asset(AppAssets.imgFinish, width: 310.setWidth, height: 260.setHeight),
                CommonText(text: Languages.of(context).txtFinishDesc, fontWeight: FontWeight.w700, fontSize: 16.setFontSize, textAlign: TextAlign.center),
                SizedBox(height: 35.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 62.setWidth),
                    child: CommonButton(
                      text: Languages.of(context).txtFinish.toUpperCase(),
                      radius: 30,
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).txtWhite,
                      buttonColor: CustomAppColor.of(context).primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isLockShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _toggleOverlayLock();
      });
    }
    if (widget.isRestartStopResumeShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _toggleOverlay();
      });
    }
    if (widget.isFinishRunTrackingShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showFinishBS();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                TopBar(this, isShowBack: true, isShowSimpleTitle: true, simpleTitle: Languages.of(context).txtAppName.toUpperCase()),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 5.setHeight),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(AppAssets.imgMap1, height: 395.setHeight, width: 331.setWidth, fit: BoxFit.fill),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                                      padding: EdgeInsets.all(12),
                                      child: Image.asset(AppAssets.icGps, height: 24.setHeight, width: 24.setWidth, color: CustomAppColor.of(context).primary),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                                            padding: EdgeInsets.all(12),
                                            child: Image.asset(AppAssets.icSatellite, height: 24.setHeight, width: 24.setWidth, color: CustomAppColor.of(context).primary),
                                          ),
                                          SizedBox(height: 5.setHeight),
                                          Container(
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                                            padding: EdgeInsets.all(12),
                                            child: Image.asset(AppAssets.icLocation, height: 24.setHeight, width: 24.setWidth, color: CustomAppColor.of(context).primary),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 22.setWidth, right: 22.setWidth, bottom: 10.setHeight, top: 5.setHeight),
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).lime,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                ),
                                child: Column(
                                  children: [
                                    CommonText(text: "00:56:20", fontSize: 40.setFontSize, textColor: CustomAppColor.of(context).black, fontWeight: FontWeight.w400),
                                    SizedBox(height: 5.setHeight),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            CommonText(text: "15:50", fontSize: 28.setFontSize, textColor: CustomAppColor.of(context).black),
                                            CommonText(text: Languages.of(context).txtKm, fontSize: 12.setFontSize, textColor: CustomAppColor.of(context).black),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CommonText(text: "46:57", fontSize: 28.setFontSize, textColor: CustomAppColor.of(context).black),
                                            CommonText(text: Languages.of(context).txtPaceMinKm.toUpperCase(), fontSize: 12.setFontSize, textColor: CustomAppColor.of(context).black),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CommonText(text: "88:80", fontSize: 28.setFontSize, textColor: CustomAppColor.of(context).black),
                                            CommonText(text: Languages.of(context).txtKcal.toUpperCase(), fontSize: 12.setFontSize, textColor: CustomAppColor.of(context).black),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.setHeight),
                                    IgnorePointer(
                                      ignoring: true,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.push(context, ExpandMapScreen.route()),
                                            child: Container(
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                                              padding: EdgeInsets.all(10),
                                              child: Image.asset(AppAssets.icExpand, height: 24.setHeight, width: 24.setWidth, color: CustomAppColor.of(context).primary),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _toggleOverlayLock,
                                            child: Container(
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                                              padding: EdgeInsets.all(10),
                                              child: Image.asset(AppAssets.icLock, height: 24.setHeight, width: 24.setWidth, color: CustomAppColor.of(context).primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.setHeight),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).bgScaffold,
                                  border: Border.all(color: CustomAppColor.of(context).bgScaffold, width: 10),
                                ),
                                child: GestureDetector(
                                  onTap: _toggleOverlay,
                                  child: Image.asset(AppAssets.icPause, width: 100.setWidth, height: 100.setHeight, color: CustomAppColor.of(context).primary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_showOverlay) _buildOverlay(context),
            if (_showOverlayLock) _buildOverlayLock(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withValues(alpha: 0.85),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _overlayButton(
                icon: AppAssets.icUndo,
                label: Languages.of(context).txtRestart.toUpperCase(),
                color: CustomAppColor.of(context).primary,
                onTap: () {
                  _toggleOverlay();
                },
              ),
              SizedBox(height: 20),
              _overlayButton(
                icon: AppAssets.icResume,
                label: Languages.of(context).txtResume.toUpperCase(),
                color: Color(0xFFC1E241),
                onTap: () {
                  _toggleOverlay();
                },
              ),
              SizedBox(height: 20),
              _overlayButton(
                icon: AppAssets.icStop,
                label: Languages.of(context).txtStop.toUpperCase(),
                color: Colors.red,
                onTap: () {
                  _showDeleteBottomSheet();
                  _toggleOverlay();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayLock(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.85),
        alignment: Alignment.center,
        child: SwipeButton(
          isLocked: _isLocked,
          onSwipeComplete: () {
            setState(() {
              _isLocked = !_isLocked;
              if (!_isLocked) {
                _showOverlayLock = false;
                _showOverlay = false;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _overlayButton({required String icon, required String label, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.setWidth,
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 5.setHeight),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgScaffold),
                child: Image.asset(icon, height: 18.setHeight, width: 18.setWidth),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              flex: 5,
              child: CommonText(text: label, overflow: TextOverflow.ellipsis, textColor: CustomAppColor.of(context).txtWhite, fontWeight: FontWeight.bold, fontSize: 18.setFontSize),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      scrollControlDisabledMaxHeightRatio: 0.6,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.setHeight,
                      width: 50.setWidth,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFBDBDBD)),
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                Image.asset(AppAssets.imgFinish, width: 310.setWidth, height: 260.setHeight),
                CommonText(text: Languages.of(context).txtFinishDesc, fontWeight: FontWeight.w700, fontSize: 16.setFontSize, textAlign: TextAlign.center),
                SizedBox(height: 35.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 62.setWidth),
                  child: CommonButton(
                    text: Languages.of(context).txtFinish.toUpperCase(),
                    radius: 30,
                    onTap: () => Navigator.pop(context),
                    buttonTextColor: CustomAppColor.of(context).txtWhite,
                    buttonColor: CustomAppColor.of(context).primary,
                  ),
                ),
              ],
            ),
          ),
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

class SwipeButton extends StatefulWidget {
  final bool isLocked;
  final VoidCallback onSwipeComplete;

  const SwipeButton({super.key, required this.isLocked, required this.onSwipeComplete});

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double _dragPosition = 0.0;
  final double _maxDragDistance = 100.0;

  @override
  void didUpdateWidget(covariant SwipeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLocked != widget.isLocked) {
      _dragPosition = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLocked = widget.isLocked;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 130.setWidth,
          height: 55.setHeight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: isLocked ? CustomAppColor.of(context).primary : CustomAppColor.of(context).icGrey, borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Positioned(
                left: isLocked ? null : _dragPosition,
                right: isLocked ? _dragPosition : null,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _dragPosition += isLocked ? -details.delta.dx : details.delta.dx;
                      _dragPosition = _dragPosition.clamp(0.0, _maxDragDistance);
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_dragPosition >= _maxDragDistance * 0.8) {
                      widget.onSwipeComplete();
                    } else {
                      setState(() {
                        _dragPosition = 0.0;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(color: CustomAppColor.of(context).bgScaffold, shape: BoxShape.circle),
                    child: Image.asset(isLocked ? AppAssets.icLock : AppAssets.icLockOpen, height: 20.setHeight, width: 20.setWidth, color: CustomAppColor.of(context).primary),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        CommonText(text: isLocked ? Languages.of(context).txtSwipeLeftToUnlock.toUpperCase() : Languages.of(context).txtSwipeRightToLock.toUpperCase(), textColor: Colors.white, fontWeight: FontWeight.bold),
      ],
    );
  }
}
