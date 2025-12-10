import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/alert_dialog/plan_activated_alert_dialog.dart';

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
    {"name": "Google Pay", "icon": AppAssets.icGooglePay},
    {"name": "Paypal", "icon": AppAssets.icPaypal},
    {"name": "Apple Pay", "icon": AppAssets.icUnfilledApple},
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
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: paymentMethods.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (_, __) => Divider(height: 25.setHeight),
                    itemBuilder: (context, index) {
                      final item = paymentMethods[index];
                      final isSelected = index == selectedIndex;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              item["icon"],
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CommonText(
                                text: item["name"],
                                textAlign: TextAlign.start,
                                fontSize: 15,
                                fontFamily: Constant.fontFamilyMedium500,
                              ),
                            ),
                            Icon(
                              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                              color: isSelected ? Colors.pinkAccent : Colors.grey.shade400,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 25.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      onTap: () => Navigator.push(context, AddNewCardScreen.route()),
                      text: Languages.of(context).txtAddNewCard,
                      buttonColor: CustomAppColor.of(context).bgScreen,
                      buttonTextColor: CustomAppColor.of(context).secondary,
                      height: 45.setHeight,
                      imageSize: 18,
                      image: AppAssets.icAddSecondary,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, bottom: 50.setHeight, right: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtUpgradeNow,
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const PlanActivatedAlertDialog();
                    },
                  );
                },
              ),
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
  }
}
