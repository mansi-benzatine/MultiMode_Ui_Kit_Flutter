import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../call/view/call_screen.dart';

class CustomerService extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CustomerService());
  }

  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> implements TopBarClickListener {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<ChatMessage> messages = [
    ChatMessage(
      text: "Today",
      isDate: true,
      timestamp: DateTime.now(),
    ),
    ChatMessage(
      text: "Good Morning",
      isFromCustomer: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ChatMessage(
      text: "I Am Customer Service, Is There Anything I Can Help You?",
      isFromCustomer: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ChatMessage(
      text: "Hi I Am Maria",
      isFromCustomer: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    ),
    ChatMessage(
      text: "I Having Problem With Sell My Car. Can You Help Me?",
      isFromCustomer: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    ),
    ChatMessage(
      text: "Of Course",
      isFromCustomer: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    ChatMessage(
      text: "Can You Tell Me Your Problem? I Can Solve It.",
      isFromCustomer: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          text: _messageController.text.trim(),
          isFromCustomer: true,
          timestamp: DateTime.now(),
        ));
      });
      _messageController.clear();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtCustomerService,
              isShowBack: true,
              isShowCall: true,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return _buildMessageItem(messages[index]);
                      },
                    ),
                  ),
                  _buildMessageInput(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    if (message.isDate) {
      return _buildDateHeader(message.text);
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
        minHeight: 40.setHeight,
      ),
      margin: EdgeInsets.only(
        left: message.isFromCustomer ? 0.screenWidth * 0.25 : 0,
        right: message.isFromCustomer ? 0 : 0.screenWidth * 0.25,
        top: 5.setHeight,
        bottom: 5.setHeight,
      ),
      padding: EdgeInsets.only(
        left: 16.setWidth,
        right: 16.setWidth,
        top: 10.setHeight,
        bottom: 5.setHeight,
      ),
      decoration: BoxDecoration(
        gradient: message.isFromCustomer
            ? CustomAppColor.of(context).primaryGradient
            : LinearGradient(
                colors: [
                  CustomAppColor.of(context).bgSearchBar,
                  CustomAppColor.of(context).bgSearchBar,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.setWidth),
          bottomRight: Radius.circular(15.setWidth),
          topLeft: message.isFromCustomer ? Radius.circular(15.setWidth) : const Radius.circular(0),
          topRight: message.isFromCustomer ? const Radius.circular(0) : Radius.circular(15.setWidth),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        runSpacing: 2.setHeight,
        spacing: 2.setWidth,
        children: [
          CommonText(
            text: message.text,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: message.isFromCustomer ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 2.setHeight),
          Align(
            alignment: Alignment.centerRight,
            child: CommonText(
              text: DateFormat('h:mm a').format(message.timestamp),
              fontSize: 10.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: message.isFromCustomer ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.setHeight),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.setWidth,
            vertical: 3.setHeight,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgSearchBar,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CommonText(
            text: date,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16.setWidth),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgSearchBar,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(
                          color: CustomAppColor.of(context).txtGray,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.setHeight),
                      ),
                      style: TextStyle(
                        color: CustomAppColor.of(context).txtBlack,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle emoji/attachment
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.setWidth),
                      child: Text(
                        "😊",
                        style: TextStyle(fontSize: 20.setFontSize),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle attachment
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.setWidth),
                      child: Icon(
                        Icons.attach_file,
                        color: CustomAppColor.of(context).txtGray,
                        size: 20.setWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.setWidth),
          GestureDetector(
            onTap: _messageController.text.trim().isNotEmpty
                ? _sendMessage
                : () {
                    // Handle voice message
                  },
            child: Container(
              width: 48.setWidth,
              height: 48.setHeight,
              decoration: BoxDecoration(
                gradient: CustomAppColor.of(context).primaryGradient,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12.setWidth),
              child: Image.asset(
                _messageController.text.trim().isNotEmpty ? AppAssets.icSendMsg : AppAssets.icMic,
              ),
            ),
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
    if (name == Constant.strCall) {
      // Handle call action
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CallScreen()));
    }
  }
}

class ChatMessage {
  final String text;
  final bool isFromCustomer;
  final bool isDate;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    this.isFromCustomer = false,
    this.isDate = false,
    required this.timestamp,
  });
}
