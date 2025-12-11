import 'dart:async';

import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../home/datamodel/home_data.dart';

class FullscreenScreen extends StatefulWidget {
  final Movie movie;

  static Route<void> route({required Movie movie}) {
    return MaterialPageRoute(
        builder: (_) => FullscreenScreen(
              movie: movie,
            ));
  }

  const FullscreenScreen({super.key, required this.movie});

  @override
  State<FullscreenScreen> createState() => _FullscreenScreenState();
}

class _FullscreenScreenState extends State<FullscreenScreen> {
  bool _showControls = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _startHideTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    _hideTimer?.cancel();
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(minutes: 10), () {
      setState(() => _showControls = false);
    });
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
    if (_showControls) _startHideTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _toggleControls,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.movie.image,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedOpacity(
              opacity: _showControls ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: EdgeInsets.only(top: 40.setHeight, left: 20.setWidth, right: 20.setWidth),
                child: Row(
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: widget.movie.title,
                      textColor: Colors.white,
                      fontSize: 8.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _showControls ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _roundBtn(AppAssets.icSkipBack),
                    SizedBox(width: 40.setWidth),
                    Icon(
                      Icons.play_arrow_rounded,
                      size: 30.setWidth,
                      color: CustomAppColor.of(context).white,
                    ),
                    SizedBox(width: 40.setWidth),
                    _roundBtn(AppAssets.icSkipForward),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _showControls ? 1 : 0,
              duration: const Duration(milliseconds: 900),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 20.setHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Slider(
                        value: 20,
                        max: 100,
                        activeColor: CustomAppColor.of(context).primary,
                        padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 10.setHeight),
                        onChanged: (v) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _bottomMenu(AppAssets.icGauge, "Speed"),
                          _bottomMenu(AppAssets.icLock, "Sperre"),
                          _bottomMenu(AppAssets.icEpisode, "Episodes"),
                          _bottomMenu(AppAssets.icMsg, "Subtitle"),
                          _bottomMenu(AppAssets.icNext, "Next Episode"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _roundBtn(String icon) {
    return Image.asset(icon, width: 14.setWidth);
  }

  Widget _bottomMenu(String icon, String text) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: Colors.white,
          width: 9.setWidth,
        ),
        SizedBox(width: 4.setWidth),
        CommonText(
          text: text,
          textColor: Colors.white,
          fontSize: 5.setFontSize,
        ),
      ],
    );
  }
}
