import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:cinemix_app/ui/review_summary/view/review_summary_screen.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
  }

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {"name": "My Wallet", "icon": AppAssets.icWallet},
    {"name": "Google Pay", "icon": AppAssets.icGoogle},
    {"name": "Paypal", "icon": AppAssets.icPaypal},
    {"name": "Apple Pay", "icon": AppAssets.icApple},
    {"name": "**** **** **** 0158", "icon": AppAssets.icMasterCard},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtPaymentMethod,
            isShowAdd: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentMethods.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = paymentMethods[index];
                      final isSelected = index == selectedIndex;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.setHeight),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  CustomAppColor.of(context).bgSelectedShadow,
                                  CustomAppColor.of(context).bgTextFormFieldShadowLight,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 15.setWidth),
                            child: Row(
                              children: [
                                Image.asset(
                                  item["icon"],
                                  height: 18.setHeight,
                                  width: 18.setHeight,
                                ),
                                SizedBox(width: 12.setWidth),
                                Expanded(
                                  child: CommonText(
                                    text: item["name"],
                                    textAlign: TextAlign.start,
                                    fontSize: 13.setFontSize,
                                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                  ),
                                ),
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.pinkAccent : Colors.grey.shade400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, bottom: 55.setHeight, right: 20.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtContinue,
              onTap: () {
                Navigator.push(context, ReviewSummaryScreen.route());
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strAdd) {
      Navigator.push(context, AddNewCardScreen.route());
    }
  }
}
