import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/utils/app_color.dart';
import 'package:musify_screens_app_package/utils/constant.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/widgets/text/common_text.dart';

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
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => NotificationScreen());
  }

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Congratulations!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:29 PM",
      icon: AppAssets.icCheckBorder,
      isToday: true,
    ),
    NotificationItem(
      title: "Password Reset!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "11:00 AM",
      icon: AppAssets.icPasswordKey,
      isToday: true,
    ),
    NotificationItem(
      title: "Premium Alert!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:29 PM",
      icon: AppAssets.icCheckBorder,
      isToday: false,
    ),
    NotificationItem(
      title: "Congratulations!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:29 PM",
      icon: AppAssets.icCheckBorder,
      isToday: false,
    ),
    NotificationItem(
      title: "Tone Set!",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: "09:29 PM",
      icon: AppAssets.icMusic,
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
                child: Column(
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
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
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
                  indent: 5.setWidth,
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
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
      padding: EdgeInsets.all(15.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgNotificationItem,
        borderRadius: BorderRadius.circular(12.setWidth),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.setWidth,
                height: 40.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).primary,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(11.setWidth),
                child: Image.asset(
                  item.icon,
                  width: 20.setWidth,
                  height: 20.setHeight,
                  color: CustomAppColor.of(context).black,
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
                      fontFamily: Constant.fontFamily,
                    ),
                    CommonText(
                      text: item.time,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      fontFamily: Constant.fontFamily,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: item.description,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            fontFamily: Constant.fontFamily,
            textAlign: TextAlign.start,
            maxLines: 3,
            height: 0,
            overflow: TextOverflow.ellipsis,
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
