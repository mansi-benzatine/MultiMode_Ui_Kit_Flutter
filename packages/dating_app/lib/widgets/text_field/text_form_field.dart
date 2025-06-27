import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
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
            padding: EdgeInsets.only(bottom: 2.setHeight),
            child: Row(
              children: [
                CommonText(
                  text: titleText ?? "",
                  fontSize: titleTextSize ?? 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtGrey,
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
            color: CustomAppColor.of(context).txtVelvet,
            fontWeight: FontWeight.w400,
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
            fillColor: fillColor ?? CustomAppColor.of(context).bgTextFormField,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15.setFontSize,
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
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 13.setHeight, bottom: 13.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
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
          validator: validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? CustomAppColor.of(context).bgTextFormField,
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
                      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
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
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefixAndSuffix extends StatefulWidget {
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
  final String? prefixIcon;
  final Color? prefixIconColor;
  final Function()? onPrefixClick;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final Function? onSuffixClick;
  final bool isPasswordField;

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
    this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixClick,
    this.isPasswordField = false,
  });

  @override
  State<CommonTextFormFieldWithPrefixAndSuffix> createState() => _CommonTextFormFieldWithPrefixAndSuffixState();
}

class _CommonTextFormFieldWithPrefixAndSuffixState extends State<CommonTextFormFieldWithPrefixAndSuffix> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...{
          CommonText(
            text: widget.titleText ?? "",
            fontSize: widget.titleTextSize ?? 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        },
        TextFormField(
          controller: widget.controller,
          autofocus: widget.autofocus,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 16.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Constant.fontFamily,
          ),
          maxLines: widget.maxLines,
          onChanged: widget.onTextChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          validator: widget.validator ??
              (String? value) {
                if (value == null || value.isEmpty) {
                  return widget.validatorText;
                }
                return null;
              },
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? CustomAppColor.of(context).bgTextFormField,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).txtGrey,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).grey,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            prefixIcon: InkWell(
              onTap: () {
                widget.onPrefixClick?.call();
              },
              child: Visibility(
                visible: widget.prefixIcon!.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                  child: Image.asset(
                    widget.prefixIcon ?? '',
                    height: 24.setHeight,
                    width: 24.setHeight,
                    color: widget.prefixIconColor,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            suffixIcon: widget.isPasswordField
                ? _obscureText
                    ? IconButton(
                        icon: Image.asset(
                          AppAssets.icEyeSlash,
                          width: 20.setWidth,
                          height: 20.setHeight,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : IconButton(
                        icon: Image.asset(
                          AppAssets.icEye,
                          width: 20.setWidth,
                          height: 20.setHeight,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                : InkWell(
                    onTap: () {
                      widget.onSuffixClick?.call();
                    },
                    child: UnconstrainedBox(
                      child: Image.asset(
                        widget.suffixIcon!,
                        height: 24.setHeight,
                        width: 24.setHeight,
                        color: widget.prefixIconColor,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 60.setWidth,
              minHeight: 40.setHeight,
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 13.setHeight, bottom: 13.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).textFormFieldBorder),
            ),
          ),
        ),
      ],
    );
  }
}
