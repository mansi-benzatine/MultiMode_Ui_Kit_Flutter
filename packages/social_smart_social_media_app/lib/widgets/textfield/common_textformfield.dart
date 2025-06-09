import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../../../../../../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';

class CommonTextFormField extends StatefulWidget {
  final String? hintText;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool isPasswordField;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isPhoneNumberField;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final int? maxLines;

  const CommonTextFormField({
    super.key,
    this.hintText,
    this.leadingIcon,
    this.isPasswordField = false,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.isPhoneNumberField = false,
    this.fillColor,
    this.hintStyle,
    this.focusNode,
    this.borderColor,
    this.maxLines,
  });

  @override
  CommonTextFormFieldState createState() => CommonTextFormFieldState();
}

class CommonTextFormFieldState extends State<CommonTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPhoneNumberField) {
      return IntlPhoneField(
        disableLengthCheck: true,
        controller: widget.controller,
        style: TextStyle(
          color: AppColor.black,
          fontSize: AppSizes.setFontSize(14),
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: CustomAppColor.of(context).grey.withOpacityPercent(0.5)),
          fillColor: widget.fillColor ?? CustomAppColor.of(context).bgTextFormField,
          filled: true,
          hintText: widget.hintText,
          prefixIcon: widget.leadingIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.leadingIcon,
                )
              : null,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.transparent),
          ),
        ),
        // initialCountryCode: 'IN',

        onChanged: (phone) {
          if (widget.onChanged != null) {
            widget.onChanged!(phone.completeNumber);
          }
        },
      );
    } else {
      return TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines ?? 1,
        obscureText: _obscureText,
        style: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontSize: AppSizes.setFontSize(14),
          fontWeight: _obscureText ? FontWeight.w900 : FontWeight.w600,
        ),
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? CustomAppColor.of(context).bgShadow,
          filled: true,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: CustomAppColor.of(context).grey.withOpacityPercent(0.5),
                fontWeight: FontWeight.w500,
              ),
          prefixIcon: widget.leadingIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.leadingIcon,
                )
              : null,
          suffixIcon: widget.isPasswordField
              ? _obscureText
                  ? IconButton(
                      icon: Image.asset(
                        AppAssets.icEyeLock,
                        width: AppSizes.setWidth(16),
                        height: AppSizes.setHeight(16),
                        color: CustomAppColor.of(context).icBlack,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: CustomAppColor.of(context).icBlack,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
              : widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColor.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: widget.borderColor ?? AppColor.transparent, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: widget.borderColor ?? AppColor.transparent, width: 1.5),
          ),
        ),
      );
    }
  }
}
