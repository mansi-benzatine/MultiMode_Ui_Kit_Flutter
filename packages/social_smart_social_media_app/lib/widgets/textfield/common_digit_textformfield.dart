import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';

class SingleDigitTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final bool? isObscure;

  const SingleDigitTextField({
    super.key,
    required this.controller,
    required this.currentFocus,
    this.nextFocus,
    this.isObscure = false,
  });

  @override
  SingleDigitTextFieldState createState() => SingleDigitTextFieldState();
}

class SingleDigitTextFieldState extends State<SingleDigitTextField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.text.length == 1 && widget.nextFocus != null) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.currentFocus.hasFocus ? AppColor.btnGradiant1.withOpacityPercent(0.5) : CustomAppColor.of(context).icGrey.withOpacityPercent(0.2);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.currentFocus,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      obscuringCharacter: '●',
      obscureText: widget.isObscure == true ? true : false,
      style: TextStyle(
        fontSize: AppSizes.setFontSize(24),
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyUrbanist,
        color: CustomAppColor.of(context).txtBlack,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.currentFocus.hasFocus ? AppColor.transparent : CustomAppColor.of(context).bgTextFormField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 0.9),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.4),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSizes.setHeight(10),
          horizontal: AppSizes.setWidth(10),
        ),
      ),
    );
  }
}
