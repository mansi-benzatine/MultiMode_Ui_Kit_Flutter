import 'package:flutter/material.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../chat/view/chat_screen.dart';
import '../datamodel/message_data.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MessageScreen());
  }

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<MessageData> messageList = [];
  List<MessageData> filteredMessageList = [];
  TextEditingController searchController = TextEditingController();
  ValueNotifier<String> searchQuery = ValueNotifier<String>("");
  void fillData() {
    messageList = [
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage3,
        time: "09:30 am",
        username: "Julie Young",
        message: "Alex – CV / UI/UX Designer.pdf",
        isMessageSeen: false,
        messageCount: 2,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage1,
        time: "5m ago",
        username: "Andy Robertson",
        message: "I saw the UI/UX Designer vac.... ",
        isMessageSeen: true,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage2,
        time: "30m ago",
        username: "Giorgio Chiellini",
        message: "Hello sir, Good Morning",
        isMessageSeen: true,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage4,
        time: "01:00 pm",
        username: "Megan Rapinoe",
        message: "We are looking for a web develop....",
        isMessageSeen: true,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage5,
        time: "06:00 pm",
        username: "Alessandro Bastoni",
        message: "I checked your portfolio. It looks....",
        isMessageSeen: true,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage6,
        time: "Yesterday",
        username: "Ilkay Gundogan",
        message: "Are you available for an interview....",
        isMessageSeen: true,
      ),
      MessageData(
        userProfilePath: AppAssets.imgAvatarMessage7,
        time: "09:30 am",
        username: "Alex Morgan",
        message: "Thank you, Have a nice day...",
        isMessageSeen: true,
      ),
    ];
    filteredMessageList = List.from(messageList);
  }

  @override
  void initState() {
    super.initState();
    fillData();
    searchController.addListener(() {
      filterMessages(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterMessages(String query) {
    setState(() {
      filteredMessageList = messageList.where((msg) => msg.username.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchAndFilterView(
          controller: searchController,
        ),
        filteredMessageList.isNotEmpty ? _MessageListView(messageList: filteredMessageList) : const Expanded(child: EmptyView()),
      ],
    );
  }
}

class _SearchAndFilterView extends StatelessWidget {
  final TextEditingController controller;
  const _SearchAndFilterView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerPrimary,
            border: Border(
              top: BorderSide(
                width: 0,
                color: CustomAppColor.of(context).bgContainerPrimary,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.setWidth),
                  child: CommonTextFormFieldWithPrefix(
                    controller: controller,
                    hintText: Languages.of(context).txtSearchMessages,
                    prefixIcon: AppAssets.icSearch,
                    fillColor: CustomAppColor.of(context).bgTextFormFieldGreySecondary,
                    prefixIconColor: CustomAppColor.of(context).icGrey,
                    hintTextFontSize: 14.setFontSize,
                    hintFontWeight: FontWeight.w400,
                    hintWordSpacing: 0.1,
                    borderColor: CustomAppColor.of(context).transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MessageListView extends StatelessWidget {
  final List<MessageData> messageList;
  const _MessageListView({required this.messageList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messageList.length,
        padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final message = messageList[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context, ChatScreen.route(userProfile: message.userProfilePath, userName: message.username, lastMessage: message.message)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.setHeight),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Image.asset(message.userProfilePath),
                  ),
                  SizedBox(width: 15.setWidth),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.setHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: message.username,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w700,
                                textColor: CustomAppColor.of(context).txtSecondaryWhite,
                              ),
                              CommonText(
                                text: message.time,
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGrey,
                              ),
                            ],
                          ),
                          SizedBox(height: 6.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: message.message,
                                fontSize: 12.setFontSize,
                                fontWeight: message.isMessageSeen ? FontWeight.w400 : FontWeight.w700,
                                textColor: message.isMessageSeen ? CustomAppColor.of(context).txtGrey : CustomAppColor.of(context).txtSecondaryGrey,
                              ),
                              if (message.messageCount != null)
                                Container(
                                  width: 14.setWidth,
                                  height: 14.setHeight,
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).icPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: message.messageCount.toString(),
                                    fontSize: 9.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 111.setHeight),
          Image.asset(
            AppAssets.imgBgEmptyMessage,
            width: 200.setWidth,
            height: 189.setHeight,
          ),
          SizedBox(height: 25.setHeight),
          CommonText(
            text: Languages.of(context).txtNoMessage,
            fontWeight: FontWeight.w700,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondary,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtNoMessageDesc,
            fontWeight: FontWeight.w400,
            fontSize: 12.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          )
        ],
      ),
    );
  }
}
