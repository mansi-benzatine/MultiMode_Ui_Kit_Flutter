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

  Color get blue {
    return const Color(0xff2B70E8);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get secondary {
    return const Color(0xFF0D1722);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get txtGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA7AFB3) : const Color(0xFF8E8E8E);
  }

  Color get txtLightGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF8E8E8E) : const Color(0xFFD2D2D2);
  }

  Color get icGray {
    return const Color(0xFFD2D2D2);
  }

  Color get txtOrange {
    return const Color(0xFFF37A20);
  }

  Color get txtRed {
    return red;
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5EC401) : const Color(0xFF5EC401);
  }

  Color get txtPrimaryWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5EC401) : white;
  }

  Color get borderPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5EC401) : const Color(0xFF5EC401);
  }

  Color get buttonPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5EC401) : const Color(0xFF5EC401);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get cardBgBlackWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1E1E1E);
  }

  Color get hintText {
    return const Color(0xFFB3B3B3);
  }

  Color get btnPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF5EC401);
  }

  Color get borderOtp {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5EC401) : const Color(0xFF5EC401);
  }

  Color get btnBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D1722) : const Color(0xFF9EA2A7).withValues(alpha: 0.5);
  }

  Color get borderTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF525252);
  }

  Color get border {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF292929);
  }

  Color get couponCard {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFDEAE1) : const Color(0xFF292929);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff1E1E1E) : white;
  }

  Color get unselectedCard {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF4F6F6) : const Color(0xFF292929);
  }

  Color get txtBlackGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000) : const Color(0xFFA4A4A4);
  }

  Color get bottomNavbar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE2D6D1) : black;
  }

  Color get icBlackWhite {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1E1E1E);
  }

  Color get bgTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? white : Colors.transparent;
  }

  Color get bgAlertDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF22262F);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF242827);
  }

  Color get bottomSheetBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF26272D);
  }

  Color get borderProfileView {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE6E6E6) : const Color(0xFF292929);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF9EA2A7).withValues(alpha: 0.2);
  }

  Color get topbarGradiant {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFEE80) : const Color(0xFF1E1E1E);
  }

  Color get itemCardBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCCCCCC) : const Color(0xFF525252);
  }

  Color get yourOrderCard {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffFFFFFF) : const Color(0xFF292929);
  }

  Color get yourOrderDivider {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF4F6F6) : const Color(0xFF1E1E1E);
  }

  Color get listTileColorScreenList {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xff262932);
  }

  Color get listTileShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000).withValues(alpha: 0.10) : const Color(0xff262932);
  }

  Color get greyHandle {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000).withValues(alpha: 0.10) : const Color(0xFFFFFFFF).withValues(alpha: 0.14);
  }
}
