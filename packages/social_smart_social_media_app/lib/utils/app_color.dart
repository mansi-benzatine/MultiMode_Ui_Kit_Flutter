import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.transparent : AppColor.bgShadow;
  }

  Color get bgScaffold {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : const Color(0xff181A20);
  }

  Color get white {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.white;
  }

  Color get black {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.black;
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtWhite : AppColor.txtBlack;
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtBlack : AppColor.txtWhite;
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.transparent : AppColor.black;
  }

  Color get txtRed {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtRed : AppColor.txtRed;
  }

  Color get txtGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.grey : AppColor.txtWhite;
  }

  Color get grey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.grey : AppColor.grey;
  }

  Color get containerGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.grey : AppColor.grey;
  }

  Color get bgScreenWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.white;
  }

  Color get txtPurple {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff673AB3) : AppColor.white;
  }

  Color get txtLightGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtGrey : const Color(0xFF9E9E9E);
  }

  Color get txtDarkGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtDarkGrey2 : const Color(0xFF9E9E9E);
  }

  Color get purple {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.txtPurple : AppColor.txtPurple;
  }

  Color get btnBg {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.btnBg;
  }

  Color get btnBorderGrey {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.grey : AppColor.black;
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.black : AppColor.white;
  }

  Color get icWhite {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.black;
  }

  Color get icGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF9E9E9E) : const Color(0xFF9E9E9E);
  }

  Color get bgTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgTextFormField : AppColor.btnBg;
  }

  Color get bgContainerBg {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.btnBg;
  }

  Color get btnBgPink {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnPink : AppColor.btnBg;
  }

  Color get bgGradiant1 {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnGradiant1 : AppColor.btnGradiant1;
  }

  Color get bgGradiant2 {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnGradiant2 : AppColor.btnGradiant2;
  }

  Color get bgContainer {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.grey : AppColor.btnBg;
  }

  Color get bgDivider {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnBg : AppColor.btnBg;
  }

  Color get bgBottomSheet {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : AppColor.btnBg;
  }

  Color get bgShadow {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgTextFormField : AppColor.btnBg;
  }

  Color get bgShadowTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnLightGrey.withOpacityPercent(0.2) : AppColor.bgBottom;
  }

  Color get divider {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnGrey : AppColor.bgShadow;
  }

  Color get bgBottom {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgShadow : AppColor.bgShadow;
  }

  Color get containerBg {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.white : const Color(0xff181A20);
  }

  Color get imageBg {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.bgImage : AppColor.txtPurple;
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? AppColor.btnGrey : AppColor.bgBottom;
  }
}

class AppColor {
  static const primary = Color(0xFFFFFFFF);

  static const txtSecondary = Color(0xffFFFFFF);
  static const txtWhite = Color(0xffFFFFFF);
  static const txtGrey = Color(0xff585858);
  static const txtDarkGrey = Color(0xff757575);
  static const txtDarkGrey2 = Color(0xff616161);
  static const txtPurple = Color(0xff673AB3);
  static const txtRed = Color(0xffFF4141);
  static const txtBlack = Color(0xff000000);

  static const transparent = Color(0x00FFFFFF);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xff000000);
  static const grey = Color(0xff95969D);

  static const bgShadow = Color(0xff181A20);
  static const bgBottom = Color(0xff35383F);
  static const bgGreen = Color(0xff35CC00);
  static const bgRed = Color(0xffE12828);
  static const bgTextFormField = Color(0xffFAFAFA);
  static const bgImage = Color(0xffE5EAFB);

  static const btnBg = Color(0xff1F222A);
  static const btnGrey = Color(0xffEEEEEE);
  static const btnLightGrey = Color(0xffBDBDBD);
  static const btnPink = Color(0xffF4ECFF);
  static const btnGradiant1 = Color(0xFF9D59FF);
  static const btnGradiant2 = Color(0xFF7210FF);
  static const btnOrange = Color(0xFFFB9400);
  static const btnOlive = Color(0xFF22BB9C);
  static const btnRed = Color(0xFFFF4D67);
}
