import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/constant.dart' show Constant;

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../add_new_card/view/add_new_card_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
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
            isShowAdd: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
              child: Column(
                children: [
                  _buildPaymentItem(
                    icon: AppAssets.icWallet,
                    title: Languages.of(context).txtMyWallet,
                    iconColor: CustomAppColor.of(context).txtBlack,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.setHeight),
                  _buildPaymentItem(
                    icon: AppAssets.icPayPal,
                    title: Languages.of(context).txtPayPal,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.setHeight),
                  _buildPaymentItem(
                    icon: AppAssets.icGoogle,
                    title: Languages.of(context).txtGooglePay,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.setHeight),
                  _buildPaymentItem(
                    icon: AppAssets.icApple,
                    title: Languages.of(context).txtApplePay,
                    iconColor: CustomAppColor.of(context).txtBlack,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.setHeight),
                  _buildPaymentItem(
                    icon: AppAssets.icVisa,
                    title: "**** **** 8702",
                    iconColor: CustomAppColor.of(context).txtBlack,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _buildPaymentItem({
    required dynamic icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 14.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgSearchBar,
          borderRadius: BorderRadius.circular(16.setWidth),
        ),
        child: Row(
          children: [
            // Icon/Image
            Image.asset(
              icon as String,
              width: 24.setWidth,
              height: 24.setHeight,
              fit: BoxFit.contain,
              color: iconColor,
            ),

            SizedBox(width: 16.setWidth),

            // Title
            Expanded(
              child: CommonText(
                text: title,
                fontSize: 17.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
                textAlign: TextAlign.start,
              ),
            ),

            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              color: CustomAppColor.of(context).txtBlack,
              size: 16.setWidth,
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
