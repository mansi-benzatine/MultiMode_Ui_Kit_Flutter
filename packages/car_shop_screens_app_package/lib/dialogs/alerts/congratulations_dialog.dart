import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';

class CongratulationsDialog extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback? onComplete;
  final Duration redirectDuration;
  final Color primaryColor;

  const CongratulationsDialog({
    super.key,
    this.title = "CONGRATULATIONS!",
    this.message = "Your account is ready to use. You will be redirected to the home page in a few second.",
    this.onComplete,
    this.redirectDuration = const Duration(seconds: 5),
    this.primaryColor = const Color(0xFF4A90E2),
  });

  @override
  State<CongratulationsDialog> createState() => _CongratulationsDialogState();
}

class _CongratulationsDialogState extends State<CongratulationsDialog> with TickerProviderStateMixin {
  late AnimationController _checkmarkController;
  late AnimationController _progressController;
  late AnimationController _scaleController;

  late Animation<double> _checkmarkAnimation;
  late Animation<double> _scaleAnimation;

  Timer? _redirectTimer;
  int _remainingSeconds = 5;

  @override
  void initState() {
    super.initState();

    _checkmarkController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: widget.redirectDuration,
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _checkmarkAnimation = CurvedAnimation(
      parent: _checkmarkController,
      curve: Curves.elasticOut,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    );

    _startAnimations();
  }

  void _startAnimations() {
    // Start scale animation immediately
    _scaleController.forward();

    // Start checkmark animation after 200ms
    Timer(const Duration(milliseconds: 200), () {
      _checkmarkController.forward();
    });

    // Start progress animation after 500ms
    Timer(const Duration(milliseconds: 500), () {
      _progressController.forward();
      _startTimer();
    });
  }

  void _startTimer() {
    _remainingSeconds = widget.redirectDuration.inSeconds;
    _redirectTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
      });

      if (_remainingSeconds <= 0) {
        timer.cancel();
        if (widget.onComplete != null) {
          Navigator.of(context).pop();
          widget.onComplete!();
        }
      }
    });
  }

  @override
  void dispose() {
    _checkmarkController.dispose();
    _progressController.dispose();
    _scaleController.dispose();
    _redirectTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Main dialog with notch
              Container(
                margin: EdgeInsets.only(top: 40.setHeight),
                child: ClipPath(
                  clipper: NotchClipper(notchRadius: 90), // Increased to match circle size
                  child: Container(
                    width: 320.setWidth,
                    padding: EdgeInsets.fromLTRB(16.setWidth, 60.setHeight, 16.setWidth, 20.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgBottomSheet,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        CommonText(
                          text: widget.title,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 25.setHeight),

                        // Message
                        CommonText(
                          text: widget.message,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 25.setHeight),

                        // Progress indicator

                        SizedBox(
                          width: 60.setWidth,
                          height: 60.setHeight,
                          child: CircularPercentIndicator(
                            radius: 30.0,
                            lineWidth: 5.setWidth,
                            animation: true,
                            percent: 1,
                            animationDuration: 2000,
                            backgroundWidth: 1.setWidth,
                            backgroundColor: CustomAppColor.of(context).txtGray,
                            center: CommonText(
                              text: "85.0%",
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtSeeAll,
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient: CustomAppColor.of(context).primaryGradient,
                            onAnimationEnd: () {
                              if (widget.onComplete != null) {
                                widget.onComplete!();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Checkmark circle positioned in the notch with gradient
              Positioned(
                top: 0, // Adjust to sit properly in the deep notch
                child: AnimatedBuilder(
                  animation: _checkmarkAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _checkmarkAnimation.value,
                      child: Container(
                        width: 72.setWidth,
                        height: 72.setHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: CustomAppColor.of(context).primaryGradient,
                          border: Border.all(
                            color: CustomAppColor.of(context).white,
                            width: 2.setWidth, // Thicker white border
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: CustomAppColor.of(context).white,
                          size: 30.setHeight,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom clipper to create the perfect semicircular notch
class NotchClipper extends CustomClipper<Path> {
  final double notchRadius;

  NotchClipper({required this.notchRadius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    double centerX = size.width / 2;
    double circleRadius = notchRadius / 2; // Radius of the circle that will sit in the notch
    double cornerRadius = 25.0;

    // Start from top-left corner with rounded corner
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Draw to the start of the notch (left side)
    path.lineTo(centerX - circleRadius, 0);

    // Create the perfect semicircular notch
    // The notch goes down from the top edge to accommodate half the circle
    path.arcToPoint(
      Offset(centerX + circleRadius, 0),
      radius: Radius.circular(circleRadius),
      clockwise: false, // This creates the downward curve
    );

    // Continue to top-right corner with rounded corner
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Complete the rectangle with rounded corners
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height);
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
