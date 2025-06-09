import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';

class SingleDigitTextField extends StatefulWidget {
  final TextEditingController controller;

  const SingleDigitTextField({super.key, required this.controller});

  @override
  SingleDigitTextFieldState createState() => SingleDigitTextFieldState();
}

class SingleDigitTextFieldState extends State<SingleDigitTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

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
    Color borderColor = _focusNode.hasFocus ? CustomAppColor.of(context).borderGrey : CustomAppColor.of(context).borderGrey;

    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      // obscuringCharacter: '●',
      // obscureText: true,
      style: TextStyle(
          fontSize: AppSizes.setFontSize(24),
          fontWeight: FontWeight.w700,
          fontFamily: Constant.fontFamilyUrbanist,
          color: CustomAppColor.of(context).txtPurple),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      focusNode: _focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: _focusNode.hasFocus ? AppColor.white.withOpacityPercent(0.2) : CustomAppColor.of(context).bgScaffold,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: CustomAppColor.of(context).bgContainer),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: CustomAppColor.of(context).bgContainer, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(10)),
      ),
    );
  }
}
