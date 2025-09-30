import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/utils.dart';

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
    return const Color(0xff070707);
  }

  Color get greyIndicator {
    return const Color(0xffD1D2D2);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF34D1BF) : const Color(0xFF34D1BF);
  }

  Color get txtSeeAll {
    return (Theme.of(context).brightness == Brightness.dark) ? white : primary;
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get txtGray {
    return const Color(0xFFAEAEAE);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffE3E3E4) : const Color(0xFFFFFFFF).withOpacityPercent(0.20);
  }

  Color get containerBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffE6F9F7) : const Color(0xFF000000).withOpacityPercent(0.20);
  }

  Color get txtRed {
    return red;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get borderTextFormFeild {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffC9CCCB) : const Color(0xff363737);
  }

  Color get txtDarkGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff80869A) : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF0E0F1A);
  }

  Color get bgBottomSheet {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF0F1313);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF070707);
  }

  Color get bgCard {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF212121);
  }

  Color get lineColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.30) : white.withOpacityPercent(.30);
  }

  Color get bgSearchBar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF1F222A);
  }

  Color get bgNotificationItem {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF1F222A);
  }

  Color get compareBtnBorder {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get compareBtnText {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get bgBottomBar {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF212121);
  }

  Color get borderBottomBar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff373737) : const Color(0xff373737);
  }

  Color get txtBottomBar {
    return (Theme.of(context).brightness == Brightness.light) ? black : black;
  }

  Color get txtRoundTabUnselected {
    return (Theme.of(context).brightness == Brightness.light) ? black : primary;
  }

  Color get txtRoundTabSelected {
    return (Theme.of(context).brightness == Brightness.light) ? black : black;
  }
}
