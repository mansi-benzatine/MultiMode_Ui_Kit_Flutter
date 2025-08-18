import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/utils/utils.dart';

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
    return const Color(0xFF2DBB54);
  }

  Color get secondary {
    return const Color(0xFF0D1722);
  }

  Color get red {
    return const Color(0xFFEE5B4A);
  }

  Color get txtGray {
    return const Color(0xFF9EA2A7);
  }

  Color get txtRed {
    return red;
  }

  Color get orange {
    return const Color(0xFFFF5A51);
  }

  Color get txtWhite {
    return (Theme.of(context).brightness == Brightness.light) ? white : black;
  }

  Color get txtPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? primary : primary;
  }

  Color get txtPrimaryWhite {
    return (Theme.of(context).brightness == Brightness.light) ? primary : white;
  }

  Color get btnPrimary {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D1722) : Colors.green;
  }

  Color get btnBorder {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D1722) : const Color(0xFF9EA2A7).withValues(alpha: 0.5);
  }

  Color get txtGreyWhite {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCFD1D3).withOpacityPercent(0.4) : Colors.white;
  }

  Color get borderTextFormField {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFCFD1D3).withOpacityPercent(0.4) : Colors.white.withOpacityPercent(0.1);
  }

  Color get txtBlack {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get icBlackGreen {
    return (Theme.of(context).brightness == Brightness.light) ? black : Colors.green;
  }

  Color get icBlackWhite {
    return (Theme.of(context).brightness == Brightness.light) ? black : white;
  }

  Color get bgScreen {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF0D1722);
  }

  Color get bgAlertDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF22262F);
  }

  Color get bgPromoCode {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF6F6F7) : const Color(0xFF22262F);
  }

  Color get icDrawerBg {
    return (Theme.of(context).brightness == Brightness.light) ? black : const Color(0xFF22262F);
  }

  Color get bgDialog {
    return (Theme.of(context).brightness == Brightness.light) ? white : const Color(0xFF242827);
  }

  Color get dividerColor {
    return (Theme.of(context).brightness == Brightness.light) ? black.withValues(alpha: 0.1) : const Color(0xFF9EA2A7).withValues(alpha: 0.2);
  }

  Color get bgCallActionBlue {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF598FFF) : CustomAppColor.of(context).black.withValues(alpha: 0.3);
  }

  Color get bgCallActionGreen {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF198754) : CustomAppColor.of(context).black.withValues(alpha: 0.3);
  }

  Color get chatBubbleFromSender {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFFF5F5F5) : const Color(0xFF22262F);
  }

  Color get chatBubbleFromMe {
    return (Theme.of(context).brightness == Brightness.light) ? const Color(0xFF0D1722) : const Color(0xFF2DBB54);
  }
}
