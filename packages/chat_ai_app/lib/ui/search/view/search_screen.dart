import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/view/search_empty_screen.dart';
import '../../home/datamodel/home_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SearchScreen());
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<MessageListData> recentChatList = [];
  List<MessageListData> filteredList = [];

  @override
  void initState() {
    super.initState();
    fillData();
    _searchController.addListener(_onSearchChanged);
  }

  void fillData() {
    recentChatList.addAll([
      MessageListData(msgTitle: "How can i figure out Lorem Ipsum ", isToday: true, timeAgo: "15 min ago"),
      MessageListData(msgTitle: "Give me recipe of south dosa", isToday: true, timeAgo: "45 min ago"),
      MessageListData(msgTitle: "How to convert html code to... ", isToday: false, timeAgo: "15 min ago"),
      MessageListData(msgTitle: "Joke about animals", isToday: false, timeAgo: "15 min ago"),
      MessageListData(msgTitle: "my brother birthday was coming...", isToday: false, timeAgo: "15 min ago"),
    ]);

    filteredList = List.from(recentChatList);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(recentChatList);
      } else {
        filteredList = recentChatList.where((item) => item.msgTitle?.toLowerCase().contains(query) ?? false).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 10.setHeight),
            _TopBarView(controller: _searchController),
            Expanded(
              child: filteredList.isEmpty ? const Center(child: SearchEmptyScreen()) : SearchListView(allList: filteredList),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBarView extends StatelessWidget {
  final TextEditingController controller;
  const _TopBarView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.setHeight),
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
          SizedBox(width: 10.setWidth),
          Expanded(
            child: CommonTextFormField(
              controller: controller,
              hintText: "Search...",
              borderColor: CustomAppColor.of(context).black,
              prefixIcon: AppAssets.icSearch,
              fillColor: CustomAppColor.of(context).searchBg,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  final List<MessageListData> allList;
  const SearchListView({super.key, required this.allList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: allList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 22.setWidth),
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
