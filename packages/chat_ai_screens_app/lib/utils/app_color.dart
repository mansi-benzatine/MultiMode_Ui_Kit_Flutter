import 'package:chat_ai_screens_app_package/utils/utils.dart';
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
    return const Color(0xFF07EBC0);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get blue {
    return Colors.blue;
  }

  Color get txtGray {
    return const Color(0xFF63696E);
  }

  Color get txtRed {
    return red;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withOpacityPercent(0.20)
        : const Color(0xFFFFFFFF).withOpacityPercent(0.20);
  }

  Color get bgWhiteGrey {
    return (Theme.of(context).brightness == Brightness.light) ? Colors.grey.shade100 : const Color(0xFF202423);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get txtBlackAndGray {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFFD1D1D1);
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF050807);
  }

  Color get bgCard {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.05) : white.withOpacityPercent(0.05);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF242827);
  }

  Color get emptyDotColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.1) : white.withOpacityPercent(.3);
  }

  Color get progressColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get lineColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.30) : white.withOpacityPercent(.30);
  }

  Color get listTile {
    return (Theme.of(context).brightness == Brightness.light) ? Colors.grey.shade100 : const Color(0xFF202423);
  }

  Color get bottomBarBgColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF2F2F2) : const Color(0xFF151D1A);
  }

  Color get searchBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacityPercent(0.05);
  }

  Color get listTileColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.05) : const Color(0xFF202423);
  }

  Color get greyHandle {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withOpacityPercent(0.10)
        : const Color(0xFFFFFFFF).withOpacityPercent(0.14);
  }

  Color get unSelectedTabColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffE6FEFA) : const Color(0xFF0C110F);
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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000).withOpacityPercent(0.10) : const Color(0xff262932);
  }
}
