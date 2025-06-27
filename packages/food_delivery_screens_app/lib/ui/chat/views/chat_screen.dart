import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/chat/datamodels/chat_data.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final bool isFromPastThread;

  static Route<void> route({required bool isFromPastThread}) {
    return MaterialPageRoute(builder: (_) => ChatScreen(isFromPastThread: isFromPastThread));
  }

  const ChatScreen({super.key, required this.isFromPastThread});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements TopBarClickListener {
  List<ChatMessage> allMessages = [];

  void fillData() {
    allMessages = [
      ChatMessage(
        message: "I haven't received this order",
        sender: MessageSender.user,
        time: DateTime.parse("2021-05-26 16:19"),
      ),
      ChatMessage(
        message: "Hey there, I am the bot.\nCan you please send me order no.?",
        sender: MessageSender.bot,
        time: DateTime.parse("2021-05-26 16:19"),
      ),
      ChatMessage(
        message: "Order #25478965145265",
        sender: MessageSender.user,
        time: DateTime.parse("2021-05-26 16:22"),
      ),
      ChatMessage(
        message:
            "Sorry to hear that you haven't yet received your order, I would like to inform you that we deal with these complaints strictly and if found guilty, the delivery partner is penalised.",
        sender: MessageSender.bot,
        time: DateTime.parse("2021-05-26 16:24"),
      ),
      ChatMessage(
        message: "Please let us know how you would like to continue.",
        sender: MessageSender.bot,
        time: DateTime.parse("2021-05-26 16:24"),
        type: MessageType.options,
        options: ["My order has been delivered", "I want to close this order"],
      ),
      ChatMessage(
        message: "I want to close this order",
        sender: MessageSender.user,
        time: DateTime.parse("2021-05-26 16:25"),
      ),
      ChatMessage(
        message: "Thank you for your feedback",
        sender: MessageSender.bot,
        time: DateTime.parse("2021-05-26 16:25"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtChat,
              isShowBack: true,
            ),
            Expanded(
              child: widget.isFromPastThread ? MessagesListView(allMessagesList: allMessages) : const EmptyChatView(),
            ),
            widget.isFromPastThread
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
                    child: CommonText(
                      text: "Closed on May 26, 2021, 04:25 PM",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 2.setHeight),
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).textFormFieldBg,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Message......',
                                      hintStyle: TextStyle(
                                        fontFamily: Constant.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.setFontSize,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.icEmoji,
                                      height: 15.setHeight,
                                      width: 15.setWidth,
                                    ),
                                    SizedBox(width: 10.setWidth),
                                    Image.asset(
                                      AppAssets.icPickImage,
                                      height: 15.setHeight,
                                      width: 15.setWidth,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Image.asset(
                          AppAssets.icMicrophone,
                          height: 50.setHeight,
                          width: 50.setWidth,
                        ),
                      ],
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

class EmptyChatView extends StatelessWidget {
  const EmptyChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(
            text: Languages.of(context).txtHowCanIHelpWithYou,
            fontWeight: FontWeight.w600,
            fontSize: 22.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
            child: CommonText(
              text: Languages.of(context).txtHowCanIHelpWithYouDesc,
              fontWeight: FontWeight.w400,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesListView extends StatelessWidget {
  final List<ChatMessage> allMessagesList;

  const MessagesListView({super.key, required this.allMessagesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: allMessagesList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              CommonText(
                text: "May 26, 2021",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(height: 8.setHeight),
            ],
          );
        }

        final msg = allMessagesList[index - 1];
        if (msg.type == MessageType.options) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 25.setWidth,
                      height: 25.setHeight,
                      padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 4.setWidth),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Image.asset(
                        AppAssets.imgLogo,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                    SizedBox(width: 6.setWidth),
                    ChatOptionsCard(
                      title: msg.message,
                      options: msg.options?.toList() ?? [],
                      onOptionSelected: (selected) {
                        // Handle action here
                      },
                      sender: msg.sender,
                    ),
                  ],
                ),
                _timeText(msg.time),
              ],
            ),
          );
        } else {
          return Align(
            alignment: msg.sender == MessageSender.user ? Alignment.centerRight : Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: msg.sender == MessageSender.user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                msg.sender == MessageSender.bot ? _botAvatarWithMessage(msg.message, context) : _userMessage(msg.message, context),
                _timeText(msg.time),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _botAvatarWithMessage(String msg, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 25.setWidth,
          height: 25.setHeight,
          padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 4.setWidth),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomAppColor.of(context).primary,
          ),
          child: Image.asset(
            AppAssets.imgLogo,
            color: CustomAppColor.of(context).white,
          ),
        ),
        SizedBox(width: 6.setWidth),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(right: 50.setWidth),
            padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 10.setWidth),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).detailScreenBg,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: CommonText(
              text: msg,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
              letterSpacing: -0.1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _userMessage(String msg, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 10.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: CommonText(
        text: msg,
        fontSize: 12.setFontSize,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.start,
        textColor: CustomAppColor.of(context).white,
      ),
    );
  }

  Widget _timeText(DateTime time) {
    return Padding(
      padding: EdgeInsets.only(top: 8.setHeight, bottom: 12.setHeight, left: 30.setWidth),
      child: Text(
        DateFormat('hh:mm a').format(time),
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}

class ChatOptionsCard extends StatelessWidget {
  final String title;
  final List<String> options;
  final void Function(String) onOptionSelected;
  final MessageSender sender;

  const ChatOptionsCard({
    super.key,
    required this.title,
    required this.options,
    required this.onOptionSelected,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(maxWidth: 290.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).detailScreenBg,
          border: Border.all(color: CustomAppColor.of(context).containerBorder),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            bottomLeft: sender == MessageSender.bot ? const Radius.circular(0) : const Radius.circular(20),
            bottomRight: sender == MessageSender.user ? const Radius.circular(0) : const Radius.circular(20),
            topRight: const Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 14.setHeight),
              child: CommonText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 11.setFontSize,
              ),
            ),
            ...List.generate(options.length, (index) {
              final isLast = index == options.length - 1;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () => onOptionSelected(options[index]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScaffold,
                        borderRadius: BorderRadius.only(bottomRight: isLast ? const Radius.circular(20) : Radius.zero),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.setHeight),
                      child: CommonText(
                        text: options[index],
                        textColor: CustomAppColor.of(context).primary,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      thickness: 0.6,
                      color: CustomAppColor.of(context).containerBorder,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
