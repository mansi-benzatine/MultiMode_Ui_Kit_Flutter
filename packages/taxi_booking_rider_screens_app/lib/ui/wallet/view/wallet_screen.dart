import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_payment/view/add_payment_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_promo_code/view/add_promo_code_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_vouncher_code/view/add_voucher_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/top_bar/topbar.dart';

class WalletScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WalletScreen());
  }

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtWallet,
          ),
          _walletRow(
            leading: Image.asset(
              AppAssets.icCash,
              height: 20.setHeight,
              width: 32.setWidth,
            ),
            title: Languages.of(context).txtCash,
            subtitle: Languages.of(context).txtAddPaymentOrRedeemGiftCard,
            trailing: null,
            onTap: () {
              Navigator.push(context, AddPaymentScreen.route());
            },
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          _walletRow(
            leading: Image.asset(
              AppAssets.icPromotion,
              height: 28.setHeight,
              width: 28.setWidth,
              color: CustomAppColor.of(context).icBlackWhite,
            ),
            title: Languages.of(context).txtPromotions,
            subtitle: Languages.of(context).txtAddPromoCode,
            trailing: null,
            onTap: () {
              Navigator.push(context, AddPromoCodeScreen.route());
            },
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          _walletRow(
            leading: Image.asset(
              AppAssets.icCoupon,
              height: 28.setHeight,
              width: 28.setWidth,
              color: CustomAppColor.of(context).icBlackWhite,
            ),
            title: Languages.of(context).txtVouchers,
            subtitle: Languages.of(context).txtAddVoucherCode,
            trailing: CommonText(
              text: "0",
              textAlign: TextAlign.end,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            onTap: () {
              Navigator.push(context, AddVoucherScreen.route());
            },
          ),
        ],
      ),
    );
  }

  Widget _walletRow({required Widget leading, required String title, required String subtitle, Widget? trailing, VoidCallback? onTap}) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 18.setHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leading,
                  SizedBox(width: 16.setWidth),
                  CommonText(
                    text: title,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.setFontSize,
                  ),
                  if (trailing != null)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.setWidth, top: 2.setHeight),
                        child: trailing,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 12.setHeight),
              CommonText(
                text: subtitle,
                textColor: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 16.setFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
