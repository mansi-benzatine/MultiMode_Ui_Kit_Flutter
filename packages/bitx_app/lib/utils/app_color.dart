import 'package:bitx_app/utils/utils.dart';
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
    return const Color(0xff070707);
  }

  Color get greyIndicator {
    return const Color(0xffD1D2D2);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF6A5BC2) : const Color(0xFF725DFF);
  }

  Color get primary2 {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA05DD5) : const Color(0xFFA05DD5);
  }

  Color get linear1 {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCFD7FB) : const Color(0xFF272727);
  }

  Color get linear2 {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCFD7FB).withValues(alpha: 0.3) : const Color(0xFF272727).withValues(alpha: 0.24);
  }

  LinearGradient get linearGradiant {
    return LinearGradient(
      colors: [
        linear1,
        linear2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Color get bottomNavbar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF272135) : const Color(0xFF272727);
  }

  Color get icRoundBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF272727);
  }

  Color get profileContainer {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF272727);
  }

  Color get textFieldFillColor {
    return (Theme.of(context).brightness == Brightness.light) ? transparent : transparent;
  }

  Color get dialogBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF272727);
  }

  Color get glassContainerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFEAE9EB) : const Color(0xFF1C1C1C);
  }

  Color get glassContainerColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF).withValues(alpha: 0.6) : const Color(0xFF272727).withValues(alpha: 0.3);
  }

  Color get socialIconsBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFEAE9EB) : const Color(0xFF2E2B34);
  }

  Color get bottomBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFEAE9EB) : const Color(0xFF3C3C3C);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get green {
    return const Color(0xFF2ECC71);
  }

  Color get border {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFEAE9EB) : const Color(0xFF1C1C1C);
  }

  Color get txtGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF8C8C8C) : const Color(0xFF8C8C8C);
  }

  Color get unselectedBottomBarIcon {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFBFBFBF) : const Color(0xFFBFBFBF);
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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF272135) : white;
  }

  Color get onboardingHeading {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF6A5BC2) : const Color(0xFFFFFFFF);
  }

  Color get txtSkip {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF6A5BC2) : const Color(0xFFFFFFFF);
  }

  Color get unSelectedPageIndicator {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF272135).withValues(alpha: 0.3) : const Color(0xFF2A2A2A);
  }

  Color get borderTextFormFeild {
    return (Theme.of(context).brightness == Brightness.light) ? transparent : const Color(0xFF3C3C3C);
  }

  Color get iconTextFormFeild {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff63696E) : const Color(0xff63696E);
  }

  Color get txtDarkGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff80869A) : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF070707);
  }

  Color get bottomSheetBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF272727);
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
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

  Color get bgNotificationItem {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF1F222A);
  }

  Color get txtRoundTabSelected {
    return (Theme.of(context).brightness == Brightness.light) ? black : black;
  }

  Color get expertGraphBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF35383E);
  }

  Color get depositBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF8F6B2) : const Color(0xFFF3F07B);
  }

  Color get transferBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE5C5FD) : const Color(0xFFDDB4FC);
  }

  Color get exchangeBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFC4DEF1) : const Color(0xFF8ABEE3);
  }

  Color get withdrawBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCFD7FB) : const Color(0xFFA3B2F7);
  }
}
