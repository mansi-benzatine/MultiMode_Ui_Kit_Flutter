import 'package:chat_ai_app_package/dialogs/bottom_sheet/rename_bottom_sheet.dart';
import 'package:chat_ai_app_package/dialogs/bottom_sheet/share_bottom_sheet.dart';
import 'package:chat_ai_app_package/ui/chat/datamodel/chat_data.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/clear_chat_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ChatScreen extends StatefulWidget {
  final bool isNewChat;
  final String chatTitle;
  const ChatScreen({super.key, required this.isNewChat, required this.chatTitle});

  static Route<void> route({required bool isNewChat, required String chatTitle}) {
    return MaterialPageRoute<void>(builder: (_) => ChatScreen(isNewChat: isNewChat, chatTitle: chatTitle));
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements TopBarClickListener {
  List<ShareData> recentPeopleList = [];
  List<ShareData> socialMediaList = [];
  List<ChatMessage> chatMessages = [];

  void fillDate() {
    recentPeopleList = [
      ShareData(
        username: "Stilla Sulevan",
        userProfileUrl: AppAssets.imgUser1,
        socialPlatformUrl: AppAssets.icSquareWhatsapp,
      ),
      ShareData(
        username: "Rony Marsun",
        userProfileUrl: AppAssets.imgUser2,
        socialPlatformUrl: AppAssets.icSquareFacebook,
      ),
      ShareData(
        username: "Zoya Nick",
        userProfileUrl: AppAssets.imgUser3,
        socialPlatformUrl: AppAssets.icSquareInstagram,
      ),
      ShareData(
        username: "Anish Stive",
        userProfileUrl: AppAssets.imgUser4,
        socialPlatformUrl: AppAssets.icSquareWhatsapp,
      ),
      ShareData(
        username: "Orray Jackson",
        userProfileUrl: AppAssets.imgUser5,
        socialPlatformUrl: AppAssets.icSquareFacebook,
      )
    ];
    socialMediaList = [
      ShareData(socialPlatformName: "Whatsapp", socialPlatformUrl: AppAssets.icSquareWhatsapp),
      ShareData(socialPlatformName: "Facebook", socialPlatformUrl: AppAssets.icSquareFacebook),
      ShareData(socialPlatformName: "Instagram", socialPlatformUrl: AppAssets.icSquareInstagram),
      ShareData(socialPlatformName: "Twitter", socialPlatformUrl: AppAssets.icSquareTwitter),
      ShareData(socialPlatformName: "Telegram", socialPlatformUrl: AppAssets.icSquareTelegram),
    ];
    chatMessages = [
      ChatMessage(
          sender: ChatSender.user,
          message:
              "how can i figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of  printing and typesetting industry."),
      ChatMessage(
          sender: ChatSender.bot,
          message:
              "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of  printing and typesetting industry\n\n 1.how can i figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n 2.Lorem Ipsum is simply dummy text of  printing and typesetting industry.\n\n 3.simply dummy text of  printing and typesetting industry. simply dummy text of  printing and typesetting industry.\n\n 4.Lorem Ipsum is simply dummy text of  printing and typesetting industry."),
      ChatMessage(
          sender: ChatSender.user,
          message:
              "Lorem Ipsum is simply dummy text of  printing and typesetting industry. Lorem Ipsum is simply dummy text of  printing and typesetting industry. "),
      ChatMessage(
          sender: ChatSender.bot,
          message:
              "simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy figure out Lorem Ipsum is text of  printing and typesetting industry.\n\nLorem Ipsum is simply dummy figure out Lorem Ipsu text of  printing and typesetting industry.Lorem Ipsum is simply dummy figure out Lorem Ipsum is text of  printing and typesetting industry.Lorem Ipsum is simply dummy figure out Lorem Ipsu\nis text of  printing and typesetting industry."),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillDate();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            TopBar(
              this,
              title: widget.chatTitle,
              isShowMore: true,
            ),
            Expanded(
              child: widget.isNewChat ? const _ChatEmptyView() : _ChatListView(chatMessages: chatMessages),
            ),
            const _InputFieldView(),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strClearChat) {
      Utils.showBottomSheetDialog(
        context,
        title: Languages.of(context).txtClearChat,
        titleColor: CustomAppColor.of(context).txtBlack,
        widgets: ClearChatBottomSheet(
          onLogout: () {
            Navigator.pop(context);
          },
        ),
      );
    }
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strRename) {
      Utils.showBottomSheetDialog(
        context,
        title: Languages.of(context).txtRename,
        titleColor: CustomAppColor.of(context).txtBlack,
        isScrollControlled: true,
        widgets: RenameBottomSheet(
          onLogout: () {
            Navigator.pop(context);
          },
        ),
      );
    }
    if (name == Constant.strShareChat) {
      Utils.showBottomSheetDialog(
        context,
        title: Languages.of(context).txtShareChat,
        titleColor: CustomAppColor.of(context).txtBlack,
        widgets: ShareBottomSheet(
          recentPeople: recentPeopleList,
          socialMediaList: socialMediaList,
          onLogout: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }
}

class _ChatListView extends StatelessWidget {
  final List<ChatMessage> chatMessages;

  const _ChatListView({required this.chatMessages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: chatMessages.length,
      padding: EdgeInsets.only(top: 15.setHeight),
      itemBuilder: (BuildContext context, int index) {
        final message = chatMessages[index];
        if (message.sender == ChatSender.bot) {
          return _itemLeft(context: context, message: message);
        } else {
          return _itemRight(context: context, message: message);
        }
      },
    );
  }

  Widget _itemLeft({required BuildContext context, required ChatMessage message}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.setHeight),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20.setWidth),
              Image.asset(
                AppAssets.icAppLogoRound,
                height: 30.setHeight,
                width: 30.setWidth,
                gaplessPlayback: true,
              ),
              SizedBox(width: 10.setWidth),
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.screenWidth * .78,
                      minWidth: 0.screenWidth * .30,
                    ),
                    padding: EdgeInsets.all(12.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: message.message,
                          textColor: CustomAppColor.of(context).black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AppAssets.icCopy,
                    height: 18.setHeight,
                    width: 18.setWidth,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 5.setWidth),
                  Image.asset(
                    AppAssets.icShare,
                    height: 16.setHeight,
                    width: 16.setWidth,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 5.setWidth),
                  Image.asset(
                    AppAssets.icVolume,
                    height: 18.setHeight,
                    width: 18.setWidth,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemRight({required BuildContext context, required ChatMessage message}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.setHeight),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.setWidth),
              Image.asset(
                AppAssets.imgDummyProfile,
                height: 30.setHeight,
                width: 30.setWidth,
                gaplessPlayback: true,
              ),
              SizedBox(width: 10.setWidth),
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.screenWidth * .78,
                      minWidth: 0.screenWidth * .30,
                    ),
                    padding: EdgeInsets.all(12.setHeight),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: CustomAppColor.of(context).listTileColor),
                      color: CustomAppColor.of(context).bgWhiteGrey,
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).txtWhite.withOpacityPercent(0.2),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: CustomAppColor.of(context).txtWhite,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: message.message,
                          textColor: CustomAppColor.of(context).txtBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                          height: 1.3,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8.setHeight),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppAssets.icEditChat,
                height: 18.setHeight,
                width: 18.setWidth,
                color: CustomAppColor.of(context).txtGray,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//ignore: unused_element
class _ChatEmptyView extends StatelessWidget {
  const _ChatEmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgBotPlaceholder,
              height: 300.setHeight,
              width: 300.setHeight,
              gaplessPlayback: true,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatCanIHelpWith,
              fontWeight: FontWeight.w600,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.setHeight),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CommonText(
                text: Languages.of(context).txtLoremIpsumDesc,
                fontWeight: FontWeight.w400,
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
                height: 1.2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputFieldView extends StatelessWidget {
  const _InputFieldView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
        child: Row(
          children: [
            Expanded(
              child: CommonTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                maxLines: 2,
                fillColor: CustomAppColor.of(context).white,
                radius: 500,
                hintText: Languages.of(context).txtTypeMessage,
                borderColor: CustomAppColor.of(context).black,
              ),
            ),
            SizedBox(width: 10.setWidth),
            Image.asset(
              AppAssets.icSend,
              height: 50.setHeight,
              width: 50.setHeight,
              gaplessPlayback: true,
            ),
          ],
        ),
      ),
    );
  }
}
