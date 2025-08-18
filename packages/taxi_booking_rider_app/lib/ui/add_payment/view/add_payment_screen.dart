import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/ui/add_card/view/add_card_screen.dart';
import 'package:taxi_booking_rider_app_package/ui/gift_card/view/gift_card_screen.dart';
import 'package:taxi_booking_rider_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_rider_app_package/widgets/top_bar/topbar.dart';

class AddPaymentScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddPaymentScreen());
  }

  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(this, title: Languages.of(context).txtAddPayment),
          _paymentOption(
            AppAssets.icAmazon,
            Languages.of(context).txtPayViaAmazonPay,
            () {},
          ),
          Divider(color: CustomAppColor.of(context).dividerColor),
          _paymentOption(
            AppAssets.icCard,
            Languages.of(context).txtCreditOrDebitCard,
            () {
              Navigator.push(context, AddCardScreen.route());
            },
          ),
          Divider(color: CustomAppColor.of(context).dividerColor),
          _paymentOption(
            AppAssets.icPaytm,
            Languages.of(context).txtPayViaPaytm,
            () {},
          ),
          Divider(color: CustomAppColor.of(context).dividerColor),
          _paymentOption(
            AppAssets.icGiftCard,
            Languages.of(context).txtGiftCard,
            () {
              Navigator.push(context, GiftCardScreen.route());
            },
          ),
        ],
      ),
    );
  }

  Widget _paymentOption(String logo, String text, VoidCallback onTap) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 22.setWidth),
      leading: Image.asset(
        logo,
        width: 72.setWidth,
        height: 50.setHeight,
      ),
      title: CommonText(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 16.setFontSize,
        textAlign: TextAlign.start,
      ),
      onTap: onTap,
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
