import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? validatorText;
  final String? titleText;
  final double? titleTextSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final int minLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String? prefixIcon;

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.titleText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 10,
    this.maxLines = 1,
    this.minLines = 1,
    this.validatorText,
    this.borderColor,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleText != null) ...{
          Padding(
            padding: EdgeInsets.only(
              left: 5.setWidth,
              right: 5.setWidth,
              bottom: 5.setHeight,
            ),
            child: Row(
              children: [
                CommonText(
                  text: titleText ?? "",
                  fontSize: titleTextSize ?? 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamily,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: CustomAppColor.of(context).black,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? CustomAppColor.of(context).bgScreen,
            hintText: hintText,
            /*labelText: labelText ?? hintText,*/
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            /*labelStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),*/
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            prefixIcon: prefixIcon != null
                ? InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        prefixIcon!,
                        height: 10.setHeight,
                        width: 10.setHeight,
                        color: CustomAppColor.of(context).black,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(width: 1.5, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(width: 1.5, color: borderColor ?? CustomAppColor.of(context).borderTextFormField)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(width: 1.5, color: CustomAppColor.of(context).btnPrimary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(width: 1.5, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(width: 1.5, color: CustomAppColor.of(context).borderTextFormField),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(width: 1.5, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefix extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? validatorText;
  final String? titleText;
  final double? titleTextSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Color? fillColor;
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String prefixIcon;
  final Color? prefixIconColor;
  final Function()? onPrefixClick;

  const CommonTextFormFieldWithPrefix({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.titleText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 0,
    this.maxLines = 1,
    this.validatorText,
    this.validator,
    required this.prefixIcon,
    this.prefixIconColor,
    this.onPrefixClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...{
          CommonText(
            text: titleText ?? "",
            fontSize: titleTextSize ?? 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? CustomAppColor.of(context).transparent,
            hintText: hintText,
            labelText: labelText ?? hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            prefixIcon: prefixIcon.isNotEmpty
                ? InkWell(
                    onTap: () {
                      onPrefixClick?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.setWidth),
                      child: Image.asset(
                        prefixIcon,
                        height: 20.setHeight,
                        width: 20.setHeight,
                        color: prefixIconColor,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(right: 0.setWidth, left: 0.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: .5),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithSuffix extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? validatorText;
  final String? titleText;
  final double? titleTextSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Color? fillColor;
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String suffixIcon;
  final Color? suffixIconColor;
  final Function()? onSuffixClick;

  const CommonTextFormFieldWithSuffix({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.titleText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 8,
    this.maxLines = 1,
    this.validatorText,
    this.validator,
    required this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...{
          CommonText(
            text: titleText ?? "",
            fontSize: titleTextSize ?? 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            height: 2.5,
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? CustomAppColor.of(context).transparent,
            hintText: hintText,
            labelText: labelText ?? hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            suffixIcon: suffixIcon.isNotEmpty
                ? InkWell(
                    onTap: () {
                      onSuffixClick?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.setWidth),
                      child: Image.asset(
                        suffixIcon,
                        height: 20.setHeight,
                        width: 20.setHeight,
                        color: CustomAppColor.of(context).icBlackWhite,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(right: 0.setWidth, left: 15.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: .5),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefixAndSuffix extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? validatorText;
  final String? titleText;
  final double? titleTextSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Color? fillColor;
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String prefixIcon;
  final Color? prefixIconColor;
  final Function()? onPrefixClick;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final Function? onSuffixClick;

  const CommonTextFormFieldWithPrefixAndSuffix({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.titleText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 0,
    this.maxLines = 1,
    this.validatorText,
    this.validator,
    required this.prefixIcon,
    this.prefixIconColor,
    this.onPrefixClick,
    required this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...{
          CommonText(
            text: titleText ?? "",
            fontSize: titleTextSize ?? 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? CustomAppColor.of(context).transparent,
            hintText: hintText,
            labelText: labelText ?? hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            prefixIcon: InkWell(
              onTap: () {
                onPrefixClick?.call();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.setWidth),
                child: Image.asset(
                  prefixIcon,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  color: prefixIconColor,
                  gaplessPlayback: true,
                ),
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                onSuffixClick?.call();
              },
              child: UnconstrainedBox(
                child: Image.asset(
                  suffixIcon!,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  color: prefixIconColor,
                  gaplessPlayback: true,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              right: 20.setWidth,
              left: 20.setWidth,
              top: 15.setHeight,
              bottom: 15.setHeight,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).dividerColor, width: .5),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: .5),
            ),
          ),
        ),
      ],
    );
  }
}
