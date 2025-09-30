import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musify_app_package/widgets/button/common_button.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../localization/language/languages.dart';
import '../../ui/login/view/login_screen.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> with TickerProviderStateMixin {
  late AnimationController _checkmarkController;

  late AnimationController _scaleController;

  late Animation<double> _checkmarkAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _checkmarkController = AnimationController(
      duration: const Duration(milliseconds: 600),
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
  }

  @override
  void dispose() {
    _checkmarkController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                clipper: NotchClipper(notchRadius: 100), // Increased to match circle size
                child: Container(
                  width: 320.setWidth,
                  padding: EdgeInsets.fromLTRB(16.setWidth, 60.setHeight, 16.setWidth, 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).txtWhite,
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
                        text: Languages.of(context).txtLogout,
                        fontSize: 20.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtRed,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10.setHeight),
                      Divider(
                        color: CustomAppColor.of(context).txtGray,
                        thickness: 1,
                      ),
                      SizedBox(height: 10.setHeight),

                      // Message
                      CommonText(
                        text: Languages.of(context).txtAreYouSureYouWantToLogout,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDarkGray,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 25.setHeight),

                      Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              height: 40.setHeight,
                              text: Languages.of(context).txtCancel,
                              buttonTextColor: CustomAppColor.of(context).txtGray,
                              buttonTextWeight: FontWeight.w600,
                              buttonTextSize: 12.setFontSize,
                              borderColor: CustomAppColor.of(context).txtGray,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: CommonButton(
                              height: 40.setHeight,
                              text: Languages.of(context).txtLogout,
                              buttonTextColor: CustomAppColor.of(context).txtWhite,
                              buttonTextWeight: FontWeight.w600,
                              buttonTextSize: 12.setFontSize,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                            ),
                          ),
                        ],
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
                        color: CustomAppColor.of(context).txtRed,
                        border: Border.all(
                          color: CustomAppColor.of(context).txtWhite,
                          width: 2.setWidth, // Thicker white border
                        ),
                      ),
                      child: UnconstrainedBox(
                        child: Image.asset(
                          AppAssets.icLogout,
                          width: 32.setWidth,
                          height: 32.setHeight,
                          color: CustomAppColor.of(context).txtWhite,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
