import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:dating_screens_app_package/ui/chats_search/views/chats_search_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';
import '../datamodels/chats_list_data.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> implements TopBarClickListener {
  final List<ChatModel> chatList = [
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Sound good to me!",
      time: "8:17 PM",
      date: "9/2/20",
      unreadCount: 5,
      image: AppAssets.imgProfile1,
      isOnline: true,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Why break up with your friend?",
      time: "2:00 PM",
      date: "9/2/20",
      unreadCount: 10,
      image: AppAssets.imgProfile1,
      isOnline: true,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "How you doing?",
      time: "1:00 PM",
      date: "9/2/20",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: false,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Hi! Whats up?",
      time: "",
      date: "Yesterday",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: false,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "I'm great, Thanks",
      time: "",
      date: "Yesterday",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: true,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "That sounds awesome!!!",
      time: "",
      date: "7/2/20",
      unreadCount: 3,
      image: AppAssets.imgProfile1,
      isOnline: true,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Hey, would you mind going ou...",
      time: "",
      date: "8/2/20",
      unreadCount: 2,
      image: AppAssets.imgProfile1,
      isOnline: true,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Sound good to me!",
      time: "",
      date: "9/2/20",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: false,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Sound good to me!",
      time: "",
      date: "9/2/20",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: false,
    ),
    ChatModel(
      name: "Rose Ward",
      lastMessage: "Sound good to me!",
      time: "",
      date: "9/2/20",
      unreadCount: 0,
      image: AppAssets.imgProfile1,
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtChats,
              isShowSearch: true,
              isShowMore: true,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: chatList.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Divider(height: 1, color: CustomAppColor.of(context).divider),
                ),
                itemBuilder: (context, index) {
                  final chat = chatList[index];
                  return IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                      child: InkWell(
                        onTap: () => Navigator.push(context, ChatScreen.route()),
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity.standard,
                          contentPadding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 8.setWidth),
                          titleAlignment: ListTileTitleAlignment.top,
                          leading: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60.setWidth,
                                height: 60.setHeight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(chat.image),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              if (chat.isOnline)
                                Positioned(
                                  left: 8.setWidth,
                                  top: 2.setHeight,
                                  child: Container(
                                    width: 9.setWidth,
                                    height: 9.setHeight,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 0.5),
                                    ),
                                  ),
                                ),
                              if (chat.unreadCount > 0)
                                Positioned(
                                    right: 0.setWidth,
                                    bottom: -2.setHeight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 2.setHeight),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomAppColor.of(context).txtPink,
                                        border: Border.all(color: Colors.white, width: 1),
                                      ),
                                      child: CommonText(
                                        text: chat.unreadCount.toString(),
                                        fontSize: 11.setFontSize,
                                        fontWeight: FontWeight.w500,
                                        textColor: CustomAppColor.of(context).white,
                                      ),
                                    ))
                            ],
                          ),
                          horizontalTitleGap: 12.setWidth,
                          title: CommonText(
                            text: chat.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.setFontSize,
                            textAlign: TextAlign.start,
                            textColor: CustomAppColor.of(context).txtVelvet,
                          ),
                          subtitle: CommonText(
                            text: chat.lastMessage,
                            fontSize: 14.setFontSize,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w500,
                            textColor: chat.unreadCount > 0 ? CustomAppColor.of(context).txtVelvet : CustomAppColor.of(context).txtGrey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CommonText(
                                text: chat.time.isNotEmpty ? chat.time : chat.date,
                                textColor: chat.unreadCount > 0 ? CustomAppColor.of(context).txtVelvet : CustomAppColor.of(context).txtGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.setFontSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
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
    if (name == Constant.strSearch) {
      Navigator.push(context, ChatsSearchScreen.route());
    }
  }
}
