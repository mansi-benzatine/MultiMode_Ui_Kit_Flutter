import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../chats_list/datamodels/chats_list_data.dart';

class ChatsSearchScreen extends StatefulWidget {
  final bool isEmptySearch;
  static Route<void> route({bool isEmptySearch = false}) {
    return MaterialPageRoute(builder: (_) => ChatsSearchScreen(isEmptySearch: isEmptySearch));
  }

  const ChatsSearchScreen({super.key, this.isEmptySearch = false});

  @override
  State<ChatsSearchScreen> createState() => _ChatsSearchScreenState();
}

class _ChatsSearchScreenState extends State<ChatsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatModel> filteredList = [];
  late List<ChatModel> chatList = [];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_filterSearchResults);
    if (widget.isEmptySearch) {
      chatList = [];
    } else {
      chatList = [
        ChatModel(
          name: "Rose Ward",
          lastMessage: "I'm great, Thanks",
          time: "",
          date: "Yesterday",
          unreadCount: 0,
          image: AppAssets.imgProfile1,
          isOnline: true,
        ),
        ChatModel(
          name: "Rose Ward",
          lastMessage: "That sounds awesome!!!",
          time: "",
          date: "7/2/20",
          unreadCount: 3,
          image: AppAssets.imgProfile1,
          isOnline: true,
        ),
      ];
      filteredList = chatList;
    }
  }

  void _filterSearchResults() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredList = chatList.where((chat) {
        return chat.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isLightTheme ? Brightness.dark : Brightness.light,
        statusBarBrightness: isLightTheme ? Brightness.light : Brightness.dark,
        statusBarColor: CustomAppColor.of(context).txtPink,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).txtPink,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16.setHeight,
                left: 16.setWidth,
                right: 16.setWidth,
                bottom: 16.setHeight,
              ),
              child: CommonTextFormFieldWithPrefixAndSuffix(
                controller: _searchController,
                hintText: "Search",
                prefixIcon: AppAssets.icPinkSearch,
                onSuffixClick: () {
                  _searchController.clear();
                },
                suffixIcon: AppAssets.icPinkClose,
              ),
            ),
            if (filteredList.isNotEmpty) SizedBox(height: 10.setHeight),
            Expanded(
              child: filteredList.isNotEmpty
                  ? ListView.separated(
                      itemCount: filteredList.length,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, __) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Divider(color: CustomAppColor.of(context).textFormFieldBorder),
                      ),
                      itemBuilder: (context, index) {
                        final chat = filteredList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                          child: ListTile(
                            dense: true,
                            visualDensity: VisualDensity.standard,
                            contentPadding: EdgeInsets.symmetric(vertical: 0.setHeight, horizontal: 10.setWidth),
                            titleAlignment: ListTileTitleAlignment.top,
                            leading: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(chat.image),
                                  radius: 24,
                                ),
                                if (chat.isOnline)
                                  Positioned(
                                    left: 8.setWidth,
                                    top: 2.setHeight,
                                    child: Container(
                                      width: 9.setWidth,
                                      height: 9.setHeight,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 0.5),
                                      ),
                                    ),
                                  ),
                                if (chat.unreadCount > 0)
                                  Positioned(
                                    right: -2.setWidth,
                                    bottom: -3.setHeight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 2.setHeight),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomAppColor.of(context).txtPink,
                                        border: Border.all(color: Colors.white, width: 1),
                                      ),
                                      child: CommonText(
                                        text: chat.unreadCount.toString(),
                                        fontSize: 11.setFontSize,
                                        fontWeight: FontWeight.w500,
                                        textColor: CustomAppColor.of(context).white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            title: CommonText(
                              text: chat.name,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.setFontSize,
                              textAlign: TextAlign.start,
                              textColor: CustomAppColor.of(context).txtVelvet,
                            ),
                            subtitle: CommonText(
                              text: chat.lastMessage,
                              fontSize: 14.setFontSize,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w500,
                              textColor: chat.unreadCount > 0 ? CustomAppColor.of(context).txtVelvet : CustomAppColor.of(context).txtGrey,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CommonText(
                                  text: chat.time.isNotEmpty ? chat.time : chat.date,
                                  textColor: chat.unreadCount > 0 ? CustomAppColor.of(context).txtVelvet : CustomAppColor.of(context).txtGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.setFontSize,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox.expand(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.imgEmptySearch,
                              height: 214.setHeight,
                              width: 200.setWidth,
                            ),
                            CommonText(
                              text: Languages.of(context).txtNoResultsFound,
                              fontSize: 22.setFontSize,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColor.of(context).txtPink,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 4.setHeight),
                              child: CommonText(
                                text: Languages.of(context).txtNoResultsFoundDesc,
                                fontSize: 13.setFontSize,
                                height: 1.2,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGrey,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
