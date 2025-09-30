import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonTextFormField extends StatefulWidget {
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
  final double? borderWidth;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final int minLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String? prefixIcon;
  final EdgeInsets? contentPadding;

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.titleText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.labelTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 1000,
    this.maxLines = 1,
    this.minLines = 1,
    this.validatorText,
    this.borderColor,
    this.prefixIcon,
    this.validator,
    this.borderWidth,
    this.contentPadding,
  });

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final isEmpty = widget.controller.text.isNotEmpty;
    return Column(
      children: [
        if (widget.titleText != null) ...{
          Padding(
            padding: EdgeInsets.only(
              left: 5.setWidth,
              right: 5.setWidth,
              bottom: 5.setHeight,
            ),
            child: Row(
              children: [
                CommonText(
                  text: widget.titleText ?? "",
                  fontSize: widget.titleTextSize ?? 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
        },
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 16.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w600,
            fontFamily: Constant.fontFamily,
            letterSpacing: 0,
            package: "musify_screens_app_package",
          ),
          maxLines: widget.maxLines,
          minLines: widget.minLines,
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
            fillColor: widget.fillColor ?? CustomAppColor.of(context).transparent,
            hintText: widget.hintText,
            labelText: widget.labelText != null ? "  ${widget.labelText} " : null,
            labelStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: widget.labelTextColor ?? CustomAppColor.of(context).txtBlack,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
              letterSpacing: 0,
              package: "musify_screens_app_package",
            ),
            hintStyle: TextStyle(
              fontSize: 15.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
              letterSpacing: 0,
              package: "musify_screens_app_package",
            ),
            prefixIcon: widget.prefixIcon != null
                ? InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.setWidth, right: 10.setWidth),
                      child: Image.asset(
                        widget.prefixIcon!,
                        height: 20.setHeight,
                        width: 20.setHeight,
                        color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).greyIndicator,
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
              package: "musify_screens_app_package",
            ),
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                  right: 12.setWidth,
                  left: 12.setWidth,
                  top: 12.setHeight,
                  bottom: 12.setHeight,
                ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormFeild, width: widget.borderWidth ?? 0.6),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormFeild, width: widget.borderWidth ?? 0.6),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).primary, width: widget.borderWidth ?? 1),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).red, width: widget.borderWidth ?? 0.6),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).txtGray, width: widget.borderWidth ?? 0.6),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomAppColor.of(context).red, width: widget.borderWidth ?? 0.6),
              borderRadius: BorderRadius.circular(widget.radius),
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
            fillColor: fillColor ?? CustomAppColor.of(context).transparent,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.setFontSize,
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
              borderSide: BorderSide(color: CustomAppColor.of(context).lineColor, width: .5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).lineColor, width: .5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).lineColor, width: .5),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).lineColor, width: .5),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).lineColor, width: .5),
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

class CommonTextFormFieldWithPrefixAndSuffix extends StatefulWidget {
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
  final double? borderWidth;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final int minLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String? prefixIcon;
  final EdgeInsets? contentPadding;
  final String? suffixIcon;
  final double? suffixIconSize;
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
    this.labelTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 1000,
    this.maxLines = 1,
    this.minLines = 1,
    this.validatorText,
    this.borderColor,
    this.prefixIcon,
    this.validator,
    this.borderWidth,
    this.contentPadding,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.onSuffixClick,
  });

  @override
  State<CommonTextFormFieldWithPrefixAndSuffix> createState() => _CommonTextFormFieldWithPrefixAndSuffixState();
}

class _CommonTextFormFieldWithPrefixAndSuffixState extends State<CommonTextFormFieldWithPrefixAndSuffix> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final isEmpty = widget.controller.text.isNotEmpty;
    return Column(
      children: [
        if (widget.titleText != null) ...{
          Padding(
            padding: EdgeInsets.only(
              left: 5.setWidth,
              right: 5.setWidth,
              bottom: 5.setHeight,
            ),
            child: Row(
              children: [
                CommonText(
                  text: widget.titleText ?? "",
                  fontSize: widget.titleTextSize ?? 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
        },
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 16.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w600,
            fontFamily: Constant.fontFamily,
            letterSpacing: 0,
            package: "musify_screens_app_package",
          ),
          maxLines: widget.maxLines,
          minLines: widget.minLines,
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
            fillColor: widget.fillColor ?? CustomAppColor.of(context).transparent,
            hintText: widget.hintText,
            labelText: widget.labelText != null ? "  ${widget.labelText} " : null,
            labelStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: widget.labelTextColor ?? CustomAppColor.of(context).txtBlack,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
              letterSpacing: 0,
              package: "musify_screens_app_package",
            ),
            hintStyle: TextStyle(
              fontSize: 15.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
              letterSpacing: 0,
              package: "musify_screens_app_package",
            ),
            prefixIcon: widget.prefixIcon != null
                ? InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.setWidth, right: 10.setWidth),
                      child: Image.asset(
                        widget.prefixIcon!,
                        height: 18.setHeight,
                        width: 18.setHeight,
                        color: (isEmpty || isFocused) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            suffixIcon: InkWell(
              onTap: () {
                widget.onSuffixClick?.call();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.setWidth),
                child: UnconstrainedBox(
                  child: Image.asset(
                    widget.suffixIcon!,
                    height: widget.suffixIconSize ?? 18.setHeight,
                    width: widget.suffixIconSize ?? 18.setHeight,
                    color: (isEmpty || isFocused) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamily,
            ),
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                  right: 15.setWidth,
                  left: 15.setWidth,
                  top: 13.setHeight,
                  bottom: 13.setHeight,
                ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormFeild, width: widget.borderWidth ?? 0.5),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormFeild, width: widget.borderWidth ?? 0.5),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).primary, width: widget.borderWidth ?? 1),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).red, width: widget.borderWidth ?? 0.5),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).txtGray, width: widget.borderWidth ?? 0.5),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomAppColor.of(context).red, width: widget.borderWidth ?? 0.5),
              borderRadius: BorderRadius.circular(widget.radius),
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
  final String? suffixIcon;
  final Color? suffixIconColor;
  final Function? onSuffixClick;

  const CommonTextFormFieldWithSuffix({
    super.key,
    required this.controller,
    required this.hintText,
    this.titleText,
    this.labelText,
    this.titleTextSize,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.onTextChanged,
    this.onTap,
    this.radius = 1000,
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
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        },
        TextFormField(
          controller: controller,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          obscuringCharacter: "*",
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
            fillColor: fillColor ?? CustomAppColor.of(context).transparent,
            hintText: hintText,
            labelText: "  $labelText ",
            labelStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).txtBlack,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
              letterSpacing: 0,
            ),
            hintStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamily,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamily,
            ),
            suffixIcon: InkWell(
              onTap: () {
                onSuffixClick?.call();
              },
              child: UnconstrainedBox(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.setWidth),
                  child: Image.asset(
                    suffixIcon!,
                    height: 20.setHeight,
                    width: 20.setHeight,
                    color: suffixIconColor,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              right: 25.setWidth,
              left: 25.setWidth,
              top: 15.setHeight,
              bottom: 15.setHeight,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtBlack, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).red, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtGray, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
