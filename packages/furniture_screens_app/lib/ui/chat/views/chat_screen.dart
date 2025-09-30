import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/ui/call/views/call_screen.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/chat_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChatScreen());
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements TopBarClickListener {
  final List<ChatMessage> messages = [
    ChatMessage(message: "Good Morning", time: "09:31 am", isSentByMe: false),
    ChatMessage(message: "I am customer service. is there anything i can help you?", time: "09:31 am", isSentByMe: false),
    ChatMessage(message: "Hi i am kelly", time: "09:32 am", isSentByMe: true),
    ChatMessage(message: "I having problem with my orders and payment.Can you help me?", time: "09:32 am", isSentByMe: true),
    ChatMessage(message: "Of Course", time: "09:35 am", isSentByMe: false),
    ChatMessage(message: "Can you tell me your problem?\n I can solve it.", time: "09:33 am", isSentByMe: false),
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          message: text,
          time: TimeOfDay.now().format(context),
          isSentByMe: true,
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: "Customer Service",
              isShowBack: true,
              isShowCall: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 8.setHeight),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).containerBg,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 3.setHeight, horizontal: 8.setWidth),
                      child: CommonText(
                        text: "Today",
                        textColor: CustomAppColor.of(context).txtLightGrey,
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 12.setFontSize,
                      ),
                    ),
                    SizedBox(height: 8.setHeight),
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) => _buildMessage(messages[index]),
                      ),
                    ),
                    _buildMessageInput(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(ChatMessage msg) {
    return Align(
      alignment: msg.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
        child: Row(
          mainAxisAlignment: msg.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: msg.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: msg.isSentByMe ? 120.setWidth : 0, right: msg.isSentByMe ? 0.setWidth : 120.setWidth),
                    padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
                    decoration: BoxDecoration(
                      color: msg.isSentByMe ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBg,
                      borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(12),
                          bottomRight: msg.isSentByMe ? const Radius.circular(0) : const Radius.circular(12),
                          bottomLeft: !msg.isSentByMe ? const Radius.circular(0) : const Radius.circular(12),
                          topLeft: const Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        CommonText(
                          text: msg.message,
                          textColor: msg.isSentByMe ? Colors.white : CustomAppColor.of(context).txtBlack,
                          fontSize: 15.setFontSize,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: Constant.fontFamilyMedium500,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.setHeight),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: msg.time,
                        fontSize: 10.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: const Color(0xFF95969D),
                      ),
                      SizedBox(width: 5.setWidth),
                      if (msg.isSentByMe) const Icon(Icons.done_all, color: Colors.green, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.setHeight, top: 10.setHeight),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2.setHeight),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(2, 2),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: CustomAppColor.of(context).bgAlertDialog,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) => _sendMessage(),
                      decoration: InputDecoration(
                        hintText: "Write your message",
                        hintStyle: TextStyle(
                          color: CustomAppColor.of(context).txtGray,
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                          package: "furniture_screens_app_package",
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    size: 20,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 8.setWidth),
                  Icon(
                    Icons.image_rounded,
                    size: 20,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).btnPrimary,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(13),
            child: Icon(
              Icons.mic_rounded,
              color: CustomAppColor.of(context).white,
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strCall) {
      Navigator.push(context, CallScreen.route());
    }
  }
}
