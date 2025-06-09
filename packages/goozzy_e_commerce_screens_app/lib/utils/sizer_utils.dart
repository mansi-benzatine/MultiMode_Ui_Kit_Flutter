import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // =====================  FontSize =========================

  static final double fullSizeText = ScreenUtil().scaleText;

  static setFontSize(s) {
    return ScreenUtil().setSp(s);
  }

  // =====================  Height =========================

  static final double fullHeight = ScreenUtil().screenHeight;

  static setHeight(h) {
    return ScreenUtil().setHeight(h);
  }

  // =====================  Width =========================

  static final double fullWidth = ScreenUtil().screenWidth;

  static setWidth(w) {
    return ScreenUtil().setWidth(w);
  }

  // =====================  Common Button Height =========================

  static final double buttonHeight = ScreenUtil().setHeight(52);
  static final double topBarHeight = ScreenUtil().setHeight(60);
}
