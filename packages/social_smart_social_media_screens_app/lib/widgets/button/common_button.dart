import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double radius;
  final double mTop;
  final double mBottom;
  final double mLeft;
  final double mRight;
  final double pVertical;
  final double pHorizontal;
  final Function()? onTap;
  final String? btnText;
  final bool useSimpleStyle;
  final bool? isSimpleButton;
  final bool? isShadowButton;
  final Widget? child;
  final bool? isOutLinedButton;

  const CommonButton({
    super.key,
    this.buttonColor,
    this.borderColor,
    this.radius = 100,
    this.height,
    this.width,
    this.mTop = 0,
    this.mBottom = 0,
    this.mLeft = 0,
    this.mRight = 0,
    this.pVertical = 0,
    this.pHorizontal = 0,
    this.onTap,
    this.btnText,
    this.useSimpleStyle = false,
    this.child,
    this.isSimpleButton,
    this.isOutLinedButton,
    this.isShadowButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color resolvedBorderColor = borderColor ?? CustomAppColor.of(context).primary;
    final Color resolvedButtonColor = buttonColor ?? CustomAppColor.of(context).bgScaffold;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? AppSizes.buttonHeight,
        width: width ?? AppSizes.fullWidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: pVertical,
          horizontal: pHorizontal,
        ),
        margin: EdgeInsets.only(
          top: mTop,
          bottom: mBottom,
          left: mLeft,
          right: mRight,
        ),
        decoration: BoxDecoration(
          color: useSimpleStyle ? CustomAppColor.of(context).btnBgPink : resolvedButtonColor,
          gradient: useSimpleStyle
              ? null
              : LinearGradient(
                  colors: isOutLinedButton ?? false ? [resolvedButtonColor, resolvedButtonColor] : [AppColor.btnGradiant1, AppColor.btnGradiant2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          border: Border.all(
            color: useSimpleStyle
                ? CustomAppColor.of(context).transparent
                : isOutLinedButton ?? false
                    ? AppColor.btnGradiant2
                    : (resolvedBorderColor),
            width: useSimpleStyle ? 0.2 : 2,
          ),
          borderRadius: isSimpleButton ?? false
              ? BorderRadius.circular(16)
              : useSimpleStyle
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(100),
          boxShadow: (isShadowButton == true)
              ? [
                  BoxShadow(
                    color: AppColor.btnGradiant1.withOpacityPercent(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: child ??
            CommonText(
              text: btnText ?? '',
              fontSize: AppSizes.setFontSize(16),
              textColor: useSimpleStyle ? CustomAppColor.of(context).txtPurple : AppColor.txtSecondary,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
