import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_rider_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationScreen());
  }

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  List<NotificationData> notificationList = [];

  _fillData() {
    notificationList = [
      NotificationData(
        icon: AppAssets.icCheck,
        description: "Ride #1234 has been success...",
        notificationTitle: "System",
      ),
      NotificationData(
        icon: AppAssets.icCoupon,
        description: "Invite friends - Get 3 coupons each!",
        notificationTitle: "Promotion",
      ),
      NotificationData(
        icon: AppAssets.icCoupon,
        description: "Invite friends - Get 3 coupons each!",
        notificationTitle: "Promotion",
      ),
      NotificationData(
        icon: AppAssets.icCancel,
        description: "Your ride #1234 has been cancel!",
        notificationTitle: "System",
      ),
      NotificationData(
        icon: AppAssets.icPayment,
        description: "Thank you! Your transactions complete...",
        notificationTitle: "Payment",
      ),
      NotificationData(
        icon: AppAssets.icCoupon,
        description: "Invite friends - Get 3 coupons each!",
        notificationTitle: "Promotion",
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [TopBar(this, title: Languages.of(context).txtNotifications), NotificationListView(notificationList: notificationList)],
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

class NotificationListView extends StatelessWidget {
  final List<NotificationData> notificationList;

  const NotificationListView({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 0.setHeight),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = notificationList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 8.setHeight),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgAlertDialog,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: CustomAppColor.of(context).borderTextFormField,
                    ),
                  ),
                  child: Image.asset(
                    item.icon,
                    height: 23.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icBlackWhite,
                  ),
                ),
                SizedBox(width: 16.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: item.notificationTitle,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      CommonText(
                        text: item.description,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        textColor: CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
          );
        },
        itemCount: notificationList.length);
  }
}
