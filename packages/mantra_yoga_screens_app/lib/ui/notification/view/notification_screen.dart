import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../model/notification_data_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const NotificationScreen());
  }

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  // Sample notification data grouped by date
  final Map<String, List<NotificationItem>> _notifications = {
    'Today': [
      NotificationItem(
        title: 'Meditation Time!',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icNotification,
      ),
      NotificationItem(
        title: 'Payment Successful!',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icEmail,
      ),
    ],
    'Yesterday': [
      NotificationItem(
        title: 'Reset Password',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icPassword,
      ),
      NotificationItem(
        title: 'Offer Available',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icArchive,
      ),
      NotificationItem(
        title: 'Monthly Report!',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icArchive,
      ),
    ],
    '23, December': [
      NotificationItem(
        title: 'Congratulations!',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icNotification,
      ),
      NotificationItem(
        title: 'Payment Successful!',
        description: 'Lorem Ipsum is simply dummy text more...',
        icon: AppAssets.icEmail,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtNotification,
          ),
          Expanded(
            child: _buildNotificationList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight),
      itemCount: _notifications.keys.length,
      itemBuilder: (context, index) {
        String dateGroup = _notifications.keys.elementAt(index);
        List<NotificationItem> notifications = _notifications[dateGroup]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0) SizedBox(height: 15.setHeight),
            _buildDateHeader(dateGroup),
            SizedBox(height: 15.setHeight),
            ...notifications.map((notification) => _buildNotificationCard(notification)),
            SizedBox(height: 5.setHeight),
          ],
        );
      },
    );
  }

  Widget _buildDateHeader(String date) {
    return CommonText(
      text: date,
      fontSize: 14.setFontSize,
      fontWeight: FontWeight.w400,
      fontFamily: Constant.fontFamilyRegular400,
      textColor: CustomAppColor.of(context).txtBlack,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50.setWidth,
            height: 50.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).containerFillBorderAndBlack,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                notification.icon,
                width: 22.setWidth,
                height: 22.setHeight,
                color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.7),
              ),
            ),
          ),
          SizedBox(width: 12.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: notification.title,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constant.fontFamilySemiBold600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: notification.description,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: Constant.fontFamilyRegular400,
                  textColor: CustomAppColor.of(context).txtDarkGray,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
