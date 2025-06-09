import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final double? letterSpacing;
  final String fontFamily;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int? maxLines;
  final bool isAutoSize;
  final TextOverflow? overflow;

  const CommonText({
    super.key,
    required this.text,
    this.fontSize,
    this.maxLines,
    this.letterSpacing,
    this.overflow,
    this.textColor,
    this.fontFamily = Constant.fontFamilyUrbanist,
    this.fontWeight = FontWeight.w400,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.isAutoSize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      style: TextStyle(
          fontSize: fontSize ?? AppSizes.setFontSize(14),
          color: textColor ?? CustomAppColor.of(context).txtBlack,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          decoration: textDecoration,
          height: 1.2,
          package: 'goozzy_e_commerce_app_package'),
    );
  }
}
