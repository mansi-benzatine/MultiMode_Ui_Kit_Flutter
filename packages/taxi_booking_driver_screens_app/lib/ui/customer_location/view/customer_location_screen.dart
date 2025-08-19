import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/ui/arrived_at_location/view/arrived_at_location_screen.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../call/view/call_screen.dart';
import '../../chat/view/chat_screen.dart';

class CustomerLocationScreen extends StatefulWidget {
  final bool isForNavigateToCustomerLocation;

  static Route<void> route({bool isForNavigateToCustomerLocation = false}) {
    return MaterialPageRoute(builder: (_) => CustomerLocationScreen(isForNavigateToCustomerLocation: isForNavigateToCustomerLocation));
  }

  const CustomerLocationScreen({super.key, required this.isForNavigateToCustomerLocation});

  @override
  State<CustomerLocationScreen> createState() => _CustomerLocationScreenState();
}

class _CustomerLocationScreenState extends State<CustomerLocationScreen> {
  bool _isContinueTap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isContinueTap = widget.isForNavigateToCustomerLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 22.setWidth),
          child: IgnorePointer(
            ignoring: true,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset(
                AppAssets.icBack,
                height: 26.setHeight,
                width: 26.setWidth,
              ),
            ),
          ),
        ),
        backgroundColor: CustomAppColor.of(context).transparent,
        title: CommonText(
          text: Languages.of(context).txtCustomerLocation,
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
                AppAssets.imgMapCustomerLocation,
                fit: BoxFit.fill,
              ),
            ),
            _isContinueTap
                ? Align(
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
                              IgnorePointer(
                                ignoring: true,
                                child: CommonButton(
                                  text: Languages.of(context).txtNavigateToCustomerLocation,
                                  onTap: () {
                                    Navigator.push(context, ArrivedAtLocationScreen.route());
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Align(
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
                          SizedBox(height: 10.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtCustomerLocation,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.setFontSize,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const CommonText(
                                    text: "\$25.00",
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CommonText(
                                    text: "2 km, 8 min",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.setFontSize,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5.setHeight),
                          Divider(color: CustomAppColor.of(context).dividerColor),
                          SizedBox(height: 10.setHeight),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadiusGeometry.all(Radius.circular(12)),
                                    child: Image.asset(
                                      AppAssets.imgDummyProfile,
                                      alignment: Alignment.center,
                                      width: 70.setWidth,
                                      height: 70.setHeight,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16.setWidth),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                          text: "Brayden Jockos",
                                          fontWeight: FontWeight.w600,
                                        ),
                                        CommonText(
                                          text: Languages.of(context).txtCashPayment,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.setFontSize,
                                          textColor: CustomAppColor.of(context).txtGray,
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          IgnorePointer(
                                            ignoring: true,
                                            child: InkWell(
                                              onTap: () => Navigator.push(context, ChatScreen.route()),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                                    border: Border.all(
                                                      color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                                                    ),
                                                    color: CustomAppColor.of(context).bgAlertDialog),
                                                padding: const EdgeInsets.all(11),
                                                child: Image.asset(
                                                  AppAssets.icChat,
                                                  width: 23.setWidth,
                                                  height: 23.setHeight,
                                                  color: CustomAppColor.of(context).icBlackWhite,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.setWidth),
                                          IgnorePointer(
                                            ignoring: true,
                                            child: InkWell(
                                              onTap: () => Navigator.push(context, CallScreen.route()),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                                    border: Border.all(
                                                      color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                                                    ),
                                                    color: CustomAppColor.of(context).bgAlertDialog),
                                                padding: const EdgeInsets.all(11),
                                                child: const Icon(Icons.call),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 22.setHeight),
                          IgnorePointer(
                            ignoring: true,
                            child: CommonButton(
                              text: Languages.of(context).txtContinue,
                              onTap: () {
                                setState(() {
                                  _isContinueTap = true;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
