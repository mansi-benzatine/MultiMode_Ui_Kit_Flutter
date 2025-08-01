import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

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

  Color get greyIndicator {
    return const Color(0xffD1D2D2);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF27948D)
        : const Color(0xFF39CFC7);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get blue {
    return Colors.blue;
  }

  Color get txtGray {
    return const Color(0xFF8E8E8E);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xffE3E3E4)
        : const Color(0xFFFFFFFF).withOpacityPercent(0.20);
  }

  Color get txtRed {
    return red;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get bgWhiteGrey {
    return (Theme.of(context).brightness == Brightness.light)
        ? Colors.grey.shade100
        : const Color(0xFF202423);
  }

  Color get searchBg {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFFFFFFF)
        : const Color(0xFFFFFFFF).withOpacityPercent(0.05);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get txtBlackAndGray {
    return (Theme.of(context).brightness == Brightness.light)
        ? black
        : const Color(0xFFD1D1D1);
  }

  Color get txtDarkGray {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff656565)
        : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF232528);
  }

  Color get bgBottomBar {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF1A1C1E);
  }

  Color get bgCard {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : white.withOpacityPercent(0.05);
  }

  Color get generateQrCardBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFE3E3E4)
        : const Color(0xff393A3D);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF242827);
  }

  Color get emptyDotColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? black.withOpacityPercent(.1)
        : white.withOpacityPercent(.3);
  }

  Color get progressColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get lineColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? black.withOpacityPercent(.30)
        : white.withOpacityPercent(.30);
  }

  Color get bottomBarBgColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFF2F2F2)
        : const Color(0xFF151D1A);
  }

  Color get listTileColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? black.withOpacityPercent(.05)
        : const Color(0xFF202423);
  }

  Color get listTile {
    return (Theme.of(context).brightness == Brightness.light)
        ? Colors.grey.shade100
        : const Color(0xFF202423);
  }

  Color get unSelectedTabColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xffE6FEFA)
        : const Color(0xFF0C110F);
  }

  Color get bgChip {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xffF5F5F5)
        : const Color(0xFF2E3032);
  }

  Color get switchInactiveTrackColor {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xffD1D1D1)
        : const Color(0xFF7A7B7C);
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
