import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/button/common_button.dart';
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
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Order Confirm",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:12",
      date: DateTime.now(),
      icon: AppAssets.icShoppingCart,
    ),
    NotificationItem(
      title: "Sale Alert",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "12:00",
      date: DateTime.now(),
      icon: AppAssets.icPercent,
    ),
    NotificationItem(
      title: "Congratulation!",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "12:00",
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: AppAssets.icCheck,
    ),
    NotificationItem(
      title: "Order Confirm",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:12",
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: AppAssets.icShoppingCart,
    ),
    NotificationItem(
      title: "Payment Success!",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:12",
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: AppAssets.icWallet,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todayList = notifications.where((n) => n.date.year == today.year && n.date.month == today.month && n.date.day == today.day).toList();

    final yesterdayList = notifications.where((n) {
      final yesterday = today.subtract(const Duration(days: 1));
      return n.date.year == yesterday.year && n.date.month == yesterday.month && n.date.day == yesterday.day;
    }).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtNotification,
              isShowBack: true,
            ),
            if (notifications.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 180.setHeight),
                    Image.asset(
                      AppAssets.imgNotificationEmpty,
                      height: 120.setHeight,
                      width: 120.setWidth,
                      color: CustomAppColor.of(context).emptyViewIcon,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: "No Notifications Yet",
                      fontSize: 24.setFontSize,
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: "When you get notifications, they'll show up here",
                      textAlign: TextAlign.center,
                      fontSize: 14.setFontSize,
                      fontFamily: Constant.fontFamilyMedium500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonButton(
                      width: 110.setWidth,
                      height: 44.setHeight,
                      buttonFontFamily: Constant.fontFamilySemiBold600,
                      buttonTextSize: 16.setFontSize,
                      text: Languages.of(context).txtRefresh,
                    )
                  ],
                ),
              ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.setWidth,
                  vertical: 10.setHeight,
                ),
                children: [
                  if (todayList.isNotEmpty) ...[
                    CommonText(
                      text: Languages.of(context).txtToday,
                      fontSize: 18.setFontSize,
                      textAlign: TextAlign.start,
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                    SizedBox(height: 15.setHeight),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: todayList.length,
                      separatorBuilder: (context, index) => Divider(
                        color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        return _buildNotificationTile(todayList[index]);
                      },
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                  if (yesterdayList.isNotEmpty) ...[
                    CommonText(
                      text: Languages.of(context).txtYesterday,
                      fontSize: 18.setFontSize,
                      textAlign: TextAlign.start,
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                    SizedBox(height: 15.setHeight),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: yesterdayList.length,
                      separatorBuilder: (context, index) => Divider(
                        color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        return _buildNotificationTile(yesterdayList[index]);
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile(NotificationItem n) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.setHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).containerBg,
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              n.icon,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).icBlackWhite,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: n.title,
                  fontSize: 20.setFontSize,
                  textAlign: TextAlign.start,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: n.message,
                  textColor: CustomAppColor.of(context).txtGray,
                  maxLines: 6,
                  textAlign: TextAlign.start,
                  fontFamily: Constant.fontFamilyMedium500,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.setWidth),
          CommonText(
            text: n.time,
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMedium500,
          ),
        ],
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

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imgSearchEmpty,
                  height: 120.setHeight,
                  width: 120.setWidth,
                  color: CustomAppColor.of(context).emptyViewIcon,
                ),
                const SizedBox(height: 20),
                const Text(
                  "No Notifications Yet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "When you get notifications, they'll show up here",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D4C41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // refresh logic
                  },
                  child: const Text("Refresh"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
