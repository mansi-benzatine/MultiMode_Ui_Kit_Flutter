import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../datamodels/all_conversations_data.dart';

class AllConversationsThreadsScreen extends StatefulWidget {
  const AllConversationsThreadsScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AllConversationsThreadsScreen());
  }

  @override
  State<AllConversationsThreadsScreen> createState() => _AllConversationsThreadsScreenState();
}

class _AllConversationsThreadsScreenState extends State<AllConversationsThreadsScreen> implements TopBarClickListener {
  List<AllConversationData> allConversationList = [];

  void fillData() {
    allConversationList = [
      AllConversationData(
        title: "I haven’t received this order",
        orderId: "25478965145265",
        dateTime: "May 26, 2021, 04:19 PM",
        closeDatetime: "May 26, 2021, 04:25 PM",
      ),
      AllConversationData(
        title: "I haven’t received this order",
        orderId: "25478965145265",
        dateTime: "May 26, 2021, 04:19 PM",
        closeDatetime: "May 26, 2021, 04:25 PM",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAllConversationsThreads,
              isShowBack: true,
            ),
            Expanded(
              child: ThreadListView(
                allConversationList: allConversationList,
              ),
            )
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

class ThreadListView extends StatelessWidget {
  final List<AllConversationData> allConversationList;
  const ThreadListView({super.key, required this.allConversationList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).detailScreenBg,
      child: ListView.separated(
        itemCount: allConversationList.length,
        separatorBuilder: (context, index) {
          return Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight);
        },
        itemBuilder: (context, index) {
          final item = allConversationList[index];
          return IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.push(context, ChatScreen.route(isFromPastThread: true)),
              child: Container(
                color: CustomAppColor.of(context).bgScaffold,
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: item.title,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.setFontSize,
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          size: 25,
                          color: CustomAppColor.of(context).txtGrey,
                        )
                      ],
                    ),
                    SizedBox(height: 7.setHeight),
                    CommonText(
                      text: "Order #${item.orderId} | ${item.dateTime}",
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 7.setHeight),
                    Row(
                      children: [
                        Icon(
                          Icons.message_rounded,
                          size: 22,
                          color: CustomAppColor.of(context).txtGrey,
                        ),
                        SizedBox(width: 8.setWidth),
                        CommonText(
                          text: "Closed on ${item.closeDatetime}",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.setFontSize,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
