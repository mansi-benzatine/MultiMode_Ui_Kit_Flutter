import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class CommonButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final FontWeight buttonTextWeight;
  final String buttonFontFamily;
  final FontStyle buttonFontStyle;
  final double? buttonTextHeight;
  final double? buttonTextSize;
  final double? height;
  final double? width;
  final double radius;
  final double mTop;
  final double mBottom;
  final double mLeft;
  final double mRight;
  final double pVertical;
  final double pHorizontal;
  final double? imageSize;
  final Alignment alignment;
  final String text;
  final String? image;
  final Alignment imageAlignment;
  final Color? imageColor;
  final Color? borderColor;
  final Function()? onTap;
  final bool isEnable;

  const CommonButton({
    super.key,
    required this.text,
    this.buttonColor,
    this.alignment = Alignment.center,
    this.buttonTextColor,
    this.buttonTextWeight = FontWeight.w600,
    this.buttonFontFamily = Constant.fontFamily,
    this.buttonFontStyle = FontStyle.normal,
    this.buttonTextSize,
    this.borderColor,
    this.buttonTextHeight,
    this.radius = 500,
    this.height,
    this.width,
    this.imageSize,
    this.mTop = 0,
    this.mBottom = 0,
    this.mLeft = 0,
    this.mRight = 0,
    this.pVertical = 0,
    this.pHorizontal = 0,
    this.image,
    this.imageAlignment = Alignment.centerRight,
    this.imageColor,
    this.onTap,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height ?? 0.buttonHeight,
        width: width ?? 0.screenWidth,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: mTop, bottom: mBottom, left: mLeft, right: mRight),
        padding: EdgeInsets.symmetric(vertical: pVertical, horizontal: pHorizontal),
        decoration: BoxDecoration(
            color: buttonColor ?? CustomAppColor.of(context).primary,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor ?? CustomAppColor.of(context).transparent)),
        child: InkWell(
          onTap: isEnable ? onTap : null,
          child: Stack(
            children: [
              if (image != null) ...{
                Align(
                  alignment: imageAlignment,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.setWidth),
                    child: Image.asset(
                      image!,
                      gaplessPlayback: true,
                      color: imageColor,
                      height: imageSize ?? 42.setHeight,
                      width: imageSize ?? 42.setHeight,
                    ),
                  ),
                ),
              },
              Align(
                alignment: Alignment.center,
                child: CommonText(
                  text: text,
                  textColor: buttonTextColor ?? CustomAppColor.of(context).white,
                  fontWeight: buttonTextWeight,
                  fontFamily: buttonFontFamily,
                  fontSize: buttonTextSize ?? 18.setFontSize,
                  fontStyle: buttonFontStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
