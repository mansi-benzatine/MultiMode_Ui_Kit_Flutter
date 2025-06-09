import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double radius;
  final double pVertical;
  final double pHorizontal;
  final Function()? onTap;
  final String? btnText;
  final Widget? child;
  final double? fontSize;
  final bool? isButtonShadow;

  const CommonButton(
      {super.key,
      this.buttonColor,
      this.borderColor,
      this.radius = 8,
      this.height,
      this.width,
      this.pVertical = 0,
      this.pHorizontal = 0,
      this.onTap,
      this.btnText,
      this.child,
      this.fontSize,
      this.isButtonShadow = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: (isButtonShadow ?? false)
              ? [
                  BoxShadow(
                    color: AppColor.btnPurple.withOpacityPercent(0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor ?? CustomAppColor.of(context).transparent),
          color: buttonColor ?? CustomAppColor.of(context).btnPurple,
        ),
        height: height ?? AppSizes.buttonHeight,
        width: width ?? AppSizes.fullWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: pVertical,
          horizontal: pHorizontal,
        ),
        child: child ??
            CommonText(
              text: btnText ?? '',
              fontSize: fontSize ?? AppSizes.setFontSize(15),
              textColor: CustomAppColor.of(context).white,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
