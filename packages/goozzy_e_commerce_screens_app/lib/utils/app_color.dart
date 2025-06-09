import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.transparent : AppColor.transparent;
  }

  Color get bgScaffold {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.bgScaffold;
  }

  Color get bgBlackWhiteScaffold {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.black;
  }

  Color get white {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.white;
  }

  Color get bgFilter {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.bgScaffold;
  }

  Color get red {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtRed : AppColor.txtRed;
  }

  Color get black {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.black;
  }

  Color get green {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.green : AppColor.green;
  }

  Color get darkGreen {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.darkGreen : AppColor.darkGreen;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtWhite : AppColor.txtBlack;
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtBlack : AppColor.txtWhite;
  }

  Color get txtBlackGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtBlack : AppColor.txtGrey;
  }

  Color get txtPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtPurple : AppColor.txtPurple;
  }

  Color get txtAppBar {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtBlack : AppColor.txtPurple;
  }

  Color get txtBlue {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtBlue : AppColor.txtBlue;
  }

  Color get txtGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtGrey : AppColor.txtGrey;
  }

  Color get txtOrange {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtOrange : AppColor.txtOrange;
  }

  Color get txtBlackPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.btnPurple;
  }

  Color get hintText {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.hintGrey : AppColor.hintGrey;
  }

  Color get borderGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.borderGrey : AppColor.borderGrey;
  }

  Color get dividerGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.containerBorder : AppColor.containerGrey;
  }

  Color get borderPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.borderPurple : AppColor.borderPurple;
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.containerBorder : AppColor.white.withOpacityPercent(0.05);
  }

  Color get bgContainer {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.containerGrey;
  }

  Color get textFieldBorder {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.textFieldBorder : AppColor.containerGrey;
  }

  Color get btnPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnPurple : AppColor.btnPurple;
  }

  Color get btnWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.bgScaffold;
  }

  Color get indicator {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.indicator : AppColor.borderGrey;
  }

  Color get icPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.icPurple : AppColor.icPurple;
  }

  Color get icGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgScaffold : AppColor.icGrey;
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.white;
  }

  Color get icWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.black;
  }

  Color get icBlackPurple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.btnPurple;
  }

  Color get bgTopBar {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgTopBar : AppColor.black;
  }

  Color get bgNavBar {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.black;
  }

  Color get bgContainerRed {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.containerRed : AppColor.containerRed;
  }

  Color get bgContainerGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtGrey : AppColor.txtGrey;
  }

  Color get bgBottomSheet {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.white;
  }

  Color get bgPurpleBlack {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnPurple.withOpacityPercent(0.2) : AppColor.bgScaffold;
  }

  Color get bgSkyBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF66D1E7) : const Color(0xFF66D1E7);
  }

  Color get bgDarkBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5787DC) : const Color(0xFF5787DC);
  }

  Color get greyHandle {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withOpacityPercent(0.10)
        : const Color(0xFFFFFFFF).withOpacityPercent(0.14);
  }

  Color get listTileColorScreenList {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xff262932);
  }

  Color get listTileShadow {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000).withOpacityPercent(0.10) : const Color(0xff262932);
  }
}

class AppColor {
  static const primary = Color(0xFFFFFFFF);
  static const txtSecondary = Color(0xffFFFFFF);
  static const bgScaffold = Color(0xff181A20);
  static const txtWhite = Color(0xffFFFFFF);
  static const txtGrey = Color(0xff9EA6BE);
  static const txtBlue = Color(0xff383EAF);
  static const txtPurple = Color(0xff7165E3);
  static const txtRed = Color(0xffFF4141);
  static const txtOrange = Color(0xffFF9B00);
  static const txtBlack = Color(0xff000000);
  static const txtDarkBlue = Color(0xff006DF0);
  static const hintGrey = Color(0xffAFB0B6);
  static const containerGrey = Color(0xff1F222A);

  static const transparent = Color(0x00FFFFFF);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xff000000);
  static const grey = Color(0xff95969D);
  static const bgTopBar = Color(0xffF9F9FB);
  static const green = Color(0xff2AB126);
  static const darkGreen = Color(0xff128C7E);
  static const yellow = Color(0xffF7E632);
  static const red = Color(0xffEF3A10);
  static const orange = Color(0xffF7A521);

  static const btnPurple = Color(0xff7165E3);
  static const indicator = Color(0xffABBBFF);
  static const borderGrey = Color(0xff9EA6BE);
  static const borderPurple = Color(0xff7165E3);
  static const containerBorder = Color(0xffEEEEEE);
  static const textFieldBorder = Color(0xffEEEEEE);
  static const icPurple = Color(0xff7165E3);
  static const icGrey = Color(0xffEEEEEE);

  static const containerGreen = Color(0xffCAFFCA);
  static const containerBlue = Color(0xffC2F1FF);
  static const containerPink = Color(0xffFFCDDB);
  static const containerOrange = Color(0xffFFC0BE);
  static const containerRed = Color(0xffFF2762);
  static const containerLightBlue = Color(0xff65C5E3);

  static const cardBlue = Color(0xffDFF7FC);
  static const cardPink = Color(0xffFBE9F1);
  static const cardYellow = Color(0xffFDF4E6);
}
