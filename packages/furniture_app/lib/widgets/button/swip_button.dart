import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:lottie/lottie.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class SwipeToNavigateButton extends StatefulWidget {
  final String text;
  final Widget destinationPage;

  const SwipeToNavigateButton({
    super.key,
    required this.text,
    required this.destinationPage,
  });

  @override
  SwipeToNavigateButtonState createState() => SwipeToNavigateButtonState();
}

class SwipeToNavigateButtonState extends State<SwipeToNavigateButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(6.0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSwipeComplete() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.destinationPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _controller.value += details.primaryDelta! / context.size!.width;
      },
      onHorizontalDragEnd: (details) {
        if (_controller.value > 0.2) {
          _controller.forward().then((_) => _onSwipeComplete()).then(
            (value) {
              _controller.reverse();
            },
          );
        } else {
          _controller.reverse();
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.24), borderRadius: const BorderRadius.all(Radius.circular(97))),
        child: AnimatedBuilder(
          animation: _slideAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: CommonText(
                      text: Languages.of(context).txtGetStarted,
                      textColor: CustomAppColor.of(context).white,
                      fontFamily: Constant.fontFamilyBold700,
                      fontSize: 18.setFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).primary,
                    ),
                    child: Transform.rotate(
                      angle: 3 * math.pi / 2,
                      child: Lottie.asset(
                        AppAssets.animArrow,
                        width: 50.setWidth,
                        height: 50.setHeight,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
