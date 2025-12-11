import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/notification/datamodel/notification_data.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationScreen());
  }

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> implements TopBarClickListener {
  List<NotificationItem> notifications = [
    NotificationItem(title: "New Arrival", subtitle: "You", date: "24 Nov", image: AppAssets.imgInterest8),
    NotificationItem(title: "Watchlist Alerts", subtitle: "The show Midnight Streets you added is now available.", date: "24 Nov", image: AppAssets.imgInterest1),
    NotificationItem(title: "New Releases", subtitle: "Discover something new in Drama & Suspense.", date: "24 Nov", image: AppAssets.imgInterest5),
    NotificationItem(title: "For You", subtitle: "Based on your recent watch — you might love Parallel Lines.", date: "24 Nov", image: AppAssets.imgInterest6),
    NotificationItem(title: "App Offers & Updates", subtitle: "20% off on your next subscription renewal.", date: "24 Nov", image: AppAssets.imgInterest4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtNotification,
            isShowBack: true,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];

              return Container(
                margin: EdgeInsets.only(bottom: 14.setHeight),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).btnGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(item.image != null ? 12 : 50),
                      child: Container(
                        height: 55,
                        width: 55,
                        color: Colors.white,
                        child: item.image != null
                            ? Image.asset(item.image!, fit: BoxFit.cover)
                            : Center(
                                child: Image.asset(
                                  item.icon!,
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: item.title,
                            fontSize: 14.setFontSize,
                            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                          ),
                          SizedBox(height: 2.setHeight),
                          CommonText(
                            text: item.subtitle,
                            fontSize: 12.setFontSize,
                            textAlign: TextAlign.start,
                            fontFamily: Constant.fontFamilyClashGroteskMedium500,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          SizedBox(height: 6.setHeight),
                          CommonText(
                            text: item.date,
                            fontSize: 12.setFontSize,
                            textColor: CustomAppColor.of(context).txtGray,
                            fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
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
