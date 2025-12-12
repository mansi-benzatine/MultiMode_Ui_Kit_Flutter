import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/alert_dialog/success_dialog.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class PaymentMethodScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
  }

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  int? selectedIndex;

  final List<Map<String, dynamic>> paymentOptions = [
    {'title': 'My Wallet', 'icon': Icons.account_balance_wallet_rounded},
    {'title': 'Google Pay', 'icon': Icons.payments_rounded},
    {'title': 'Paypal', 'icon': Icons.paypal_outlined},
    {'title': 'Apple Pay', 'icon': Icons.apple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWhiteBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  this,
                  title: Languages.of(context).txtMiviPro,
                  isShowBack: true,
                  appBarColor: CustomAppColor.of(context).transparent,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtPaymentMethod,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 18.setFontSize,
                              ),
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                borderRadius: BorderRadius.circular(30),
                                child: const Icon(Icons.close_rounded, size: 24),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.setHeight),
                          Wrap(
                            spacing: 12.setWidth,
                            runSpacing: 12.setHeight,
                            alignment: WrapAlignment.center,
                            children: List.generate(paymentOptions.length, (index) {
                              final option = paymentOptions[index];
                              final bool isSelected = selectedIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  setState(() => selectedIndex = index);
                                },
                                child: Container(
                                  width: (MediaQuery.of(context).size.width - 60) / 2,
                                  padding: EdgeInsets.symmetric(vertical: 16.setHeight),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).border,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: CustomAppColor.of(context).transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        option['icon'],
                                        color: CustomAppColor.of(context).icBlackWhite,
                                        size: 22.setWidth,
                                      ),
                                      SizedBox(width: 8.setWidth),
                                      CommonText(
                                        text: option['title'],
                                        fontFamily: Constant.fontFamilyBold700,
                                        fontSize: 12.setFontSize,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 40.setHeight),
                          CommonButton(
                              text: Languages.of(context).txtContinue,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return SuccessDialog(parentContext: context);
                                  },
                                );
                              }),
                          SizedBox(height: 20.setHeight),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
