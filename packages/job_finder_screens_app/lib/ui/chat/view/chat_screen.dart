import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../video_call/view/video_call_screen.dart';
import '../../voice_call/view/voice_call_screen.dart';
import '../datamodel/chat_data.dart';

class ChatScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChatScreen());
  }

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements TopBarClickListener {
  List<ChatMessage> chatList = [];

  void fillData() {
    chatList = [
      ChatMessage(
        message: "Alex – CV / UI/UX Designer.pdf",
        time: "09:35 am",
        isSentByMe: true,
        isFile: true,
        fileName: "Alex – CV / UI/UX Designer.pdf",
        fileSize: "867 KB",
        isSeen: false,
      ),
      ChatMessage(
        message: "Oh yes, please send your CV/Resume here",
        time: "09:34 am",
        isSentByMe: false,
      ),
      ChatMessage(
        message: "I saw the UI/UX Designer vacancy that you uploaded on LinkedIn yesterday and I am interested in joining your company.",
        time: "09:33 am",
        isSentByMe: true,
        isSeen: true,
      ),
      ChatMessage(
        message: "Morning, Can I help you?",
        time: "09:31 am",
        isSentByMe: false,
      ),
      ChatMessage(
        message: "Hello sir, Good Morning",
        time: "09:30 am",
        isSentByMe: true,
        isSeen: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
        statusBarBrightness: Utils.isDarkTheme() ? Brightness.dark : Brightness.light,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowChatUserDetails: true,
                chatUserName: "Julie Young",
                isShowCall: true,
                isShowVideoCall: true,
                chatUserProfilePath: AppAssets.imgAvatarMessage3,
                chatStatusColor: CustomAppColor.of(context).txtGreen,
                chatStatus: "Online",
                iconColor: CustomAppColor.of(context).bgDetailsCard,
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(
                  left: 16.setWidth,
                  right: 16.setWidth,
                  top: 8.setHeight,
                  bottom: 16.setHeight,
                ),
                itemCount: chatList.length + 1,
                itemBuilder: (context, index) {
                  if (index == chatList.length) {
                    return Padding(
                      padding: EdgeInsets.only(top: 100.setHeight, bottom: 10.setHeight),
                      child: Center(
                        child: CommonText(
                          text: "Today",
                          textColor: CustomAppColor.of(context).txtGrey,
                          fontSize: 14.setFontSize,
                        ),
                      ),
                    );
                  }
                  final message = chatList[index];
                  return ChatBubble(message: message);
                },
              ),
            ),
            const InputTextFieldView(),
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
    if (name == Constant.strVideoCall) {
      Navigator.push(context, VideoCallScreen.route());
    }
    if (name == Constant.strVoiceCall) {
      Navigator.push(context, VoiceCallScreen.route());
    }
  }
}

class InputTextFieldView extends StatelessWidget {
  const InputTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.setWidth, left: 24.setWidth, bottom: 20.setHeight),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
                  hintText: Languages.of(context).txtWriteYourMessage,
                  hintStyle: TextStyle(
                    fontSize: 13.setFontSize,
                    color: CustomAppColor.of(context).txtHintGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamily,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                    child: Image.asset(
                      AppAssets.icEmoji,
                      height: 19.setHeight,
                      width: 19.setWidth,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 40.setWidth,
                    minHeight: 40.setHeight,
                  ),
                  suffixIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    width: 80.setWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.setWidth),
                          child: Image.asset(
                            AppAssets.icAttachment,
                            height: 24.setHeight,
                            width: 24.setWidth,
                          ),
                        ),
                        Image.asset(
                          AppAssets.icVoiceRecording,
                          height: 24.setHeight,
                          width: 24.setWidth,
                        ),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          Container(
            height: 50.setHeight,
            width: 50.setWidth,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).secondary,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AppAssets.icSend,
              width: 22.setWidth,
              height: 22.setHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSentByMe)
            Padding(
              padding: EdgeInsets.only(right: 8.setWidth, bottom: 8.setHeight),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppAssets.imgAvatarMessage3),
              ),
            ),
          Column(
            crossAxisAlignment: message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message.isFile)
                FileBubble(message: message)
              else
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 15.setWidth),
                  margin: EdgeInsets.only(top: 14.setHeight, bottom: 4.setHeight),
                  decoration: BoxDecoration(
                    color: message.isSentByMe ? CustomAppColor.of(context).bgChatBubbleSecondary : CustomAppColor.of(context).bgChatBubblePrimary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(message.isSentByMe ? 0 : 18),
                      bottomLeft: Radius.circular(message.isSentByMe ? 18 : 0),
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                    ),
                  ),
                  constraints: BoxConstraints(maxWidth: message.isSentByMe ? 261.setWidth : 192.setWidth),
                  child: CommonText(
                    text: message.message,
                    textColor: message.isSentByMe ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtSecondaryWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.setFontSize,
                    textAlign: TextAlign.start,
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: message.time,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.setFontSize,
                  ),
                  if (message.isSentByMe)
                    Padding(
                      padding: EdgeInsets.only(left: 2.setWidth), // Reduced left padding
                      child: Image.asset(
                        message.isSeen ?? false ? AppAssets.icDoubleCheck : AppAssets.icCheck,
                        width: 13.setWidth,
                        height: 9.setHeight,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FileBubble extends StatelessWidget {
  final ChatMessage message;

  const FileBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.setHeight),
      padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 15.setWidth),
      constraints: BoxConstraints(maxWidth: 216.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgChatBubbleSecondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icPdf,
            height: 44.setHeight,
            width: 44.setWidth,
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: message.fileName ?? "File",
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).white,
                ),
                CommonText(
                  text: message.fileSize ?? '',
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).white,
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: CustomAppColor.of(context).white,
            weight: 24.setWidth,
          ),
        ],
      ),
    );
  }
}
