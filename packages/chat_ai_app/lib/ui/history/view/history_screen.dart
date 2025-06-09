import 'package:chat_ai_app_package/ui/search/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../dialogs/bottom_sheet/common_delete_data_bottom_sheet.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/view/history_empty_view.dart';
import '../../home/datamodel/home_data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with TickerProviderStateMixin {
  late TabController tabController;
  final ValueNotifier<int> _currentTabIndex = ValueNotifier<int>(0);
  List<MessageListData> recentChatList = [];
  void fillData() {
    recentChatList = [
      MessageListData(
        msgTitle: "How can i figure out Lorem Ipsum ",
        isToday: true,
        timeAgo: "15 min ago",
      ),
      MessageListData(
        msgTitle: "Give me recipe of south dosa",
        isToday: true,
        timeAgo: "45 min ago",
      ),
      MessageListData(
        msgTitle: "My brother birthday was coming...",
        isToday: false,
        timeAgo: "15 min ago",
      ),
      MessageListData(
        msgTitle: "How to convert html code to... ",
        isToday: false,
        timeAgo: "15 min ago",
      ),
      MessageListData(
        msgTitle: "Joke about animals",
        isToday: false,
        timeAgo: "15 min ago",
      ),
      MessageListData(
        msgTitle: "my brother birthday was coming...",
        isToday: false,
        timeAgo: "15 min ago",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        const _TopBarView(),
        _TabBarView(tabController: tabController, currentTabIndex: _currentTabIndex, allList: recentChatList),
      ],
    );
  }
}

class _TopBarView extends StatelessWidget {
  const _TopBarView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              AppAssets.icBack,
              width: 24.setWidth,
              height: 24.setHeight,
            ),
          ),
          const Spacer(),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtHistory,
              fontWeight: FontWeight.w800,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(context, SearchScreen.route());
            },
            child: Image.asset(
              AppAssets.icSearch,
              height: 22.setHeight,
              width: 22.setHeight,
              gaplessPlayback: true,
              color: CustomAppColor.of(context).txtBlack,
            ),
          ),
          SizedBox(width: 10.setWidth),
          InkWell(
            onTap: () {
              Utils.showBottomSheetDialog(
                context,
                title: Languages.of(context).txtDelete,
                widgets: DeleteBottomDataSheet(
                  deleteMessage: Languages.of(context).txtAreYouSureWantToDeleteAllHistoryIncludingSaveHistory,
                  onDelete: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
            child: Image.asset(
              AppAssets.icTrash,
              height: 22.setHeight,
              width: 22.setHeight,
              gaplessPlayback: true,
              color: CustomAppColor.of(context).txtBlack,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarView extends StatelessWidget {
  final TabController tabController;
  final ValueNotifier<int> currentTabIndex;
  final List<MessageListData> allList;

  const _TabBarView({required this.tabController, required this.currentTabIndex, required this.allList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: currentTabIndex,
            builder: (context, int value, child) {
              return Container(
                margin: EdgeInsets.only(
                  left: 15.setHeight,
                  right: 15.setHeight,
                  top: 15.setHeight,
                ),
                child: TabBar(
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  dividerHeight: 0,
                  splashBorderRadius: BorderRadius.circular(500),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: CustomAppColor.of(context).transparent,
                  physics: const NeverScrollableScrollPhysics(),
                  onTap: (int i) {
                    currentTabIndex.value = i;
                  },
                  tabs: [
                    Container(
                      height: 50.setHeight,
                      width: 0.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: (value == 0) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).unSelectedTabColor,
                      ),
                      margin: EdgeInsets.only(right: 8.setWidth),
                      child: Tab(
                        height: 50.setHeight,
                        child: CommonText(
                          text: Languages.of(context).txtAll,
                          fontWeight: (value == 0) ? FontWeight.w800 : FontWeight.w700,
                          fontSize: 18.setFontSize,
                          textColor: (value == 0) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.setHeight,
                      width: 0.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: (value == 1) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).unSelectedTabColor,
                      ),
                      margin: EdgeInsets.only(left: 8.setWidth),
                      child: Tab(
                        height: 50.setHeight,
                        child: CommonText(
                          text: "Recent",
                          fontWeight: (value == 1) ? FontWeight.w800 : FontWeight.w700,
                          fontSize: 18.setFontSize,
                          textColor: (value == 1) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _AllHistoryListView(allList: allList),
                // HistoryEmptyView(),
                // _SavedHistoryListView(),
                const HistoryEmptyView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AllHistoryListView extends StatelessWidget {
  final List<MessageListData> allList;
  const _AllHistoryListView({required this.allList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: allList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 15.setWidth),
      itemBuilder: (context, index) {
        return _allChatItemView(
          context: context,
          index: index,
          message: allList[index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.setHeight);
      },
    );
  }

  Widget _allChatItemView({required BuildContext context, required int index, required MessageListData message}) {
    return Stack(
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
                  width: 0.screenWidth / 6,
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
                  width: 0.screenWidth / 6,
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
            padding: EdgeInsets.symmetric(horizontal: 18.setHeight, vertical: 20.setHeight),
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
    );
  }
}

// ignore_for_file: unused_element
class _SavedHistoryListView extends StatelessWidget {
  const _SavedHistoryListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 15.setWidth),
      itemBuilder: (context, index) {
        return _savedChatItemView(context: context, index: index);
      },
    );
  }

  Widget _savedChatItemView({required BuildContext context, required int index}) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        extentRatio: 0.22,
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 0.screenWidth / 5,
              margin: EdgeInsets.only(bottom: 10.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).blue,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.remove_rounded,
                size: 28.setHeight,
                color: CustomAppColor.of(context).white,
              ),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.22,
        motion: const ScrollMotion(),
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
          color: CustomAppColor.of(context).listTileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18.setHeight, vertical: 18.setHeight),
        margin: EdgeInsets.only(bottom: 10.setHeight),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "how can i figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                    height: 1,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "Today  |  15 min ago",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    height: 1,
                    textAlign: TextAlign.start,
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
    );
  }
}
