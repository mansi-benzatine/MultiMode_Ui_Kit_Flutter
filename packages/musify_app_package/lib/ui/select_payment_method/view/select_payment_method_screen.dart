import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/premium_plan_list/view/premium_plan_list_screen.dart';
import 'package:musify_app_package/utils/constant.dart' show Constant;
import 'package:musify_app_package/widgets/button/common_button.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../add_new_card/view/add_new_card_screen.dart';
import '../../check_out/view/check_out_screen.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  final PremiumPlanData plan;
  const SelectPaymentMethodScreen({super.key, required this.plan});

  @override
  State<SelectPaymentMethodScreen> createState() => _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> implements TopBarClickListener {
  ValueNotifier<bool> isWalletSelected = ValueNotifier<bool>(false);
  ValueNotifier<bool> isPayPalSelected = ValueNotifier<bool>(false);
  ValueNotifier<bool> isGooglePaySelected = ValueNotifier<bool>(false);
  ValueNotifier<bool> isApplePaySelected = ValueNotifier<bool>(false);
  ValueNotifier<bool> isVisaSelected = ValueNotifier<bool>(false);

  PaymentMethodData? selectedPaymentMethodData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
          child: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtPaymentMethod,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: isWalletSelected,
                    builder: (context, value, child) {
                      return _buildPaymentItem(
                        icon: AppAssets.icWallet,
                        title: Languages.of(context).txtMyWallet,
                        iconColor: CustomAppColor.of(context).txtBlack,
                        isSelected: value,
                        onTap: () {
                          isWalletSelected.value = true;
                          isPayPalSelected.value = false;
                          isGooglePaySelected.value = false;
                          isApplePaySelected.value = false;
                          isVisaSelected.value = false;
                          selectedPaymentMethodData = PaymentMethodData(
                            name: Languages.of(context).txtMyWallet,
                            icon: AppAssets.icWallet,
                            isSelected: true,
                            iconColor: CustomAppColor.of(context).txtBlack,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isPayPalSelected,
                    builder: (context, value, child) {
                      return _buildPaymentItem(
                        icon: AppAssets.icPayPal,
                        title: Languages.of(context).txtPayPal,
                        isSelected: value,
                        onTap: () {
                          isWalletSelected.value = false;
                          isPayPalSelected.value = true;
                          isGooglePaySelected.value = false;
                          isApplePaySelected.value = false;
                          isVisaSelected.value = false;
                          selectedPaymentMethodData = PaymentMethodData(
                            name: Languages.of(context).txtPayPal,
                            icon: AppAssets.icPayPal,
                            isSelected: true,
                            iconColor: null,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isGooglePaySelected,
                    builder: (context, value, child) {
                      return _buildPaymentItem(
                        icon: AppAssets.icGoogle,
                        title: Languages.of(context).txtGooglePay,
                        isSelected: value,
                        onTap: () {
                          isWalletSelected.value = false;
                          isPayPalSelected.value = false;
                          isGooglePaySelected.value = true;
                          isApplePaySelected.value = false;
                          isVisaSelected.value = false;
                          selectedPaymentMethodData = PaymentMethodData(
                            name: Languages.of(context).txtGooglePay,
                            icon: AppAssets.icGoogle,
                            isSelected: true,
                            iconColor: null,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isApplePaySelected,
                    builder: (context, value, child) {
                      return _buildPaymentItem(
                        icon: AppAssets.icApple,
                        title: Languages.of(context).txtApplePay,
                        iconColor: CustomAppColor.of(context).txtBlack,
                        isSelected: value,
                        onTap: () {
                          isWalletSelected.value = false;
                          isPayPalSelected.value = false;
                          isGooglePaySelected.value = false;
                          isApplePaySelected.value = true;
                          isVisaSelected.value = false;
                          selectedPaymentMethodData = PaymentMethodData(
                            name: Languages.of(context).txtApplePay,
                            icon: AppAssets.icApple,
                            isSelected: true,
                            iconColor: CustomAppColor.of(context).txtBlack,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isVisaSelected,
                    builder: (context, value, child) {
                      return _buildPaymentItem(
                        icon: AppAssets.icVisa,
                        title: "**** **** 8702",
                        iconColor: CustomAppColor.of(context).txtBlack,
                        isSelected: value,
                        onTap: () {
                          isWalletSelected.value = false;
                          isPayPalSelected.value = false;
                          isGooglePaySelected.value = false;
                          isApplePaySelected.value = false;
                          isVisaSelected.value = true;
                          selectedPaymentMethodData = PaymentMethodData(
                            name: Languages.of(context).txtVisa,
                            icon: AppAssets.icVisa,
                            isSelected: true,
                            iconColor: CustomAppColor.of(context).txtBlack,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.setHeight),
          CommonButton(
            text: Languages.of(context).txtContinueToPayment,
            mLeft: 20.setWidth,
            mBottom: 20.setHeight,
            mRight: 20.setWidth,
            buttonTextSize: 17.setFontSize,
            onTap: () {
              // Handle premium purchase
              if (selectedPaymentMethodData != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen(plan: widget.plan, paymentMethod: selectedPaymentMethodData!),
                  ),
                );
              }
            },
          ),
        ],
      )),
    );
  }

  Widget _buildPaymentItem({
    required dynamic icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    bool isSelected = false,
    bool isIcon = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 13.setHeight),
        decoration: BoxDecoration(
          color: (isSelected) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgSearchBar,
          borderRadius: BorderRadius.circular(10.setWidth),
        ),
        child: Row(
          children: [
            // Icon/Image
            if (isIcon)
              Icon(
                icon as IconData,
                size: 28.setWidth,
                color: icon == Icons.g_mobiledata ? Colors.blue : CustomAppColor.of(context).txtBlack,
              )
            else
              Image.asset(
                icon as String,
                width: 22.setWidth,
                height: 22.setHeight,
                fit: BoxFit.contain,
                color: (isSelected && iconColor != null) ? CustomAppColor.of(context).black : iconColor,
              ),

            SizedBox(width: 16.setWidth),

            // Title
            Expanded(
              child: CommonText(
                text: title,
                fontSize: 16.setFontSize,
                fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w600,
                textColor: (isSelected) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
                textAlign: TextAlign.start,
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
    if (name == Constant.strAdd) {
      // Handle add payment method
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewCardScreen()));
    }
  }
}

class PaymentMethodData {
  final String name;
  final String icon;
  final Color? iconColor;
  final bool isSelected;

  PaymentMethodData({required this.name, required this.icon, required this.iconColor, required this.isSelected});
}
