import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:bitx_screens_app/ui/edit_card/views/edit_card_screen.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
  }

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPaymentMethod,
              isShowBack: true,
              isShowAdd: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      title: "My Wallet",
                      icon: AppAssets.icWallet,
                      onTap: () {},
                    ),
                    _buildSettingsItem(
                      title: "Google Pay",
                      isDestructive: false,
                      icon: AppAssets.icGoogle,
                      onTap: () {},
                    ),
                    _buildSettingsItem(
                      title: "Paypal",
                      icon: AppAssets.icPayPal,
                      onTap: () {},
                    ),
                    _buildSettingsItem(
                      title: "Apple Pay",
                      icon: AppAssets.icApple,
                      onTap: () {},
                    ),
                    _buildSettingsItem(
                      title: "**** **** **** 1234",
                      icon: AppAssets.icVisa,
                      onTap: () {
                        Navigator.push(context, EditCardScreen.route());
                      },
                    ),
                    _buildSettingsItem(
                      title: "**** **** **** 1234",
                      icon: AppAssets.icNotificationCreditCard,
                      onTap: () {
                        Navigator.push(context, EditCardScreen.route());
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  onTap: () => Navigator.push(context, AddNewCardScreen.route()),
                  text: Languages.of(context).txtContinue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    switch (name) {
      case Constant.strBack:
        Navigator.pop(context);
        break;
      case Constant.strAdd:
        Navigator.push(context, AddNewCardScreen.route());
        break;
    }
  }

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.setHeight),
          padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 10.setWidth),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: CustomAppColor.of(context).bottomBorder,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.setHeight)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).icRoundBg,
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                  color: isDestructive ? CustomAppColor.of(context).txtBlack : null,
                  width: 18.setWidth,
                  height: 18.setHeight,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              if (!isDestructive)
                Icon(
                  Icons.arrow_forward_ios,
                  color: CustomAppColor.of(context).txtBlack,
                  size: 16.setWidth,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
