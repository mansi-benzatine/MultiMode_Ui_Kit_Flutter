import 'package:flutter/material.dart';
import 'package:stoxy_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:stoxy_app_package/ui/edit_card/views/edit_card_screen.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/preference.dart';
import 'package:stoxy_app_package/utils/service_locator.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/button/common_button.dart';
import 'package:stoxy_app_package/widgets/top_bar/topbar.dart';

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
        body: Container(
          decoration: BoxDecoration(
            image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                ? null
                : DecorationImage(
                    image: AssetImage(
                      AppAssets.imgCommonBackground,
                    ),
                  ),
          ),
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtPaymentMethod,
                isShowBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                  child: Column(
                    children: [
                      _buildSettingsItem(
                        title: "My Wallet",
                        isDestructive: true,
                        icon: AppAssets.icNotificationWallet,
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
                        isDestructive: true,
                        icon: AppAssets.icNotificationWallet,
                        onTap: () {
                          Navigator.push(context, EditCardScreen.route());
                        },
                      ),
                      _buildSettingsItem(
                        title: "**** **** **** 1234",
                        isDestructive: true,
                        icon: AppAssets.icNotificationWallet,
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
                child: CommonButton(
                  onTap: () => Navigator.push(context, AddNewCardScreen.route()),
                  text: Languages.of(context).txtAddNewCard,
                ),
              )
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

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 10.setHeight),
          padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 10.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgCard,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).txtWhite,
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
                  fontFamily: Constant.fontFamily,
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
          )),
    );
  }
}
