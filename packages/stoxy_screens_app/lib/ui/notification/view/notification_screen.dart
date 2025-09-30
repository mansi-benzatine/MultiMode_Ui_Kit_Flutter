import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/widgets/text/common_text.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final String icon;
  final bool isToday;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.isToday,
  });
}

class NotificationScreen extends StatefulWidget {
  final bool isForEmptyScreen;

  static Route<void> route({bool isForEmptyScreen = false}) {
    return MaterialPageRoute(
      builder: (_) => NotificationScreen(isForEmptyScreen: isForEmptyScreen),
    );
  }

  const NotificationScreen({super.key, this.isForEmptyScreen = false});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Profile Setup Updated",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationUser,
      isToday: true,
    ),
    NotificationItem(
      title: "Security Alert!",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "11:00 AM",
      icon: AppAssets.icNotificationSecurityAlert,
      isToday: true,
    ),
    NotificationItem(
      title: "Credit Card Connected",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationWallet,
      isToday: false,
    ),
    NotificationItem(
      title: "New Updates!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationInfo,
      isToday: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: SingleChildScrollView(
                child: widget.isForEmptyScreen
                    ? _emptyNotification()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNotificationSection("Today", notifications.where((n) => n.isToday).toList()),
                          _buildNotificationSection("Yesterday", notifications.where((n) => !n.isToday).toList()),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<NotificationItem> items) {
    if (items.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 12.setHeight),
          child: Row(
            children: [
              CommonText(
                text: title,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
              ),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).containerBorder,
                  thickness: 1,
                  indent: 15.setWidth,
                ),
              ),
            ],
          ),
        ),
        ...items.map((item) => _buildNotificationItem(item)),
      ],
    );
  }

  Widget _buildNotificationItem(NotificationItem item) {
    return Container(
      margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 10.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgNotificationItem,
        borderRadius: BorderRadius.circular(20.setWidth),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CommonText(
              text: item.time,
              fontSize: 11.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtBlack,
              height: -0.3,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).notificationImageBg,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10.setWidth),
                child: Image.asset(
                  item.icon,
                  width: 20.setWidth,
                  height: 20.setHeight,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                child: CommonText(
                  text: item.title,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: item.description,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            fontFamily: Constant.fontFamily,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  _emptyNotification() {
    return SizedBox(
      height: 0.screenHeight * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgNotificationEmpty,
              height: 120.setHeight,
              width: 120.setWidth,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "No Notification",
              fontSize: 22.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: "You Have No Notification Yet.\nPlease Come Back Later.",
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
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
