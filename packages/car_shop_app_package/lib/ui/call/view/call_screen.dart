import 'package:car_shop_app_package/localization/language/languages.dart';
import 'package:flutter/material.dart';
import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'dart:async';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Timer _timer;
  int _secondsElapsed = 1500; // 25 minutes = 1500 seconds
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes Minutes';
  }

  void _endCall() {
    _timer.cancel();
    Navigator.pop(context);
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  void _toggleSpeaker() {
    setState(() {
      _isSpeakerOn = !_isSpeakerOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Avatar with gradient background
                  Container(
                    width: 200.setWidth,
                    height: 200.setHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          CustomAppColor.of(context).primary2.withValues(alpha: 0.5),
                          CustomAppColor.of(context).primary2.withValues(alpha: 0.3),
                          CustomAppColor.of(context).primary2.withValues(alpha: 0.2),
                        ],
                        stops: const [0.3, 0.7, 1.0],
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer ring
                        Container(
                          width: 160.setWidth,
                          height: 160.setHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).primary2.withValues(alpha: 0.5),
                          ),
                        ),
                        // Inner ring
                        Container(
                          width: 120.setWidth,
                          height: 120.setHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: CustomAppColor.of(context).primaryGradient,
                          ),
                          child: Image.asset(AppAssets.icProfileFill, width: 50.setWidth, height: 50.setHeight),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.setHeight),

                  // Customer Service Title
                  CommonText(
                    text: Languages.of(context).txtCustomerService,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).primary,
                  ),

                  // Call Duration
                  CommonText(
                    text: _formatDuration(_secondsElapsed),
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ),

            // Call Control Buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.setWidth, vertical: 40.setHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // End Call Button
                  GestureDetector(
                    onTap: _endCall,
                    child: Container(
                      width: 60.setWidth,
                      height: 60.setHeight,
                      decoration: BoxDecoration(
                        color: CustomAppColor(context).red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: CustomAppColor(context).white,
                        size: 30.setWidth,
                      ),
                    ),
                  ),

                  // Mute Button
                  GestureDetector(
                    onTap: _toggleMute,
                    child: Container(
                      width: 60.setWidth,
                      height: 60.setHeight,
                      decoration: BoxDecoration(
                        color: _isMuted ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isMuted ? Icons.videocam_off_rounded : Icons.videocam_rounded,
                        color: CustomAppColor.of(context).white,
                        size: 30.setWidth,
                      ),
                    ),
                  ),

                  // Speaker Button
                  GestureDetector(
                    onTap: _toggleSpeaker,
                    child: Container(
                      width: 60.setWidth,
                      height: 60.setHeight,
                      decoration: BoxDecoration(
                        color: _isSpeakerOn ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                        color: CustomAppColor.of(context).white,
                        size: 30.setWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
