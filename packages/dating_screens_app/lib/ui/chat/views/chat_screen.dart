import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/ui/video_call/views/video_call_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../phone_call/views/phone_call_screen.dart';
import '../datamodels/chat_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static Route<void> route() => MaterialPageRoute(builder: (_) => const ChatScreen());

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements TopBarClickListener {
  List<ChatMessage> chatMessages = [
    ChatMessage(message: "Hello, How are you?", time: DateTime(2020, 12, 4, 16, 12), isUser: false, dateLabel: "DECEMBER 4, 2020"),
    ChatMessage(message: "I am fine! What about you?", time: DateTime(2020, 12, 4, 16, 30), isUser: true),
    ChatMessage(message: ":) :) :) You so smart boy. will you be my bit?", time: DateTime(2025, 17, 6, 5, 0), isUser: false, dateLabel: "YESTERDAY"),
    ChatMessage(message: "It’s been 1 year... Did  you get an oreo?", time: DateTime(2025, 17, 6, 6, 15), isUser: true),
    ChatMessage(message: "I am great thanks", isUser: false, dateLabel: "TODAY"),
    ChatMessage(message: "Sound good to me!", time: DateTime(2025, 18, 6, 8, 17), isUser: false),
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              isShowPhoneCall: true,
              isShowVideoCall: true,
              isShowMoreInChat: true,
              isShowUserDetails: true,
              profileImage: AppAssets.imgProfile1,
              status: "Online",
              userName: "Rose ward",
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 5.setHeight),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final msg = chatMessages[index];
                  final showDate = msg.dateLabel != null;
                  // Check if the previous message is from the same sender
                  final bool showProfile = index == 0 || chatMessages[index - 1].isUser != msg.isUser;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (showDate)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                          child: CommonText(
                            text: msg.dateLabel!,
                            textColor: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.setFontSize,
                          ),
                        ),
                      _groupedMessageBubble(context, msg, showProfile),
                      Visibility(
                        visible: msg.time != null,
                        child: Align(
                          alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.setHeight, bottom: 5.setHeight, left: 40.setWidth),
                            child: CommonText(
                              text: msg.time != null ? TimeOfDay.fromDateTime(msg.time!).format(context) : '',
                              textColor: CustomAppColor.of(context).txtGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.setFontSize,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, bottom: 20.setHeight),
              child: _messageInputBox(context, _controller),
            ),
          ],
        ),
      ),
    );
  }

  Widget _groupedMessageBubble(BuildContext context, ChatMessage msg, bool showProfile) {
    final isUser = msg.isUser;
    final bubbleColor = isUser ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).chatBubbleSender;
    final textColor = isUser ? Colors.white : CustomAppColor.of(context).txtVelvet;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser && showProfile)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(AppAssets.imgProfile1),
            ),
          )
        else if (!isUser)
          SizedBox(width: 40.setWidth),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.55),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 10.setHeight),
              margin: EdgeInsets.symmetric(vertical: 4.setHeight),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(50),
                  bottomRight: const Radius.circular(50),
                  topLeft: Radius.circular(isUser ? 50 : 0),
                  topRight: Radius.circular(isUser ? 0 : 50),
                ),
              ),
              child: CommonText(
                text: msg.message,
                textColor: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 13.setFontSize,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _messageInputBox(BuildContext context, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgTextFormField,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icEmoji,
            height: 21.setHeight,
            width: 21.setWidth,
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(
                  hintText: "Type a message...",
                  hintStyle: TextStyle(
                    fontSize: 15.setFontSize,
                    color: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamily,
                  )),
            ),
          ),
          Image.asset(
            AppAssets.icAttachment,
            height: 21.setHeight,
            width: 21.setWidth,
          ),
          SizedBox(width: 13.setWidth),
          Image.asset(
            AppAssets.icShare,
            height: 21.setHeight,
            width: 21.setWidth,
            color: _controller.text.isEmpty ? CustomAppColor.of(context).txtGrey : CustomAppColor.of(context).txtPink,
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
    if (name == Constant.strVideoCall) {
      Navigator.push(context, VideoCallScreen.route());
    }
    if (name == Constant.strPhoneCall) {
      Navigator.push(context, PhoneCallScreen.route());
    }
  }
}

extension CustomColorOpacity on Color {
  Color withOpacityPercent(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }
}
