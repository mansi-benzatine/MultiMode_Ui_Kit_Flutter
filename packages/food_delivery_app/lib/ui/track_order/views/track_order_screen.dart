import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/cancel_order/views/cancel_order_screen.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../dashboard/views/dashboard_screen.dart';
import '../datamodels/track_order_data.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TrackOrderScreen());
  }

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  List<TrackingStep> steps = [];
  void fillData() {
    steps = [
      TrackingStep(
        time: '9:30 AM',
        title: 'Pick-up Request Accepted',
        dateTime: '9:10 PM, 19, June 2021',
        isCompleted: true,
      ),
      TrackingStep(
        time: '9:35 AM',
        title: 'Product Picked & Stared Journey',
        dateTime: '9:10 PM, 19, June 2021',
        isCompleted: true,
      ),
      TrackingStep(
        time: '9:55 AM',
        title: 'Dispatch in local wear house',
        dateTime: '9:10 PM, 19, June 2021',
        isCompleted: true,
      ),
      TrackingStep(
        time: '',
        title: 'Parcel Delivered',
        dateTime: '9:10 PM, 19, June 2021',
        isCompleted: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AppAssets.imgMap,
                  fit: BoxFit.contain,
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TrackView(
                trackList: steps,
              ),
            ),
            Positioned(
              left: 20.setWidth,
              top: 64.setHeight,
              child: InkWell(
                onTap: () => Navigator.push(context, DashboardScreen.route()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 12.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    AppAssets.icClose,
                    height: 13.setHeight,
                    width: 13.setWidth,
                    color: const Color(0xFF021713),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrackView extends StatelessWidget {
  final List<TrackingStep> trackList;
  const TrackView({super.key, required this.trackList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScaffold,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(39),
          topRight: Radius.circular(39),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 42.setWidth,
            height: 4.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDeliveryTime.toUpperCase(),
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  SizedBox(height: 6.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: CustomAppColor.of(context).primary,
                        size: 20,
                      ),
                      SizedBox(width: 6.setWidth),
                      CommonText(
                        text: "54 MIN",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: "\$875.00",
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 6.setHeight),
                  CommonText(
                    text: "Order id: 5t36-487",
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 25.setHeight),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trackList.length,
            padding: EdgeInsets.symmetric(vertical: 15.setHeight),
            separatorBuilder: (_, __) => SizedBox(height: 5.setHeight),
            itemBuilder: (context, index) {
              final step = trackList[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 65.setWidth,
                    child: CommonText(
                      text: step.time,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.setFontSize,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 20.setWidth,
                        height: 20.setHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: step.isCompleted ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGrey,
                            width: 2,
                          ),
                          color: step.isCompleted ? CustomAppColor.of(context).primary : Colors.transparent,
                        ),
                        child: step.isCompleted ? Icon(Icons.check, color: CustomAppColor.of(context).bgScaffold, size: 15) : null,
                      ),
                      if (index != trackList.length - 1)
                        Padding(
                          padding: EdgeInsets.only(top: 10.setHeight),
                          child: Container(
                            width: 2,
                            height: 50.setHeight,
                            color: CustomAppColor.of(context).containerBorder,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: step.title,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.setFontSize,
                          textColor: step.isCompleted ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGrey,
                        ),
                        SizedBox(height: 6.setHeight),
                        CommonText(
                          text: step.dateTime,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: CommonButton(
              text: Languages.of(context).txtCancelOrder.toUpperCase(),
              onTap: () => Navigator.push(context, CancelOrderScreen.route()),
            ),
          )
        ],
      ),
    );
  }
}
