import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mivi_screens_app/utils/utils.dart';

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
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final int minLines;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final String? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

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
    this.radius = 14,
    this.maxLines = 1,
    this.minLines = 1,
    this.validatorText,
    this.borderColor,
    this.prefixIcon,
    this.validator,
    this.inputFormatters,
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
              bottom: 8.setHeight,
            ),
            child: Row(
              children: [
                CommonText(
                  text: widget.titleText ?? "",
                  fontSize: widget.titleTextSize ?? 13.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
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
          cursorColor: CustomAppColor.of(context).black,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: widget.hintTextColor ?? CustomAppColor.of(context).txtBlack,
            fontFamily: Constant.fontFamilyMedium500,
            package: "mivi_screens_app",
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
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? CustomAppColor.of(context).bgTextFormField,
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
              fontSize: 13.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).txtGray,
              fontFamily: Constant.fontFamilyMedium500,
              package: "mivi_screens_app",
            ),
            prefixIcon: widget.prefixIcon != null
                ? InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        widget.prefixIcon!,
                        height: 10.setHeight,
                        width: 10.setHeight,
                        color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).icGray,
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
              fontFamily: Constant.fontFamilyRegular400,
            ),
            contentPadding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth, top: 12.setHeight, bottom: 12.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: !(isFocused || isEmpty) ? CustomAppColor.of(context).grey : CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).btnPrimary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).borderTextFormField),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(width: 1, color: CustomAppColor.of(context).black.withOpacityPercent(0.08)),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithPrefix extends StatefulWidget {
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
  final Function(String query)? onSubmitted;
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
    this.radius = 12,
    this.maxLines = 1,
    this.validatorText,
    this.validator,
    required this.prefixIcon,
    this.prefixIconColor,
    this.onPrefixClick,
    this.onSubmitted,
  });

  @override
  State<CommonTextFormFieldWithPrefix> createState() => _CommonTextFormFieldWithPrefixState();
}

class _CommonTextFormFieldWithPrefixState extends State<CommonTextFormFieldWithPrefix> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...{
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.setHeight),
            child: CommonText(
              text: widget.titleText ?? "",
              fontSize: widget.titleTextSize ?? 14.setFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilySemiBold600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          )
        },
        TextFormField(
          focusNode: _focusNode,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.controller,
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: CustomAppColor.of(context).txtBlack,
          style: TextStyle(
            fontSize: 14.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontFamily: Constant.fontFamilyMedium500,
            package: "mivi_screens_app",
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
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).hintText,
              fontFamily: Constant.fontFamilyMedium500,
              package: "mivi_screens_app",
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontFamily: Constant.fontFamilyRegular400,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            prefixIcon: widget.prefixIcon.isNotEmpty
                ? InkWell(
                    onTap: () {
                      widget.onPrefixClick?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.setWidth, right: 5.setWidth),
                      child: Image.asset(
                        widget.prefixIcon,
                        height: 18.setHeight,
                        width: 18.setHeight,
                        color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlackGrey : CustomAppColor.of(context).icGray,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(right: 0.setWidth, left: 0.setWidth, top: 12.setHeight, bottom: 12.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(
                color: CustomAppColor.of(context).borderTextFormField,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: !(isFocused || isEmpty) ? CustomAppColor.of(context).grey : CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldWithSuffix extends StatefulWidget {
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
    this.radius = 22,
    this.maxLines = 1,
    this.validatorText,
    this.validator,
    required this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixClick,
  });

  @override
  State<CommonTextFormFieldWithSuffix> createState() => _CommonTextFormFieldWithSuffixState();
}

class _CommonTextFormFieldWithSuffixState extends State<CommonTextFormFieldWithSuffix> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...{
          CommonText(
            text: widget.titleText ?? "",
            fontSize: widget.titleTextSize ?? 16.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            height: 2.5,
            fontFamily: Constant.fontFamilyBold700,
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
            fontFamily: Constant.fontFamilyMedium500,
            package: "mivi_screens_app",
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
            fillColor: widget.fillColor ?? CustomAppColor.of(context).transparent,
            hintText: widget.hintText,
            labelText: widget.labelText ?? widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilyRegular400,
            ),
            hintStyle: TextStyle(
              fontSize: 16.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).hintText,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilyRegular400,
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.5.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamilyRegular400,
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            suffixIcon: widget.suffixIcon.isNotEmpty
                ? InkWell(
                    onTap: () {
                      widget.onSuffixClick?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 22.setWidth),
                      child: Image.asset(
                        widget.suffixIcon,
                        height: 20.setHeight,
                        width: 20.setHeight,
                        color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).icGray,
                        gaplessPlayback: true,
                      ),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(right: 0.setWidth, left: 15.setWidth, top: 15.setHeight, bottom: 15.setHeight),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
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
  final Color? hintTextColor;
  final Function(String)? onTextChanged;
  final double radius;
  final int maxLines;
  final Function()? onTap;
  final Function()? onFieldSubmit;
  final String? Function(String? value)? validator;
  final String prefixIcon;
  final Color? prefixIconColor;
  final Color? borderColor;
  final Function()? onPrefixClick;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final GestureTapCallback? onSuffixClick;
  final Function(String query)? onSubmitted;

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
    this.radius = 48,
    this.maxLines = 1,
    this.validatorText,
    this.onFieldSubmit,
    this.validator,
    required this.prefixIcon,
    this.prefixIconColor,
    this.borderColor,
    this.onPrefixClick,
    required this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixClick,
    this.onSubmitted,
  });

  @override
  State<CommonTextFormFieldWithPrefixAndSuffix> createState() => _CommonTextFormFieldWithPrefixAndSuffixState();
}

class _CommonTextFormFieldWithPrefixAndSuffixState extends State<CommonTextFormFieldWithPrefixAndSuffix> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...{
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.setHeight),
            child: CommonText(
              text: widget.titleText ?? "",
              fontSize: widget.titleTextSize ?? 14.setFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          )
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
            fontFamily: Constant.fontFamilySemiBold600,
            package: "mivi_screens_app",
          ),
          maxLines: widget.maxLines,
          onChanged: widget.onTextChanged,
          readOnly: widget.readOnly,
          onFieldSubmitted: widget.onSubmitted,
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
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
              fontSize: 14.setFontSize,
              color: widget.hintTextColor ?? CustomAppColor.of(context).hintText,
              fontFamily: Constant.fontFamilyMedium500,
              package: "mivi_screens_app",
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              fontSize: 12.setFontSize,
              color: CustomAppColor.of(context).txtRed,
              fontFamily: Constant.fontFamilyRegular400,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.setWidth,
              minHeight: 40.setHeight,
            ),
            prefixIcon: InkWell(
              onTap: () {
                widget.onPrefixClick?.call();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 15.setWidth, right: 5.setWidth),
                child: Image.asset(
                  widget.prefixIcon,
                  height: 18.setHeight,
                  width: 18.setHeight,
                  color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).icGray,
                  gaplessPlayback: true,
                ),
              ),
            ),
            suffixIcon: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.onSuffixClick,
              child: UnconstrainedBox(
                child: Image.asset(
                  widget.suffixIcon!,
                  height: 18.setHeight,
                  width: 18.setHeight,
                  color: (isFocused || isEmpty) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).icGray,
                  gaplessPlayback: true,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              right: 20.setWidth,
              left: 20.setWidth,
              top: 12.setHeight,
              bottom: 12.setHeight,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: !(isFocused || isEmpty) ? CustomAppColor.of(context).grey : CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).borderTextFormField, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: widget.borderColor ?? CustomAppColor.of(context).txtRed.withOpacityPercent(0.30), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
