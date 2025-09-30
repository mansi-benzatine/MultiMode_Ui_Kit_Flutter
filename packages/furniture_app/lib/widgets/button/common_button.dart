import 'package:flutter/material.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';

import '../../utils/app_color.dart';
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
    this.buttonTextWeight = FontWeight.w500,
    this.buttonFontFamily = Constant.fontFamilyBold700,
    this.buttonFontStyle = FontStyle.normal,
    this.buttonTextSize,
    this.borderColor,
    this.buttonTextHeight,
    this.radius = 100,
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
          color: buttonColor ?? CustomAppColor.of(context).btnPrimary,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderColor ?? CustomAppColor.of(context).btnPrimary,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: isEnable ? onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image != null) ...{
                Image.asset(
                  image ?? '',
                  gaplessPlayback: true,
                  color: imageColor,
                  height: imageSize ?? 22.setHeight,
                  width: imageSize ?? 22.setHeight,
                ),
              },
              if (image != null && text.isNotEmpty) SizedBox(width: 10.setWidth),
              if (text.isNotEmpty)
                CommonText(
                  text: text,
                  textColor: buttonTextColor ?? CustomAppColor.of(context).white,
                  fontWeight: buttonTextWeight,
                  fontFamily: buttonFontFamily,
                  fontSize: buttonTextSize ?? 17.setFontSize,
                  fontStyle: buttonFontStyle,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
