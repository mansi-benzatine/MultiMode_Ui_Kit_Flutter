import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_screens_app_package/ui/ride_otp_verification/view/ride_otp_verification_screen.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class CollectCashScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CollectCashScreen());
  }

  const CollectCashScreen({super.key});

  @override
  State<CollectCashScreen> createState() => _CollectCashScreenState();
}

class _CollectCashScreenState extends State<CollectCashScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtCollectCash),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(12)), color: CustomAppColor.of(context).chatBubbleFromSender),
                          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                          child: Image.asset(
                            AppAssets.icWallet,
                            color: Colors.green,
                            height: 44.setHeight,
                            width: 44.setWidth,
                          ),
                        ),
                        SizedBox(height: 10.setHeight),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w500,
                              height: 1.8,
                              color: CustomAppColor.of(context).txtGray,
                            ),
                            children: [
                              TextSpan(text: "${Languages.of(context).txtTotalAmount} : "),
                              TextSpan(
                                text: "\$25.00",
                                style: TextStyle(
                                  color: CustomAppColor.of(context).txtPrimary,
                                  decorationColor: CustomAppColor.of(context).txtPrimary,
                                  decorationThickness: 1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.setFontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.setHeight),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadiusGeometry.all(
                            Radius.circular(12),
                          ),
                          child: Image.asset(
                            AppAssets.imgDummyProfile,
                            alignment: Alignment.center,
                            width: 65.setWidth,
                            height: 65.setHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Brayden Jockos",
                                fontWeight: FontWeight.w700,
                                fontSize: 17.setFontSize,
                              ),
                              CommonText(
                                text: "Cash Payment",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.radio_button_checked, size: 24, color: CustomAppColor.of(context).icBlackWhite),
                            SizedBox(
                              height: 50.setHeight,
                              child: const DottedLine(
                                direction: Axis.vertical,
                                lineLength: double.infinity, // optional
                                dashLength: 2,
                                lineThickness: 2,
                                dashGapLength: 4,
                                dashColor: Colors.grey,
                              ),
                            ),
                            const Icon(Icons.radio_button_checked, size: 24, color: Colors.green),
                          ],
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Pickup",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                              const CommonText(
                                text: "1397 Walnut Street, Jackson",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 4.setHeight),
                              Divider(color: CustomAppColor.of(context).dividerColor),
                              SizedBox(height: 4.setHeight),
                              CommonText(
                                text: "Drop Off",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                              const CommonText(
                                text: "345 Hardesty Street, 368972",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "\$25.00 Collect",
                  onTap: () {
                    Navigator.push(context, RideOtpVerificationScreen.route(isFromCollectCashScreen: true));
                  },
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
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
