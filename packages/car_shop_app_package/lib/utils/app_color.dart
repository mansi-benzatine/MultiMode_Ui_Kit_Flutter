import 'package:car_shop_app_package/utils/utils.dart';
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

  Color get greyIndicator {
    return const Color(0xffD1D2D2);
  }

  Color get primary2 {
    return const Color(0xff5B7FFF);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0052D4) : const Color(0xFF0052D4);
  }

  Color get txtSeeAll {
    return (Theme.of(context).brightness == Brightness.dark) ? white : primary;
  }

  LinearGradient get primaryGradient {
    return (Theme.of(context).brightness == Brightness.light)
        ? const LinearGradient(
            colors: [Color(0xFF0052D4), Color(0xFF4B6CFF), Color(0xFF58A4FB)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
        : const LinearGradient(
            colors: [Color(0xFF0052D4), Color(0xFF4B6CFF), Color(0xFF58A4FB)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          );
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get blue {
    return Colors.blue;
  }

  Color get txtGray {
    return const Color(0xFFAEAEAE);
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

  Color get bgWhiteGrey {
    return (Theme.of(context).brightness == Brightness.light) ? Colors.grey.shade100 : const Color(0xFF202423);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get txtBlackAndGray {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFFD1D1D1);
  }

  Color get txtDarkGray {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff80869A) : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF0E0F1A);
  }

  Color get bgBottomSheet {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1F222A);
  }

  Color get bgBottomBar {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1A1C1E);
  }

  Color get bgCard {
    return (Theme.of(context).brightness == Brightness.light) ? white : white.withOpacityPercent(0.05);
  }

  Color get generateQrCardBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE3E3E4) : const Color(0xff393A3D);
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

  Color get bottomBarBgColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF2F2F2) : const Color(0xFF151D1A);
  }

  Color get listTileColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withOpacityPercent(.05) : const Color(0xFF202423);
  }

  Color get listTile {
    return (Theme.of(context).brightness == Brightness.light) ? Colors.grey.shade100 : const Color(0xFF202423);
  }

  Color get unSelectedTabColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffE6FEFA) : const Color(0xFF0C110F);
  }

  Color get bgChip {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF2E3032);
  }

  Color get switchInactiveTrackColor {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffD1D1D1) : const Color(0xFF7A7B7C);
  }

  Color get bgSearchBar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF1F222A);
  }

  Color get bgNewCar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffDAB7FF) : const Color(0xffDAB7FF);
  }

  Color get bgUsedCar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffB8E4BA) : const Color(0xffB8E4BA);
  }

  Color get bgSellCar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffFFDBA9) : const Color(0xffFFDBA9);
  }

  Color get bgStar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffFABD3B) : const Color(0xffFABD3B);
  }

  Color get bgNewCarChip {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff31DF46) : const Color(0xff31DF46);
  }

  Color get bgUsedCarChip {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffFF6161) : const Color(0xffFF6161);
  }

  Color get tabColor {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get tabSelectedTxtColor {
    return (Theme.of(context).brightness == Brightness.light) ? white : white;
  }

  Color get tabSelectedTxtColor2 {
    return (Theme.of(context).brightness == Brightness.light) ? primary : white;
  }

  Color get tabTxtColor {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get tabTxtColor2 {
    return (Theme.of(context).brightness == Brightness.light) ? txtGray : txtGray;
  }

  Color get compareBtnBorder {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get compareBtnText {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtGray;
  }

  Color get bgFilterSelectionType {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF0E0F1A);
  }

  Color get bgSearchBarDialog {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xffF5F5F5) : const Color(0xFF0E0F1A);
  }

  Color get bgUsedCarCardg {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1F222A);
  }

  Color get bgUsedCarOverview {
    return (Theme.of(context).brightness == Brightness.light) ? bgSearchBar : bgSearchBarDialog;
  }

  Color get txtCarYearSelection {
    return (Theme.of(context).brightness == Brightness.light) ? primary : txtBlack;
  }

}
