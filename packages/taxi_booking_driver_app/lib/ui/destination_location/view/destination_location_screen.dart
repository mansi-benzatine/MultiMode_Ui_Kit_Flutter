import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/ui/collect_cash/view/collect_cash_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class DestinationLocationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DestinationLocationScreen());
  }

  const DestinationLocationScreen({super.key});

  @override
  State<DestinationLocationScreen> createState() => _DestinationLocationScreenState();
}

class _DestinationLocationScreenState extends State<DestinationLocationScreen> {
  bool _isNavigateTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 22.setWidth),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              AppAssets.icBack,
              height: 26.setHeight,
              width: 26.setWidth,
            ),
          ),
        ),
        backgroundColor: CustomAppColor.of(context).transparent,
        title: CommonText(
          text: Languages.of(context).txtDestination,
          fontWeight: FontWeight.w600,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).black,
        ),
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox.expand(
              child: Image.asset(
                _isNavigateTap ? AppAssets.imgMapArrivedDestination : AppAssets.imgMapDestination,
                fit: BoxFit.fill,
              ),
            ),
            _isNavigateTap
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 16.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 42.setWidth,
                            height: 4.setHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xFF9EA2A7),
                            ),
                          ),
                          SizedBox(height: 15.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtArrivedAtCustomerLocation,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.setFontSize,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                          Divider(color: CustomAppColor.of(context).dividerColor),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 12.setWidth),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    spreadRadius: 1.5,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                color: CustomAppColor.of(context).bgAlertDialog,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomAppColor.of(context).bgScreen,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AppAssets.icLocation,
                                      color: CustomAppColor.of(context).icBlackWhite,
                                      width: 24.setWidth,
                                      height: 24.setHeight,
                                    ),
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  CommonText(
                                    text: "1397 Walnut Street, Jackson",
                                    textColor: CustomAppColor.of(context).txtGray,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                          CommonButton(
                            text: Languages.of(context).txtCollectCash,
                            onTap: () {
                              Navigator.push(context, CollectCashScreen.route());
                            },
                          )
                        ],
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 16.setHeight),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 12.setWidth),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                                  offset: const Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 1.5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: CustomAppColor.of(context).bgScreen,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomAppColor.of(context).chatBubbleFromSender,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    AppAssets.icLocation,
                                    color: CustomAppColor.of(context).icBlackWhite,
                                    width: 24.setWidth,
                                    height: 24.setHeight,
                                  ),
                                ),
                                SizedBox(width: 10.setWidth),
                                CommonText(
                                  text: "1397 Walnut Street, Jackson",
                                  textColor: CustomAppColor.of(context).txtGray,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 16.setWidth),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgScreen,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonButton(
                                text: Languages.of(context).txtNavigateToDestination,
                                onTap: () {
                                  setState(() {
                                    _isNavigateTap = true;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
