import 'package:chat_ai_app_package/utils/app_assets.dart';
import 'package:chat_ai_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodel/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const NotificationScreen());
  }

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  List<NotificationData> notificationList = [];

  void fillData() {
    notificationList = [
      NotificationData(
        notificationTitle: "App Updates",
        notificationType: "Update",
        isToday: true,
        time: "12:06 Am",
      ),
      NotificationData(
        notificationTitle: "Last Chat Saved",
        notificationType: "Chat",
        isToday: true,
        time: "09:18 Am",
      ),
      NotificationData(
        notificationTitle: "Password Reset Successfully",
        notificationType: "Password Reset",
        isToday: false,
        time: "09:18 Am",
      ),
      NotificationData(
        notificationTitle: "Chat Share",
        notificationType: "Chat",
        isToday: false,
        time: "09:18 Am",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtNotification),
            Expanded(
              child: ListView.builder(
                itemCount: notificationList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
                itemBuilder: (context, index) {
                  return _notificationItemView(context: context, index: index, notification: notificationList[index]);
                },
              ),
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

  Widget _notificationItemView({
    required BuildContext context,
    required int index,
    required NotificationData notification,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomAppColor.of(context).listTileColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.2),
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: CustomAppColor.of(context).txtWhite,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 18.setHeight),
        margin: EdgeInsets.only(bottom: 10.setHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 60.setWidth,
                  height: 60.setHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).listTileColor,
                  ),
                  child: Image.asset(
                    notification.notificationType == "Update"
                        ? AppAssets.icInfo
                        : notification.notificationType == "Chat"
                            ? AppAssets.icChat
                            : notification.notificationType == "Password Reset"
                                ? AppAssets.icShield
                                : "",
                    height: 24.setHeight,
                    width: 24.setWidth,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: notification.notificationTitle,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                        height: 1,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.setHeight),
                      Row(
                        children: [
                          CommonText(
                            text: notification.isToday ? "Today  |  " : " Yesterday  |  ",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.setFontSize,
                            textColor: CustomAppColor.of(context).txtBlack,
                            height: 1,
                            textAlign: TextAlign.start,
                          ),
                          CommonText(
                            text: notification.time,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.setFontSize,
                            textColor: CustomAppColor.of(context).txtBlack,
                            height: 1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(context).txtLoremIpsumDesc,
              fontWeight: FontWeight.w400,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1.2,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
