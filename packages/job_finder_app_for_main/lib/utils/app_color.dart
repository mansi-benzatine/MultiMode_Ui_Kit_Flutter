import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

class CustomAppColor {
  final BuildContext context;

  const CustomAppColor(this.context);

  static CustomAppColor of(BuildContext context) => CustomAppColor(context);

  Color get transparent {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x00FFFFFF) : const Color(0x00FFFFFF);
  }

  Color get bgWhiteSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF4B3E71);
  }

  Color get bgTextFormFieldWhiteSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF4B3E71);
  }

  Color get bgTextFormFieldGreySecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF2F2F3) : const Color(0xFF4B3E71);
  }

  Color get white {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  }

  Color get black {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xff000000) : const Color(0xff000000);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D0D26) : const Color(0xFFFFFFFF);
  }

  Color get primary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFF352961);
  }

  Color get secondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFFFE8280);
  }

  Color get bgSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFF4B3E71);
  }

  Color get bgChatBubbleSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFF4B3E71);
  }

  Color get bgChatBubblePrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280).withOpacityPercent(0.1) : const Color(0xFFFE8280);
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFF352961);
  }

  Color get bgNavBarWhiteSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF4B3E71).withOpacityPercent(0.2);
  }

  Color get txtRed {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFF0500) : const Color(0xFFFE8280);
  }

  Color get txtSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFFFE8280);
  }

  Color get txtSecondaryWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFFFFFFFF);
  }

  Color get txtBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF112756) : const Color(0xFFFFFFFF);
  }

  Color get grey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFF95969D);
  }

  Color get txtGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFF95969D);
  }

  Color get txtHintGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFF95969D);
  }

  Color get containerGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE1E1E1) : const Color(0xFFFFFFFF).withOpacityPercent(0.15);
  }

  Color get containerLightBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF0EDF7) : const Color(0xFF4B3E71);
  }

  Color get bgScreenWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFBFBFB) : const Color(0xFF352961);
  }

  Color get bgBackIcon {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFBFBFB) : const Color(0xFF685F89);
  }

  Color get bsDragHandle {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFE1E1E1) : const Color(0xFF352961);
  }

  Color get bgDetailsCard {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFF4B3E71);
  }

  Color get icGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFF95969D);
  }

  Color get ratingDivider {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D).withOpacityPercent(0.2) : const Color(0xFF685F89);
  }

  Color get icPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFFFE8280);
  }

  Color get icPrimaryWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFFFFFFFF);
  }

  Color get txtWhitePrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFFFE8280);
  }

  Color get txtPrimaryWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFFFFFFFF);
  }

  Color get icNavBar {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFF685F89);
  }

  Color get bgContainerPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFF352961);
  }

  Color get bgContainerSecondary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFE8280) : const Color(0xFFFE8280);
  }

  Color get bgContainerPrimaryShadow {
    return (Theme.of(context).brightness == Brightness.light)
        ? const Color(0xFFFE8280).withOpacityPercent(0.2)
        : const Color(0xFFFE8280).withOpacityPercent(0.2);
  }

  Color get bgTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF2F2F3) : const Color(0xFFF2F2F3);
  }

  Color get txtGreen {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0E9D57) : const Color(0xFF0E9D57);
  }

  Color get txtLightBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5386E4) : const Color(0xFF5386E4);
  }

  Color get txtSecondaryGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF352961) : const Color(0xFFA59FB8);
  }

  Color get borderWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacityPercent(0.15);
  }

  Color get txtGreyWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFFFFFFFF);
  }

  Color get icGreyWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF95969D) : const Color(0xFFFFFFFF);
  }

  Color get icWhiteGrey {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFFFFFF) : const Color(0xFF95969D);
  }

  Color get bgGreen {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0E9D57).withOpacityPercent(0.1) : const Color(0xFFE8FDF2);
  }

  Color get bgRed {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFF0500).withOpacityPercent(0.1) : const Color(0xFFFFEDED);
  }

  Color get red {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFF0500) : const Color(0xFFFF0500);
  }

  Color get bgBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF5386E4).withOpacityPercent(0.1) : const Color(0xFFFFFFFF);
  }
}
