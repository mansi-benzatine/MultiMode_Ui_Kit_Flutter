import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

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
  final String type;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.isToday,
    required this.type,
  });
}

class NotificationScreen extends StatefulWidget {
  final bool forEmptyScreen;

  const NotificationScreen({super.key, this.forEmptyScreen = false});

  static Route<void> route({bool forEmptyScreen = false}) {
    return MaterialPageRoute(
      builder: (context) => NotificationScreen(forEmptyScreen: forEmptyScreen),
    );
  }

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Credit Card Connected!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationCreditCard,
      isToday: true,
      type: "Credit Card Connected",
    ),
    NotificationItem(
      title: "Security Alert!",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "11:00 AM",
      icon: AppAssets.icNotificationSecurity,
      isToday: true,
      type: "Security Alert",
    ),
    NotificationItem(
        title: "Profile Setup Update!",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever standard dummy text ever",
        time: "09:29 PM",
        icon: AppAssets.icNotificationProfile,
        isToday: false,
        type: "Profile Setup Update"),
    NotificationItem(
      title: "New Updates!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationNewUpdate,
      isToday: false,
      type: "New Updates",
    ),
    NotificationItem(
      title: "Password Change Successful!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever standard dummy text ever",
      time: "09:29 PM",
      icon: AppAssets.icNotificationPassword,
      isToday: false,
      type: "Password change Successful",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.forEmptyScreen
                      ? [_emptySearch()]
                      : [
                          _buildNotificationSection("Today", notifications.where((n) => n.isToday).toList()),
                          _buildNotificationSection("Yesterday", notifications.where((n) => !n.isToday).toList()),
                          // _emptySearch()
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
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtGray,
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
      margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 15.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgNotificationItem,
        borderRadius: BorderRadius.circular(12),
        gradient: (Theme.of(context).brightness == Brightness.dark) ? CustomAppColor.of(context).linearGradiant : null,
        border: Border(
          left: BorderSide(
            color: item.type == "Credit Card Connected"
                ? const Color(0xFF6A5BC2)
                : item.type == "Security Alert"
                    ? const Color(0xFFFF6767)
                    : item.type == "Profile Setup Update"
                        ? const Color(0xFFFFC600)
                        : item.type == "New Updates"
                            ? const Color(0xFFD198FB)
                            : const Color(0xFF768DF4),
            width: 3.5,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? const Color(0xFF070707)
                      : item.type == "Credit Card Connected"
                          ? const Color(0xFF6A5BC2).withValues(alpha: 0.1)
                          : item.type == "Security Alert"
                              ? const Color(0xFFFF6767).withValues(alpha: 0.1)
                              : item.type == "Profile Setup Update"
                                  ? const Color(0xFFFFC600).withValues(alpha: 0.1)
                                  : item.type == "New Updates"
                                      ? const Color(0xFFD198FB).withValues(alpha: 0.1)
                                      : const Color(0xFF768DF4).withValues(alpha: 0.1),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: item.title,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: item.time,
                      fontSize: 11.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Divider(color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2)),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: item.description,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  _emptySearch() {
    return SizedBox(
      height: 0.screenHeight * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgNotificationEmpty,
              height: 216.setHeight,
              width: 216.setWidth,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: Languages.of(context).txtNoNotification,
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: Languages.of(context).txtNoNotificationDesc,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGray,
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
