import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  // ===================== FontSize =========================

  double get scaledText => ScreenUtil().scaleText;
  double get setFontSize => ScreenUtil().setSp(this);
  // Use ScreenUtil's setSp if needed: ScreenUtil().setSp(this);

  // ===================== Height =========================

  double get screenHeight => ScreenUtil().screenHeight;

  double get setHeight => ScreenUtil().setHeight(this);

  // ===================== Width =========================

  double get screenWidth => ScreenUtil().screenWidth;

  double get setWidth => ScreenUtil().setWidth(this);

  // ===================== Common Button Height =========================

  double get buttonHeight => ScreenUtil().setHeight(45);
}
