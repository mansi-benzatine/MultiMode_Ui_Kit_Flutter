import 'package:flutter/material.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return const Color(0x00FFFFFF);
  }

  Color get primary {
    return const Color(0xFF4A1749);
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
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF211728);
  }

  Color get bgPinkScaffold {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFEF6FC) : const Color(0xFF211728);
  }

  Color get bgFAQ {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFEF6FC) : const Color(0xFF2D2235);
  }

  Color get imgBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x00FFFFFF) : const Color(0xFF2D2235);
  }

  Color get bgTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF2D2235);
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

  Color get txtBlackPink {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF021713) : const Color(0xFFDD8DCC);
  }

  Color get txtVelvet {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : white;
  }

  Color get bgVelvetRed {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : Colors.red;
  }

  Color get txtVelvetPink {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : const Color(0xFFDD8DCC);
  }

  Color get editPassionBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : const Color(0xFF211728);
  }

  Color get bgButton {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : const Color(0xFFDD8DCC);
  }

  Color get txtPinkWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFDD8DCC) : white;
  }

  Color get txtVelvetWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : white;
  }

  Color get txtPink {
    return const Color(0xFFDD8DCC);
  }

  Color get icBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF021713) : white;
  }

  Color get txtGrey {
    return const Color(0xFFB1B4BB);
  }

  Color get containerBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : const Color(0xFFB8BBC6).withValues(alpha: 0.20);
  }

  Color get genderImageBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF8E0F3).withValues(alpha: 0.50) : const Color(0xFF2D2235);
  }

  Color get switchInactive {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFB8BBC6).withValues(alpha: 0.5) : const Color(0xFF49314E);
  }

  Color get containerPink {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFDD8DCC) : const Color(0xFFFFFFFF).withValues(alpha: 0.20);
  }

  Color get textFormFieldBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749).withValues(alpha: 0.24) : const Color(0xFF2D2235);
  }

  Color get passionContainerBorder {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF4A1749).withValues(alpha: 0.24)
        : const Color(0xFFFFFFFF).withValues(alpha: 0.30);
  }

  Color get passionContainerBg {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFCF4FA) : const Color(0xFF2D2235);
  }

  Color get chatBubbleSender {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFEF6FC) : const Color(0xFF2D2235);
  }

  Color get divider {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF4A1749).withValues(alpha: 0.24)
        : const Color(0xFFFFFFFF).withValues(alpha: 0.12);
  }

  Color get greyDivider {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE6E6E6) : const Color(0xFFE6E6E6).withValues(alpha: 0.10);
  }

  Color get btnPink {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFDF7FD) : const Color(0xFF2D2235);
  }

  Color get inactiveSlider {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF3EAF4) : const Color(0xFFFFFFFF).withValues(alpha: 0.10);
  }

  Color get bgSwipeCard {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF49314E);
  }

  Color get bgRuleContainer {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFDF7FD) : const Color(0xFFDD8DCC).withValues(alpha: 0.1);
  }

  Color get chipBlackVelvet {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFF021713).withValues(alpha: 0.5)
        : const Color(0xFF4A1749).withValues(alpha: 0.6);
  }

  Color get icVelvetWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF4A1749) : white;
  }
}
