import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00FFFFFF);
  }

  Color get primary {
    return const Color(0xFF8C66F4);
  }

  Color get black {
    return const Color(0xFF000000);
  }

  Color get white {
    return const Color(0xFFFFFFFF);
  }

  Color get bgScaffold {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF24232A);
  }

  Color get bottomNavbar {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get grey {
    return const Color(0xFFB8BBC6);
  }

  Color get lightPurple {
    return const Color(0xFFF4F0FD);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF021713);
  }

  Color get txtPurple {
    return const Color(0xFF8C66F4);
  }

  Color get txtPurpleWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF8C66F4)
        : white;
  }

  Color get txtWhitePurple {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF8C66F4);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : white;
  }

  Color get txtBlackPurple {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : const Color(0xFF8C66F4);
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713)
        : white;
  }

  Color get icWhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF021713);
  }

  Color get divider {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFE7DFFD)
        : white;
  }

  Color get containerBgPurple {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFF4F0FD)
        : const Color(0xFF3C3A46);
  }

  Color get containerBgwhite {
    return (Theme.of(context).brightness == Brightness.light)
        ? white
        : const Color(0xFF3C3A46);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFCCCCCC)
        : const Color(0xFF3C3A46);
  }

  Color get containerGreyBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF24232A).withValues(alpha: 20)
        : const Color(0xFF919194);
  }

  Color get containerBgLightPurple {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFF4F0FD)
        : white;
  }

  Color get txtLightPurple {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFD1C2FB)
        : white;
  }

  Color get txtGreyLightGrey {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF9195B6)
        : const Color(0xFFD7D5DC);
  }

  Color get containerBlack {
    return (Theme.of(context).brightness == Brightness.light)
        ? black
        : const Color(0xFF3C3A46);
  }

  Color get txtGrey {
    return const Color(0xFF9195B6);
  }

  Color get greyDivider {
    return const Color(0xFFCCCCCC);
  }

  Color get purpleDivider {
    return const Color(0xFFA385F6);
  }

  Color get lime {
    return Colors.lime;
  }
}
