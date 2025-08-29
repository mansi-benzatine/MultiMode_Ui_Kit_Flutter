import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;
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

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
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
    this.validatorText,
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
                  fontSize: titleTextSize ?? 12.setFontSize,
                  fontWeight: FontWeight.w800,
                  textColor: CustomAppColor.of(context).txtHintGrey,
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
            fontWeight: FontWeight.w400,
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
            fillColor: fillColor ?? CustomAppColor.of(context).white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtHintGrey,
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
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefix extends StatelessWidget {
  final String hintText;
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
  final double? hintTextFontSize;
  final FontWeight? hintFontWeight;
  final double? hintWordSpacing;
  final FocusNode? focusNode;
  final Color? borderColor;

  const CommonTextFormFieldWithPrefix({
    super.key,
    required this.controller,
    required this.hintText,
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
    this.validatorText,
    this.validator,
    required this.prefixIcon,
    this.prefixIconColor,
    this.onPrefixClick,
    this.hintFontWeight,
    this.hintTextFontSize,
    this.hintWordSpacing,
    this.focusNode,
    this.borderColor,
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
                  fontSize: titleTextSize ?? 12.setFontSize,
                  fontWeight: FontWeight.w800,
                  textColor: CustomAppColor.of(context).txtHintGrey,
                ),
              ],
            ),
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: CustomAppColor.of(context).black,
          style: TextStyle(
            fontSize: 16.setFontSize,
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
            fillColor: fillColor ?? CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: hintTextFontSize ?? 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtHintGrey,
              fontWeight: hintFontWeight ?? FontWeight.w500,
              fontFamily: Constant.fontFamily,
              wordSpacing: hintWordSpacing,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            prefixIcon: InkWell(
              onTap: () {
                onPrefixClick?.call();
              },
              child: UnconstrainedBox(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.setWidth),
                  child: prefixIcon.isNotEmpty
                      ? Image.asset(
                          prefixIcon,
                          height: 20.setHeight,
                          width: 20.setHeight,
                          color: prefixIconColor,
                          gaplessPlayback: true,
                        )
                      : const SizedBox(),
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderColor ?? CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderColor ?? CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderColor ?? CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderColor ?? CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: borderColor ?? CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefixAndSuffix extends StatelessWidget {
  final String hintText;
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
                  fontSize: titleTextSize ?? 12.setFontSize,
                  fontWeight: FontWeight.w800,
                  textColor: CustomAppColor.of(context).txtHintGrey,
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
            fontSize: 16.setFontSize,
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
            fillColor: fillColor ?? CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtHintGrey,
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
            prefixIcon: InkWell(
              onTap: () {
                onPrefixClick?.call();
              },
              child: UnconstrainedBox(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.setWidth),
                  child: Image.asset(
                    prefixIcon,
                    height: 20.setHeight,
                    width: 20.setHeight,
                    color: prefixIconColor,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                onSuffixClick?.call();
              },
              child: UnconstrainedBox(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.setWidth),
                  child: Image.asset(
                    suffixIcon!,
                    height: 18.setHeight,
                    width: 18.setHeight,
                    color: prefixIconColor,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
          ),
        ),
      ],
    );
  }
}
