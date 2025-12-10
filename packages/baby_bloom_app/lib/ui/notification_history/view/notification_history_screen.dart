import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class NotificationHistoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationHistoryScreen());
  }

  const NotificationHistoryScreen({super.key});

  @override
  State<NotificationHistoryScreen> createState() => _NotificationHistoryScreenState();
}

class _NotificationHistoryScreenState extends State<NotificationHistoryScreen> implements TopBarClickListener {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Pill Reminder",
      time: "10:00AM",
      dateLabel: "Today",
      description: "It’s time to take medicine. Take your scheduled pill now to stay on track with your routine.",
      status: "Pending",
    ),
    NotificationItem(
      title: "Visit",
      time: "10:00AM",
      dateLabel: "Yesterday",
      description: "It’s time to take medicine. Take your scheduled pill now to stay on track with your routine.",
      status: "Completed",
      completedDate: "12 August 2025",
    ),
    NotificationItem(
      title: "Visit",
      time: "10:00AM",
      dateLabel: "Wed, August 12",
      description: "It’s time to take medicine. Take your scheduled pill now to stay on track with your routine.",
      status: "Completed",
      completedDate: "12 August 2025",
    ),
    NotificationItem(
      title: "Pill Reminder",
      time: "10:00AM",
      dateLabel: "Wed, August 10",
      description: "It’s time to take medicine. Take your scheduled pill now to stay on track with your routine.",
      status: "Taken",
      completedDate: "10 August 2025",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtNotificationHistory,
            isShowBack: true,
          ),
          if (notifications.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                shrinkWrap: true,
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return notificationCardView(item);
                },
              ),
            ),
          if (notifications.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icEmptyNotification,
                      width: 60.setWidth,
                      height: 60.setHeight,
                    ),
                    SizedBox(height: 14.setHeight),
                    CommonText(
                      text: Languages.of(context).txtEmptyNotification,
                      fontSize: 20.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                    SizedBox(height: 2.setHeight),
                    CommonText(
                      text: Languages.of(context).txtEmptyNotificationDesc,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 50.setHeight)
        ],
      ),
    );
  }

  Widget notificationCardView(NotificationItem item) {
    final isPending = item.status == "Pending";
    final isCompleted = item.status == "Completed";
    final isTaken = item.status == "Taken";

    Color borderColor = CustomAppColor.of(context).border;
    Color bgColor = CustomAppColor.of(context).bgScreen;
    Color statusColor = Colors.green;

    if (isPending) {
      statusColor = Colors.green;
    } else if (isCompleted) {
      statusColor = Colors.green;
    } else if (isTaken) {
      statusColor = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).btnGrey,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  item.title.contains("Pill") ? AppAssets.icMedicine : AppAssets.icColorVisit,
                  height: 16.setHeight,
                  width: 16.setHeight,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: item.title,
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                    SizedBox(height: 2.setHeight),
                    CommonText(
                      text: item.time,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                  ],
                ),
              ),
              CommonText(
                text: item.dateLabel,
                fontSize: 12,
                textColor: CustomAppColor.of(context).txtLightGrey,
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: item.description,
            fontSize: 13,
            textAlign: TextAlign.start,
            height: 1.4,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          SizedBox(height: 12.setHeight),
          if (isPending) ...[
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtSkip,
                    buttonColor: CustomAppColor.of(context).btnGrey,
                    buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                    borderColor: CustomAppColor.of(context).btnGrey,
                    buttonTextSize: 14.setFontSize,
                    height: 35.setHeight,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtTaken,
                    height: 35.setHeight,
                    buttonTextSize: 14.setFontSize,
                  ),
                ),
              ],
            ),
          ] else ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 8.setHeight),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.icMark,
                    height: 16.setHeight,
                    color: statusColor,
                    width: 16.setWidth,
                  ),
                  SizedBox(width: 6.setWidth),
                  CommonText(
                    text: isTaken ? "Taken on ${item.completedDate}" : "Completed on ${item.completedDate}",
                    fontSize: 12,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: statusColor,
                  ),
                ],
              ),
            ),
          ]
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

// Model class
class NotificationItem {
  final String title;
  final String time;
  final String dateLabel;
  final String description;
  final String status;
  final String? completedDate;

  NotificationItem({
    required this.title,
    required this.time,
    required this.dateLabel,
    required this.description,
    required this.status,
    this.completedDate,
  });
}
