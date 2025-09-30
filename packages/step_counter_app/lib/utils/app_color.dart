import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/utils.dart';

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

  Color get primary {
    return const Color(0xFF5B6DFF);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get lightBlueColor {
    return const Color(0xFFEFF1FE);
  }

  Color get bgGray {
    return const Color(0xFFECECEC);
  }

  Color get txtRed {
    return const Color(0xFFEC4B59);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get txtPrimary {
    return primary;
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get txtGray {
    return const Color(0xFFBDBDBD);
  }

  Color get txtDarkGray {
    return const Color(0xFFA9A9A9);
  }

  Color get txtDoubleDarkGray {
    return const Color(0xFF4F4F4F);
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF181A20);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : bgContainerBlack;
  }

  Color get bgContainerBlack {
    return const Color(0xFF1F222A);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.15) : white.withValues(alpha: 0.15);
  }

  Color get borderColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.15) : white.withValues(alpha: 0.15);
  }

  Color get borderColorPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? primary.withValues(alpha: 0.15) : primary;
  }

  Color get borderColorPrimaryAndWhite {
    return (Theme.of(context).brightness == Brightness.light) ? primary.withValues(alpha: 0.15) : white.withValues(alpha: 0.15);
  }

  Color get borderColorDark {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.15) : bgContainerBlack;
  }

  Color get bgContainerLightAndDark {
    return (Theme.of(context).brightness == Brightness.light) ? lightBlueColor : bgContainerBlack;
  }

  Color get bgContainerWhiteAndBlack {
    return (Theme.of(context).brightness == Brightness.light) ? white : bgContainerBlack;
  }

  Color get bgContainerGrayAndBlack {
    return (Theme.of(context).brightness == Brightness.light) ? bgGray : bgContainerBlack;
  }

  Color get bgContainerTimes {
    return (Theme.of(context).brightness == Brightness.light) ? colorTimes.withOpacityPercent(0.27) : bgContainerBlack;
  }

  Color get colorSteps {
    return const Color(0xFF74D049);
  }

  Color get colorCalories {
    return const Color(0xFFFA9038);
  }

  Color get colorDistance {
    return const Color(0xFFD432F8);
  }

  Color get colorTimes {
    return const Color(0xFFF7CF37);
  }

  Color get colorWater {
    return const Color(0xFF6BCBE0);
  }

  Color get colorSleep {
    return const Color(0xFFBA84FB);
  }

  Color get colorAchievements {
    return const Color(0xFFFB89A5);
  }

  Color get colorHomeContainerSteps {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF74D049).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerCalories {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFA9038).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerDistance {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFD432F8).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerTimes {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF7CF37).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerWater {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF6BCBE0).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerSleep {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFBA84FB).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorHomeContainerAchievements {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFFB89A5).withValues(alpha: 0.15) : const Color(0xFF1F222A);
  }

  Color get colorContainerSteps {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF74D049);
  }

  Color get colorContainerCalories {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFFFA9038);
  }

  Color get colorContainerDistance {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFFD432F8);
  }

  Color get colorContainerTimes {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFFF7CF37);
  }

  Color get colorContainerWater {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF6BCBE0);
  }

  Color get colorContainerSleep {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFFBA84FB);
  }

  Color get colorContainerAchievements {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFFFB89A5);
  }

  Color get bgContainerColorSteps {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x2474D049) : bgContainerBlack;
  }

  Color get bgContainerBorderColorSteps {
    return (Theme.of(context).brightness == Brightness.light) ? colorSteps : bgContainerBlack;
  }

  Color get bgContainerBlackAndStepColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : colorSteps;
  }

  Color get bgContainerColorCalories {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x24FA9038) : bgContainerBlack;
  }

  Color get bgContainerBorderColorCalories {
    return (Theme.of(context).brightness == Brightness.light) ? colorCalories : bgContainerBlack;
  }

  Color get bgContainerBlackAndCaloriesColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : colorCalories;
  }

  Color get bgContainerColorDistance {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x24D432F8) : bgContainerBlack;
  }

  Color get bgContainerBorderColorDistance {
    return (Theme.of(context).brightness == Brightness.light) ? colorDistance : bgContainerBlack;
  }

  Color get bgContainerBlackAndDistanceColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : colorDistance;
  }

  Color get bgContainerColorSleep {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0x24F7CF37) : bgContainerBlack;
  }

  Color get bgContainerBorderColorSleep {
    return (Theme.of(context).brightness == Brightness.light) ? colorTimes : bgContainerBlack;
  }

  Color get bgContainerBlackAndSleepColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : colorTimes;
  }

  Color get bgContainerBorderColorWater {
    return (Theme.of(context).brightness == Brightness.light) ? colorWater.withOpacityPercent(0.24) : bgContainerBlack;
  }

  Color get bgContainerBlackAndWaterColor {
    return (Theme.of(context).brightness == Brightness.light) ? black : colorWater;
  }

  Color get colorDisabledDays {
    return const Color(0xFF8F9BB3);
  }
}
