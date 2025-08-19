import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/ui/call/view/call_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';

import '../../../utils/app_color.dart';
import '../datamodel/chat_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChatScreen());
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> messages = [
    ChatMessage(message: "Hello sir, where are you?", time: "09:31 am", isSentByMe: true),
    ChatMessage(message: "I am nearby jackson circle", time: "09:32 am", isSentByMe: false),
    ChatMessage(message: "Sorry sir, I am stuck in traffic.\nPlease give me a moment", time: "09:35 am", isSentByMe: true),
    ChatMessage(message: "Ok no problem,\nI am waiting", time: "09:33 am", isSentByMe: false),
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
      appBar: AppBar(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        elevation: 0,
        leadingWidth: 40,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(AppAssets.imgDummyProfile)),
            SizedBox(width: 10.setWidth),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Brayden Jockos",
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w600,
                ),
                CommonText(text: "● Online", textColor: Colors.green, fontSize: 12.setFontSize),
              ],
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 14.setWidth),
          child: IconButton(
              icon: Icon(Icons.arrow_back, color: CustomAppColor.of(context).icBlackWhite),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, CallScreen.route()),
            icon: Icon(
              Icons.call,
              color: CustomAppColor.of(context).icBlackWhite,
            ),
          ),
          SizedBox(width: 20.setWidth),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Column(
            children: [
              SizedBox(height: 8.setHeight),
              CommonText(
                text: "Today",
                textColor: CustomAppColor.of(context).txtGray,
                fontWeight: FontWeight.w400,
                fontSize: 12.setFontSize,
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
    );
  }

  Widget _buildMessage(ChatMessage msg) {
    return Align(
      alignment: msg.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
        child: Row(
          mainAxisAlignment: msg.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!msg.isSentByMe)
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.imgDummyProfile),
                radius: 18,
              ),
            SizedBox(width: 10.setWidth),
            Column(
              crossAxisAlignment: msg.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
                  decoration: BoxDecoration(
                    color: msg.isSentByMe ? CustomAppColor.of(context).chatBubbleFromMe : CustomAppColor.of(context).chatBubbleFromSender,
                    borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(12),
                        bottomRight: msg.isSentByMe ? const Radius.circular(0) : const Radius.circular(12),
                        bottomLeft: !msg.isSentByMe ? const Radius.circular(0) : const Radius.circular(12),
                        topLeft: const Radius.circular(12)),
                  ),
                  child: CommonText(
                    text: msg.message,
                    textColor: msg.isSentByMe ? Colors.white : CustomAppColor.of(context).txtBlack,
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 4.setHeight),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: msg.time,
                      fontSize: 12,
                      textColor: const Color(0xFF95969D),
                    ),
                    SizedBox(width: 5.setWidth),
                    if (msg.isSentByMe) const Icon(Icons.done_all, color: Colors.green, size: 16),
                  ],
                ),
              ],
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
                  Icon(
                    Icons.emoji_emotions_outlined,
                    size: 20,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Write your message",
                        hintStyle: TextStyle(color: CustomAppColor.of(context).txtGray, fontSize: 12.setFontSize, fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.icAttachment,
                    width: 20.setWidth,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 8.setWidth),
                  Image.asset(
                    AppAssets.icVoiceRecording,
                    width: 24.setWidth,
                    height: 24.setHeight,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).btnPrimary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(13),
              child: Image.asset(
                AppAssets.icSend,
                height: 24.setHeight,
                width: 24.setWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
