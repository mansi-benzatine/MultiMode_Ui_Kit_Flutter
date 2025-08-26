import 'package:chat_ai_app_package/ui/home/datamodel/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../chat/view/chat_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../upgrade_plan/view/upgrade_plan_screen.dart';

class HomeScreen extends StatefulWidget {
  final PageController pageController;

  const HomeScreen({super.key, required this.pageController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MessageListData> recentChatList = [];
  void fillData() {
    recentChatList = [
      MessageListData(
        msgTitle: "how can i figure out Lorem Ipsum ",
        isToday: true,
        timeAgo: "15 min ago",
      ),
      MessageListData(
        msgTitle: "give me recipe of south dosa",
        isToday: true,
        timeAgo: "45 min ago",
      ),
      MessageListData(
        msgTitle: "uniqe name for food mobile application",
        isToday: true,
        timeAgo: "15 min ago",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          SizedBox(height: 10.setHeight),
          const _TopBarView(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.setHeight),
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 25.setHeight),
                  const _PurchaseCardView(),
                  const _TapToChatView(),
                  _RecentChatListView(pageController: widget.pageController, recentChatList: recentChatList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBarView extends StatefulWidget {
  const _TopBarView();

  @override
  State<_TopBarView> createState() => _TopBarViewState();
}

class _TopBarViewState extends State<_TopBarView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.setHeight),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icAiText,
            height: 30.setHeight,
            width: 30.setHeight,
            gaplessPlayback: true,
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtChatAI,
              fontWeight: FontWeight.w800,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, NotificationScreen.route());
            },
            child: Image.asset(
              AppAssets.icNotification,
              height: 25.setHeight,
              width: 25.setHeight,
              gaplessPlayback: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _PurchaseCardView extends StatefulWidget {
  const _PurchaseCardView();

  @override
  State<_PurchaseCardView> createState() => _PurchaseCardViewState();
}

class _PurchaseCardViewState extends State<_PurchaseCardView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 0.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(AppAssets.imgBgPurchaseCard),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.setHeight,
          vertical: 20.setHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtUpgradePlan,
              fontWeight: FontWeight.w800,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).white,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: Languages.of(context).txtUpgradePlanDesc,
              fontWeight: FontWeight.w700,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).white,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.setHeight),
            CommonButton(
              text: Languages.of(context).txtGetPremium,
              alignment: Alignment.centerLeft,
              height: 38.setHeight,
              width: 150.setWidth,
              buttonColor: CustomAppColor.of(context).white,
              onTap: () {
                Navigator.push(context, UpgradePlanScreen.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TapToChatView extends StatefulWidget {
  const _TapToChatView();

  @override
  State<_TapToChatView> createState() => _TapToChatViewState();
}

class _TapToChatViewState extends State<_TapToChatView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.setHeight),
          CommonText(
            text: "How Can I Help You Today?",
            fontWeight: FontWeight.w600,
            fontSize: 26.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            height: 1.10,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20.setHeight),
          InkWell(
            onTap: () {
              Navigator.push(context, ChatScreen.route(isNewChat: true, chatTitle: "New Chat"));
            },
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.imgTapToChat,
                    height: 200.setHeight,
                    width: 200.setHeight,
                    gaplessPlayback: true,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.setHeight),
                    child: CommonText(
                      text: Languages.of(context).txtTapToChat,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.setFontSize,
                      textColor: CustomAppColor.of(context).txtBlack,
                      height: 1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentChatListView extends StatefulWidget {
  final PageController pageController;
  final List<MessageListData> recentChatList;
  const _RecentChatListView({required this.pageController, required this.recentChatList});

  @override
  State<_RecentChatListView> createState() => _RecentChatListViewState();
}

class _RecentChatListViewState extends State<_RecentChatListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            CommonText(
              text: Languages.of(context).txtRecentChat,
              fontWeight: FontWeight.w600,
              fontSize: 20.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                widget.pageController.jumpToPage(2);
              },
              child: CommonText(
                text: Languages.of(context).txtViewAll,
                fontWeight: FontWeight.w400,
                fontSize: 16.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
                height: 1,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.setHeight),
        CommonText(
          text: "Today",
          fontWeight: FontWeight.w400,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtGray,
          height: 1,
          textAlign: TextAlign.start,
        ),

        ListView.separated(
          itemCount: widget.recentChatList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20.setHeight),
          itemBuilder: (context, index) {
            return _allChatItemView(
              context: context,
              index: index,
              message: widget.recentChatList[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.setHeight);
          },
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 100.setHeight),
        //   child: const HistoryEmptyView(),
        // ),
      ],
    );
  }

  Widget _allChatItemView({required BuildContext context, required int index, required MessageListData message}) {
    return GestureDetector(
      onTap: () => Navigator.push(context, ChatScreen.route(isNewChat: false, chatTitle: message.msgTitle ?? '')),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 76.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 76.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).red,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              extentRatio: 0.22,
              motion: const BehindMotion(),
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 0.screenWidth / 5,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).blue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        // REMOVE left radius
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 10.setHeight),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_rounded,
                      size: 28.setHeight,
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.22,
              motion: const BehindMotion(),
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 0.screenWidth / 5,
                    margin: EdgeInsets.only(bottom: 10.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).red,
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppAssets.icDelete,
                      height: 28.setHeight,
                      width: 28.setHeight,
                      gaplessPlayback: true,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: CustomAppColor.of(context).listTileColor),
                borderRadius: BorderRadius.circular(20),
                color: CustomAppColor.of(context).listTile,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: message.msgTitle ?? '',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                          height: 1,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                        SizedBox(height: 8.setHeight),
                        Row(
                          children: [
                            CommonText(
                              text: message.isToday ?? false ? "Today  |  " : " Yesterday  |  ",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).txtGray,
                              height: 1,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: message.timeAgo ?? "",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).txtGray,
                              height: 1,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  Image.asset(
                    AppAssets.icArrowRight,
                    height: 20.setHeight,
                    width: 20.setHeight,
                    gaplessPlayback: true,
                    color: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
