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
    return const Color(0xFFA6DF3E);
  }

  Color get secondary {
    return const Color(0xFF0D1722);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get bgGray {
    return const Color(0xFFECECEC);
  }

  Color get txtGray {
    return const Color(0xFF9EA2A7);
  }

  Color get txtRed {
    return const Color(0xFFEC4B59);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? primary : primary;
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get txtDarkGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF8E8E8E) : const Color(0xFF8E8E8E);
  }

  Color get txtLightGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFBBBBBB) : const Color(0xFFBBBBBB);
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFBFFF3) : const Color(0xFF181A20);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF242827);
  }

  Color get borderColor {
    return const Color(0xFFDAF2AF);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : white.withValues(alpha: 0.1);
  }

  Color get minColor {
    return const Color(0xFFA4DE3A);
  }

  Color get yogaColor {
    return const Color(0xFF6C9919);
  }

  Color get kcalColor {
    return const Color(0xFF2E420B);
  }

  Color get disabledProgressColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFEFF5E3) : const Color(0xFF1F222A);
  }

  Color get tooltipColor {
    return const Color(0xFF4D6D12);
  }

  Color get txtBlackAndPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? black : primary;
  }

  Color get txtBlackAndGray {
    return (Theme.of(context).brightness == Brightness.light) ? black : txtGray;
  }

  Color get containerFillSelected {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFDAF2AF) : const Color(0x20DAF2AF);
  }

  Color get containerFillBorderAndBlack {
    return (Theme.of(context).brightness == Brightness.light) ? borderColor : const Color(0xFF1F222A);
  }

  Color get containerFillBgScreenAndBlack {
    return (Theme.of(context).brightness == Brightness.light) ? bgScreen : const Color(0xFF1F222A);
  }

  Color get containerBorderAndBlack {
    return (Theme.of(context).brightness == Brightness.light) ? borderColor : black;
  }

  Color get borderPrimaryAndGray {
    return (Theme.of(context).brightness == Brightness.light) ? primary : white.withValues(alpha: 0.2);
  }

  Color get setpperUnSelected {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.2) : primary;
  }

  Color get txtLightGrayAndPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFBBBBBB) : primary;
  }

  Color get bottomBarBgColor {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF080808);
  }

  Color get bgSkyBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF66D1E7) : const Color(0xFF66D1E7);
  }

  Color get bgDarkBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5787DC) : const Color(0xFF5787DC);
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
