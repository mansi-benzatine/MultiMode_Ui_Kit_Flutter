import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/dashboard/views/dashboard_screen.dart';
import 'package:food_delivery_app_package/ui/track_order/views/track_order_screen.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ConfirmOrderScreen());
  }

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtConfirmOrder,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.setHeight),
                    Image.asset(
                      AppAssets.imgBgConfirmOrder,
                      height: 275.setHeight,
                      width: 275.setWidth,
                    ),
                    SizedBox(height: 30.setHeight),
                    CommonText(
                      text: Languages.of(context).txtThanksForYourOrder,
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonText(
                      text: "Order ID: 5T36-487",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(height: 30.setHeight),
                    CommonText(
                      text: Languages.of(context).txtWeWillReportOnceDeliveryIsOnTheWay,
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: Column(
                children: [
                  CommonButton(
                    text: Languages.of(context).txtTrackOrder.toUpperCase(),
                    buttonColor: CustomAppColor.of(context).reviewButton,
                    onTap: () => Navigator.push(context, TrackOrderScreen.route()),
                    borderColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonButton(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        DashboardScreen.route(),
                        (route) => false,
                      );
                    },
                    text: Languages.of(context).txtBackToHome.toUpperCase(),
                  )
                ],
              ),
            )
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
}
