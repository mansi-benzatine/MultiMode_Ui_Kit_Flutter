import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00FFFFFF);
  }

  Color get white {
    return const Color(0xFFFFFFFF);
  }

  Color get black {
    return const Color(0xff000000);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF794328) : const Color(0xFFA4634E);
  }

  Color get secondary {
    return const Color(0xFF0D1722);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get txtGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA4A4A4) : const Color(0xFF8E8E8E);
  }

  Color get txtLightGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF8E8E8E) : const Color(0xFFD2D2D2);
  }

  Color get icGray {
    return const Color(0xFFD2D2D2);
  }

  Color get txtCream {
    return const Color(0xFFE09E7B);
  }

  Color get txtOrange {
    return const Color(0xFFE89F71);
  }

  Color get txtRed {
    return red;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get hintText {
    return const Color(0xFFD2D2D2);
  }

  Color get btnPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF794328) : const Color(0xFFA4634E);
  }

  Color get emptyViewIcon {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFD7C7BF) : const Color(0xFF38393F);
  }

  Color get btnBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D1722) : const Color(0xFF9EA2A7).withValues(alpha: 0.5);
  }

  Color get borderTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF2F3036);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000) : white;
  }

  Color get txtBlackGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000) : const Color(0xFFA4A4A4);
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF794328) : const Color(0xFFA4634E);
  }

  Color get bottomNavbar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE2D6D1) : black;
  }

  Color get icBlackWhite {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF181920);
  }

  Color get bgTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF2F3036);
  }

  Color get bgAlertDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF22262F);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF242827);
  }

  Color get containerBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF7F4F2) : const Color(0xFF26272D);
  }

  Color get additionalTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF26272D);
  }

  Color get bottomSheetBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF26272D);
  }

  Color get cardBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF26272D);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF9EA2A7).withValues(alpha: 0.2);
  }
}
