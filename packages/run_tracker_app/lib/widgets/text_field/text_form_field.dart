import 'package:flutter/material.dart';

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
  final Color? borderColor;
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final int maxLines;
  final int minLines;
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
    this.maxLines = 1,
    this.minLines = 1,
    this.validatorText,
    this.borderColor,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleText != null) ...{
          Padding(
            padding: EdgeInsets.only(bottom: 8.setHeight),
            child: Row(
              children: [
                CommonText(
                  text: titleText ?? "",
                  fontSize: titleTextSize ?? 16.setFontSize,
                  fontWeight: FontWeight.w600,
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
            fontSize: 15.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator:
              validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: borderColor ?? CustomAppColor.of(context).grey.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: CustomAppColor.of(context).primary)),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: CustomAppColor.of(context).primary)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
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
            fontSize: 16.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator:
              validator ??
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
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGrey,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 20.setWidth, minHeight: 40.setHeight),
            prefixIcon: prefixIcon.isNotEmpty
                ? InkWell(
                    onTap: () {
                      onPrefixClick?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                      child: Image.asset(prefixIcon, height: 24.setHeight, width: 24.setHeight, color: prefixIconColor, gaplessPlayback: true),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).primary)),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).primary)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
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
            fontSize: 16.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: maxLines,
          onChanged: onTextChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator:
              validator ??
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
            hintStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 20.setWidth, minHeight: 40.setHeight),
            prefixIcon: InkWell(
              onTap: () {
                onPrefixClick?.call();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.setWidth),
                child: Image.asset(prefixIcon, height: 20.setHeight, width: 20.setHeight, color: prefixIconColor, gaplessPlayback: true),
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                onSuffixClick?.call();
              },
              child: UnconstrainedBox(
                child: Image.asset(suffixIcon!, height: 20.setHeight, width: 20.setHeight, color: prefixIconColor, gaplessPlayback: true),
              ),
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).primary)),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).primary)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).grey.withValues(alpha: 0.2))),
          ),
        ),
      ],
    );
  }
}
