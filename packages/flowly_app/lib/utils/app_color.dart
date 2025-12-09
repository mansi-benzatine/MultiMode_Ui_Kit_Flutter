import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00000000);
  }

  Color get white {
    return const Color(0xFFFFFFFF);
  }

  Color get secondary {
    return const Color(0xFFFD8599);
  }

  Color get black {
    return const Color(0xff000000);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFD8599) : const Color(0xFFFD8599);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get txtGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF909CA5) : const Color(0xFF8E8E8E);
  }

  Color get setYourDueDateBtn {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFDE2EB) : const Color(0xFF1B2530);
  }

  Color get roundBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : primary;
  }

  Color get txtLightGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFA4A4A4) : const Color(0xFF979797);
  }

  Color get bgLinearShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF12222E);
  }

  Color get icGray {
    return const Color(0xFFD2D2D2);
  }

  Color get txtRed {
    return red;
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? secondary : white;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get hintText {
    return const Color(0xFFB3B3B3);
  }

  Color get btnPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? secondary : secondary;
  }

  Color get borderOtp {
    return (Theme.of(context).brightness == Brightness.light) ? transparent : transparent;
  }

  Color get borderTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? secondary : const Color(0xFF303139);
  }

  Color get border {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF292929);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff1E1E1E) : white;
  }

  Color get txtBlackGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000) : const Color(0xFFA4A4A4);
  }

  Color get icBlackWhite {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF070707);
  }

  Color get bgTextFormFieldShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF8F8F8) : const Color(0xFF3E4950).withValues(alpha: 0.7);
  }

  Color get bgShadowDark {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF12222E);
  }

  Color get bgLanguageShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF12222E).withValues(alpha: 0.85) : const Color(0xFF425664).withValues(alpha: 0.4);
  }

  Color get bgTextFormFieldShadowLight {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF8F8F8) : const Color(0xFF425664).withValues(alpha: 0.33);
  }

  Color get bgAlertDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF22262F);
  }

  Color get bottomSheetBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF26272D);
  }

  Color get grey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE6E6E6) : const Color(0xFF292929);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF9EA2A7).withValues(alpha: 0.2);
  }

  Color get socialMediaCard {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF2A2D35);
  }

  Color get cardBorder {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF909CA5);
  }

  Color get selectedTabBar {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF303139);
  }

  Color get subscriptionBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF93D5E1);
  }

  Color get txtBlackSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF93D5E1);
  }

  Color get subscriptionContainerBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF93D5E1) : const Color(0xFF2B2C34);
  }

  Color get helpCenterBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF2B2C34);
  }

  Color get btnGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF0F0F0) : const Color(0xFF253745);
  }

  Color get profileIconBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF0F0F0) : const Color(0xFF393939);
  }

  Color get textFormFieldBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF42434B);
  }

  Color get bgSelectedShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF3E4950).withValues(alpha: 0.7);
  }

  Color get bgSelectedShadowDark {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF12222E).withValues(alpha: 0.3);
  }

  Color get btnNavigation {
    return (Theme.of(context).brightness == Brightness.light) ? secondary : const Color(0xFF070707);
  }

  Color get icWhitePrimary {
    return (Theme.of(context).brightness == Brightness.light) ? white : secondary;
  }

  Color get pinkBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFCCD5) : const Color(0xFF070707);
  }

  Color get yellowBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFEEDE1) : const Color(0xFF070707);
  }

  Color get lightYellowBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFEEDE1).withValues(alpha: 0.1) : const Color(0xFF070707);
  }

  Color get whiteGreyIndicator {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1A1A1A);
  }

  Color get unfilledBorderTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE0DEDC) : const Color(0xFF393939);
  }

  Color get horizontalBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE0DEDC) : const Color(0xFF1A1A1A);
  }

  Color get cardBg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1A1A1A);
  }

  Color get offWhiteCardBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF1A1A1A);
  }

  Color get symptomsBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF070707);
  }

  Color get txtGrayWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF909CA5) : white;
  }

  Color get pillBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE9F6F6) : const Color(0xFF070707);
  }

  Color get yellowLight {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFF9B8) : const Color(0xFFC1BB83);
  }

  Color get navbarBg {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF393939);
  }

  Color get unselectedNavbar {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF282828);
  }
}
