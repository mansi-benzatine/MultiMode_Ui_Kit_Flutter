import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00FFFFFF);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF2EA3C0)
        : Color(0xFF71CCF4);
  }

  Color get black {
    return const Color(0xFF000000);
  }

  Color get white {
    return const Color(0xFFFFFFFF);
  }

  Color get bgScaffold {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF24232A);
  }

  Color get blurCard {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFCCCCCC).withValues(alpha: 0.3)
        : const Color(0xFF24232A).withValues(alpha: 0.5);
  }

  Color get bottomNavbar {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : Color(0xFF323645);
  }

  Color get selectedContainer {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : Color(0xFF222531);
  }

  Color get toggleBg {
    return (Theme.of(context).brightness == Brightness.light)
        ? Color(0xFFF5F5F5)
        : Color(0xFF323645);
  }

  Color get containerBgColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? Colors.transparent
        : Color(0xFF323645);
  }

  Color get grey {
    return const Color(0xFFB8BBC6);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF021713);
  }

  Color get txtGreyWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? Color(0xFF858CA4)
        : white;
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF2EA3C0)
        : Color(0xFF71CCF4);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : white;
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : white;
  }

  Color get txtBlackPrimary {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : const Color(0xFF71CCF4);
  }

  Color get icWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF021713);
  }

  Color get txtGrey {
    return const Color(0xFFCACBC7);
  }

  Color get txtLightGrey {
    return const Color(0xFF858CA4);
  }

  Color get txtDarkGrey {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF828282)
        : const Color(0xFF858CA4);
  }

  Color get icGrey {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFCACBC7)
        : const Color(0xFF858CA4);
  }

  Color get txtBlackDarkGrey {
    return (Theme.of(context).brightness == Brightness.light)
        ? black
        : const Color(0xFF858CA4);
  }

  Color get greyShadow {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFF5F5F5)
        : const Color(0xFF35383A);
  }

  Color get txtGreyBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFCACBC7)
        : const Color(0xFF35383A);
  }

  Color get border {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFE6E6E6)
        : Colors.transparent;
  }

  Color get divider {
    return const Color(0xFFB8BBC6);
  }

  Color get lime {
    return Colors.lime;
  }

  Color get limePrimary {
    return (Theme.of(context).brightness == Brightness.light)
        ? Colors.lime
        : primary;
  }

  Color get bgSkyBlue {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF66D1E7)
        : const Color(0xFF66D1E7);
  }

  Color get bgDarkBlue {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF5787DC)
        : const Color(0xFF5787DC);
  }

  Color get listTileColorScreenList {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFFFFFFF)
        : const Color(0xff262932);
  }

  Color get listTileShadow {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withValues(alpha: 0.10)
        : const Color(0xff262932);
  }

  Color get greyHandle {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withValues(alpha: 0.10)
        : const Color(0xFFFFFFFF).withValues(alpha: 0.14);
  }
}
