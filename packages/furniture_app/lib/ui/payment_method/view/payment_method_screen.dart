import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

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
    {"name": "Apple Pay", "icon": AppAssets.icApple1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtPaymentMethod,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(paymentMethods.length, (index) {
                        final method = paymentMethods[index];
                        final isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 26,
                            padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
                            decoration: BoxDecoration(
                              color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  method["icon"],
                                  height: 22.setHeight,
                                  width: 22.setWidth,
                                  color: isSelected
                                      ? Colors.white
                                      : index == 3 || index == 0
                                          ? CustomAppColor.of(context).icBlackWhite
                                          : null,
                                ),
                                Expanded(
                                  child: CommonText(
                                    text: method["name"],
                                    fontSize: 14,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                    textColor: isSelected ? Colors.white : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            _amountView(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CommonButton(
                onTap: () => Navigator.pop(context),
                text: Languages.of(context).txtContinue,
              ),
            ),
          ],
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

  Widget _amountView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtAmount,
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              ),
              CommonText(
                text: "\$448.00",
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              )
            ],
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtShipping,
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              ),
              CommonText(
                text: "\$8.00",
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              )
            ],
          ),
          Divider(
            color: CustomAppColor.of(context).dividerColor,
            height: 35.setHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTotalAmount,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              ),
              CommonText(
                text: "\$458.00",
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              )
            ],
          ),
        ],
      ),
    );
  }
}
