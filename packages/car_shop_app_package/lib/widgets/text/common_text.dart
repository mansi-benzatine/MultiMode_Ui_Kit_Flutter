import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/sizer_utils.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int? maxLines;
  final double? height;
  final bool isAutoSize;
  final TextOverflow? overflow;
  final double? letterSpacing;

  const CommonText({
    super.key,
    required this.text,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textColor,
    this.fontFamily = Constant.fontFamily,
    this.fontWeight = FontWeight.w500,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.isAutoSize = false,
    this.height,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return (isAutoSize)
        ? AutoSizeText(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
            style: TextStyle(
              fontSize: fontSize ?? 14.setFontSize,
              color: textColor ?? CustomAppColor.of(context).txtWhite,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: textDecoration,
              decorationColor: textColor ?? CustomAppColor.of(context).txtWhite,
              height: height,
              letterSpacing: letterSpacing ?? -0.3,
              package: 'car_shop_app_package',
            ),
          )
        : Text(
            text,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
            style: TextStyle(
              fontSize: fontSize ?? 14.setFontSize,
              color: textColor ?? CustomAppColor.of(context).txtWhite,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: textDecoration,
              decorationColor: textColor ?? CustomAppColor.of(context).txtWhite,
              height: height,
              letterSpacing: 0.2,
              package: 'car_shop_app_package',
            ),
          );
  }
}
