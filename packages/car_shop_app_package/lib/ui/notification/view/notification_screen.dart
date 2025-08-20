import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  List<NotificationItemData> _notificationList = [];
  final Map<String, List<NotificationItemData>> _groupedNotifications = {};

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var yesterday = DateTime(now.year, now.month, now.day - 1);

    _notificationList = [
      NotificationItemData(
          title: "Best Offer for You",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(now.year, now.month, now.day, 11, 20, now.second),
          imageUrl: AppAssets.icOffer),
      NotificationItemData(
          title: "Warning!",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(now.year, now.month, now.day, 11, 30, now.second),
          imageUrl: AppAssets.icWarning),
      NotificationItemData(
          title: "Best Offer for You",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(now.year, now.month, now.day, 11, 40, now.second),
          imageUrl: AppAssets.icOffer),
      NotificationItemData(
          title: "Did You Know?",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: yesterday,
          imageUrl: AppAssets.icKnow),
      NotificationItemData(
          title: "Congratulations",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 11, 40, yesterday.second),
          imageUrl: AppAssets.icCongrats),
      NotificationItemData(
          title: "Best Offer for You",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 14, 20, yesterday.second),
          imageUrl: AppAssets.icOffer),
      NotificationItemData(
          title: "Warning!",
          description: "Lorem Ipsum is simply dummy text of the printing  typesetting industry...",
          dateTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 20, 30, yesterday.second),
          imageUrl: AppAssets.icWarning),
    ];

    _groupNotifications();
  }

  void _groupNotifications() {
    _groupedNotifications.clear();

    for (var notification in _notificationList) {
      String dateKey = _getDateKey(notification.dateTime);

      if (_groupedNotifications[dateKey] == null) {
        _groupedNotifications[dateKey] = [];
      }
      _groupedNotifications[dateKey]!.add(notification);
    }
  }

  String _getDateKey(DateTime dateTime) {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    var yesterday = DateTime(now.year, now.month, now.day - 1);
    var notificationDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (notificationDate == today) {
      return "Today";
    } else if (notificationDate == yesterday) {
      return "Yesterday";
    } else {
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
  }

  String _formatTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? 'pm' : 'am';
    int hour = dateTime.hour == 0 ? 12 : (dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour);
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return "$hour.$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtNotification, isShowBack: true),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                children: _buildGroupedList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGroupedList() {
    List<Widget> widgets = [];

    _groupedNotifications.forEach((dateKey, notifications) {
      // Add section header
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: 20.setHeight, bottom: 16.setHeight),
          child: CommonText(
            text: dateKey,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.left,
          ),
        ),
      );

      // Add notification items for this section
      for (var notification in notifications) {
        widgets.add(_buildNotificationItem(notification));
      }
    });

    return widgets;
  }

  Widget _buildNotificationItem(NotificationItemData notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        border: Border.all(color: CustomAppColor.of(context).containerBorder, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular Icon
          Image.asset(
            notification.imageUrl,
            width: 28.setWidth,
            height: 28.setHeight,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.setWidth),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CommonText(
                        text: notification.title,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.left,
                        letterSpacing: 0.2,
                      ),
                    ),
                    CommonText(
                      text: _formatTime(notification.dateTime),
                      fontSize: 10.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                CommonText(
                  text: notification.description,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtDarkGray,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  letterSpacing: 0,
                ),
              ],
            ),
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

class NotificationItemData {
  final String title;
  final String description;
  final DateTime dateTime;
  final String imageUrl;

  NotificationItemData({required this.title, required this.description, required this.dateTime, required this.imageUrl});
}
