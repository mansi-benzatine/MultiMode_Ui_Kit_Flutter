import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00FFFFFF);
  }

  Color get primary {
    return const Color(0xFFFA662E);
  }

  Color get black {
    return const Color(0xFF000000);
  }

  Color get white {
    return const Color(0xFFFFFFFF);
  }

  Color get grey {
    return const Color(0xFFB8BBC6);
  }

  Color get bgScaffold {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF181A20);
  }

  Color get btNavigation {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF1F222A);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF021713);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF021713) : white;
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF021713) : white;
  }

  Color get reviewButton {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF021713) : const Color(0xFF1F222A);
  }

  Color get textFormFieldBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF1F1F4) : const Color(0xFF1F222A);
  }

  Color get txtGrey {
    return const Color(0xFFB8BBC6);
  }

  Color get detailScreenBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF1F1F4) : const Color(0xFF1F222A);
  }

  Color get inActiveSwitch {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF1F1F4) : const Color(0xFFFA662E).withValues(alpha: 0.38);
  }

  Color get textFormFieldBorder {
    return const Color(0xFF98A7A8).withValues(alpha: 0.20);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFB8BBC6).withValues(alpha: 0.25)
        : const Color(0xFFB8BBC6).withValues(alpha: 0.20);
  }

  Color get divider {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFB8BBC6).withValues(alpha: 0.20)
        : const Color(0xFF9EA2A7).withValues(alpha: 0.20);
  }

  Color get appBarBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFB8BBC6).withValues(alpha: 0.20) : const Color(0xFF1F222A);
  }

  Color get green {
    return const Color(0xFF7BC242);
  }

  Color get border {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF98A7A8).withValues(alpha: 0.20)
        : const Color(0xFF98A7A8).withValues(alpha: 0.20);
  }

  Color get pageIndicator {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF1F1F4) : const Color(0xFF98A7A8).withValues(alpha: 0.20);
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
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000).withValues(alpha: 0.10) : const Color(0xff262932);
  }

  Color get greyHandle {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xff000000).withValues(alpha: 0.10)
        : const Color(0xFFFFFFFF).withValues(alpha: 0.14);
  }
}
