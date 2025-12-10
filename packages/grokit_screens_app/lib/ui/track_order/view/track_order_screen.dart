import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/call/view/call_screen.dart';
import 'package:grokit_screens_app/ui/cancel_order/view/cancel_order_screen.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';

class TrackOrderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TrackOrderScreen());
  }

  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtTrackOrder,
              isShowBack: true,
            ),
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    AppAssets.imgDeliveryMap,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        border: Border.all(color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.2)),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.setHeight),
                          Padding(
                            padding: EdgeInsets.only(top: 10.setHeight),
                            child: const CommonText(
                              text: "Order ID: 7N45-430",
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          AppAssets.icLocation,
                                          color: CustomAppColor.of(context).txtPrimary,
                                          height: 20.setHeight,
                                          width: 20.setWidth,
                                        ),
                                        SizedBox(
                                          height: 40.0,
                                          child: CustomPaint(
                                            painter: DottedLinePainter(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const CommonText(
                                            text: 'Pickup Point',
                                            fontFamily: Constant.fontFamilySemiBold600,
                                          ),
                                          SizedBox(height: 5.setHeight),
                                          CommonText(
                                            text: '34 T 21th St, New York',
                                            textColor: CustomAppColor.of(context).txtGray,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      AppAssets.icLocation,
                                      color: CustomAppColor.of(context).icBlackWhite,
                                      height: 18.setHeight,
                                      width: 18.setWidth,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const CommonText(
                                            text: 'Drop Off',
                                            fontFamily: Constant.fontFamilySemiBold600,
                                          ),
                                          CommonText(
                                            text: '47 W 13th St, New York',
                                            textColor: CustomAppColor.of(context).txtGray,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: List.generate(60, (index) {
                              return Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.setWidth),
                                  child: Container(
                                    height: 1.setHeight,
                                    width: 2.setWidth,
                                    color: CustomAppColor.of(context).border,
                                  ),
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 8.setWidth),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets.imgDummyProfile,
                                  width: 40.setWidth,
                                  height: 40.setHeight,
                                ),
                                SizedBox(width: 10.setWidth),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CommonText(
                                        text: "Roman Nick",
                                        fontFamily: Constant.fontFamilyMedium500,
                                      ),
                                      CommonText(
                                        text: "Delivery Boy",
                                        textColor: CustomAppColor.of(context).txtGray,
                                        fontSize: 12.setFontSize,
                                      ),
                                    ],
                                  ),
                                ),
                                IgnorePointer(
                                  ignoring: true,
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(context, CallScreen.route()),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: CustomAppColor.of(context).unselectedCard,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
                                      child: Image.asset(
                                        AppAssets.icCall,
                                        width: 18.setWidth,
                                        height: 18.setHeight,
                                        color: CustomAppColor.of(context).icBlackWhite,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.setHeight),
                          IgnorePointer(
                            ignoring: true,
                            child: CommonButton(
                              height: 45.setHeight,
                              buttonColor: CustomAppColor.of(context).bgScreen,
                              borderColor: CustomAppColor.of(context).red,
                              text: Languages.of(context).txtCancelOrder,
                              buttonTextColor: CustomAppColor.of(context).red,
                              onTap: () => Navigator.push(context, CancelOrderScreen.route()),
                            ),
                          ),
                          SizedBox(height: 20.setHeight),
                        ],
                      ),
                    ),
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

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const dashWidth = 3.0;
    const dashSpace = 3.0;
    double startY = 0.0;
    const double endY = 40.0;
    double x = size.width / 2;

    for (double i = startY; i < endY; i += dashSpace + dashWidth) {
      canvas.drawLine(
        Offset(x, i),
        Offset(x, i + dashWidth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
