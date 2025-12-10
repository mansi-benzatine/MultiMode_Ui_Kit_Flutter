import 'dart:math';

import 'package:baby_bloom_screens_app/ui/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  // ===================== FontSize =========================

  double get scaledText => ScreenUtil().scaleText;
  double get setFontSize => setFontSizeCustom(double.parse(toString()));
  // Use ScreenUtil's setSp if needed: ScreenUtil().setSp(this);
  static double setFontSizeCustom(double size) {
    double scaleFactor = 1.0; // Default scale factor

    final context = BabyBloomScreensApp.navigatorKey.currentContext!;
    final screenSize = MediaQuery.of(context).size;

    // Check if it's a tablet based on screen size
    if (isTablet(context)) {
      // Adjust the scale factor for iPad
      scaleFactor = 0.6; // Adjustment for tablets
    }
    // Check for foldable phones (typically have unusual aspect ratios)
    else if (isFoldablePhone(screenSize)) {
      scaleFactor = 0.6; // Adjust as needed - currently 0.5 which is very small
    }

    // Respect user's text scaling preference (but cap it)
    final textScaler = MediaQuery.of(context).textScaler;
    const maxTextScaleFactor = 1.2; // Cap the maximum text scale factor
    final adjustedTextScaleFactor = textScaler.scale(1.0) > maxTextScaleFactor ? maxTextScaleFactor : textScaler.scale(1.0);

    // Combine device scaling with ScreenUtil and user's preference
    return ScreenUtil().setSp(size) * scaleFactor * adjustedTextScaleFactor;
  }

// Add a helper method to detect foldable phones
  static bool isFoldablePhone(Size screenSize) {
    // Galaxy Fold has unusual aspect ratio when unfolded
    final aspectRatio = screenSize.width / screenSize.height;
    final diagonal = sqrt(screenSize.width * screenSize.width + screenSize.height * screenSize.height);

    // More precise detection for foldable phones
    // 1. Check for typical fold phone dimensions
    // 2. Ensure it's not just any large tablet
    bool isFold = (
        // Unusual aspect ratios common in foldables
        (aspectRatio > 0.9 && aspectRatio < 1.1 && diagonal < 1400) ||
            // Specific dimensions check for common foldable devices
            (screenSize.width >= 700 && screenSize.width <= 900 && screenSize.height >= 700 && screenSize.height <= 900));

    // Debug.printLog("isFold ==========>> $isFold");
    // Debug.printLog("Screen size: ${screenSize.width} x ${screenSize.height}, aspectRatio: $aspectRatio");
    return isFold;
  }

  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;

    // Only consider it a tablet if:
    // 1. It passes the traditional tablet size check
    // 2. It's NOT a foldable phone
    bool isTab = shortestSide > 600 && !isFoldablePhone(size);

    // Debug.printLog("isTab ==========>> $isTab");
    // Debug.printLog("shortestSide ==========>> $shortestSide");

    return isTab;
  }
  // ===================== Height =========================

  double get screenHeight => ScreenUtil().screenHeight;

  double get setHeight => ScreenUtil().setHeight(this);

  // ===================== Width =========================

  double get screenWidth => ScreenUtil().screenWidth;

  double get setWidth => ScreenUtil().setWidth(this);

  // ===================== Common Button Height =========================

  double get buttonHeight => ScreenUtil().setHeight(50);
}
