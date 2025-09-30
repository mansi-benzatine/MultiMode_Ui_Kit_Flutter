import 'package:flutter/material.dart';
import 'package:stoxy_app_package/utils/utils.dart';

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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF6C31DA) : const Color(0xFF6C31DA);
  }

  Color get primaryLight {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF0E8FB) : primary2.withValues(alpha: 0.3);
  }

  Color get notificationImageBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF282F36);
  }

  Color get homeGraph {
    return (Theme.of(context).brightness == Brightness.light) ? primary.withOpacityPercent(0.2) : const Color(0xFF282F36);
  }

  Color get primary2 {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA05DD5) : const Color(0xFFA05DD5);
  }

  LinearGradient get primaryGradient {
    return LinearGradient(
      colors: [
        primary2,
        primary,
      ],
    );
  }

  Color get textFieldFillColor {
    return (Theme.of(context).brightness == Brightness.light) ? transparent : const Color(0xFF282F36);
  }

  Color get dialogBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF282F36);
  }

  Color get profileContainerBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF282F36);
  }

  Color get txtSeeAll {
    return (Theme.of(context).brightness == Brightness.dark) ? white : primary;
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get green {
    return const Color(0xFF2ECC71);
  }

  Color get txtGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA4A4A4) : const Color(0xFFA4A4A4);
  }

  Color get txtDescriptionGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF63696E) : const Color(0xFFCACACA);
  }

  Color get txtLightWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE6E6E6) : const Color(0xFF252B30);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffE3E3E4) : const Color(0xFFFFFFFF).withOpacityPercent(0.20);
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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffBFC1C3) : transparent;
  }

  Color get iconTextFormFeild {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff63696E) : const Color(0xffCACACA);
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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : white.withOpacityPercent(.05);
  }

  Color get lineColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.30) : white.withOpacityPercent(.30);
  }

  Color get bgSearchBar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF1F222A);
  }

  Color get bottomNavigation {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffFFFFFF) : const Color(0xFF222B33);
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

  Color get searchFieldBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF6C31DA);
  }

  Color get expertGraphBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF35383E);
  }
}
