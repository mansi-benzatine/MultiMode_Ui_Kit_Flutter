import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../chat/view/chat_screen.dart';
import '../datamodel/inbox_data.dart';

class InboxScreen extends StatefulWidget {
  final Function(bool)? onExpandActivity;
  const InboxScreen({super.key, this.onExpandActivity});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const InboxScreen(),
    );
  }

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  int? expandedIndex;

  final List<Map<String, dynamic>> allSections = [
    {"title": "Today", "data": todayList},
    {"title": "Yesterday", "data": yesterdayList},
    {"title": "This Week", "data": thisWeekList},
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: expandedIndex != null ? CustomAppColor.of(context).black.withOpacityPercent(0.7) : CustomAppColor.of(context).bgScaffold,
        body: Stack(
          children: [
            inboxList(),
            allActivity(context),
          ],
        ),
      ),
    );
  }

  Widget allActivity(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(30)),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: expandedIndex == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).bgScaffold,
          child: ExpansionTile(
            showTrailingIcon: false,
            onExpansionChanged: (bool expanded) {
              setState(() {
                if (expanded) {
                  expandedIndex = index;
                } else {
                  expandedIndex = null;
                }
              });
              widget.onExpandActivity?.call(expanded);
            },
            title: Padding(
              padding: EdgeInsets.only(left: AppSizes.fullWidth / 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: AppSizes.setWidth(8)),
                  Row(
                    children: [
                      CommonText(
                        text: Languages.of(context).allActivity,
                        fontWeight: FontWeight.w700,
                        fontSize: AppSizes.setFontSize(22),
                      ),
                      SizedBox(width: AppSizes.setWidth(8)),
                      Icon(
                        expandedIndex == index ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, ChatScreen.route()),
                    child: Image.asset(
                      AppAssets.icGroupChat,
                      color: CustomAppColor.of(context).icBlack,
                      width: AppSizes.setWidth(24),
                      height: AppSizes.setHeight(24),
                    ),
                  )
                ],
              ),
            ),
            children: _buildActivityList(context),
          ),
        );
      },
    );
  }

  List<Widget> _buildActivityList(BuildContext context) {
    List<InboxData> allActivity = allActivityList(context);

    return allActivity.map((activity) {
      return ListTile(
        leading: Image.asset(
          activity.icon ?? "",
          scale: 4,
          color: CustomAppColor.of(context).icBlack,
        ),
        title: CommonText(
          text: activity.iconDetail ?? '',
          fontSize: AppSizes.setFontSize(16),
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
        trailing: activity.isFollow ?? false
            ? Image.asset(
                AppAssets.icOk,
                width: AppSizes.setWidth(26),
                height: AppSizes.setHeight(26),
              )
            : null,
      );
    }).toList();
  }

  Widget inboxList() {
    return Container(
      padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
      child: ListView.builder(
        itemCount: allSections.length,
        itemBuilder: (context, sectionIndex) {
          final section = allSections[sectionIndex];
          final title = section['title'] as String;
          final items = section['data'] as List<InboxData>;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8), horizontal: AppSizes.setWidth(16)),
                    child: CommonText(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(18),
                    ),
                  ),
                  Visibility(
                    visible: expandedIndex != null,
                    child: Positioned.fill(
                      child: Container(
                        width: AppSizes.setWidth(90),
                        height: AppSizes.setHeight(30),
                        decoration: BoxDecoration(
                          color: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                              ? null
                              : CustomAppColor.of(context).black.withOpacityPercent(0.7),
                        ),
                      ),
                    ),
                  ),
                ]),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, itemIndex) {
                    final item = items[itemIndex];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8), horizontal: AppSizes.setWidth(16)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            child: Stack(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    item.avatar ?? "",
                                    fit: BoxFit.cover,
                                    width: AppSizes.setWidth(50),
                                    height: AppSizes.setHeight(50),
                                  ),
                                ),
                                if (expandedIndex != null)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).black.withOpacityPercent(0.7),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: item.iconDetail ?? "",
                                      fontSize: AppSizes.setFontSize(16),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const SizedBox(height: 4),
                                    CommonText(
                                      text: item.activityDetail ?? "",
                                      fontSize: AppSizes.setFontSize(13),
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: expandedIndex != null,
                                  child: Positioned.fill(
                                    child: Container(
                                      width: AppSizes.setWidth(90),
                                      height: AppSizes.setHeight(30),
                                      decoration: BoxDecoration(
                                        color: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                                            ? null
                                            : CustomAppColor.of(context).black.withOpacityPercent(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (item.isFollow ?? false)
                            Stack(
                              children: [
                                CommonButton(
                                  width: AppSizes.setWidth(90),
                                  height: AppSizes.setHeight(30),
                                  borderColor: AppColor.transparent,
                                  child: CommonText(
                                    text: Languages.of(context).followBack,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).white,
                                    fontSize: AppSizes.setFontSize(12),
                                  ),
                                ),
                                if (expandedIndex != null)
                                  Container(
                                    width: AppSizes.setWidth(90),
                                    height: AppSizes.setHeight(30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: CustomAppColor.of(context).black.withOpacityPercent(0.7),
                                    ),
                                  ),
                              ],
                            )
                          else if (item.image != null)
                            Stack(
                              children: [
                                Image.asset(
                                  item.image!,
                                  width: AppSizes.setHeight(50),
                                  height: AppSizes.setWidth(50),
                                  fit: BoxFit.cover,
                                ),
                                if (expandedIndex != null)
                                  Container(
                                    width: AppSizes.setHeight(50),
                                    height: AppSizes.setWidth(50),
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).black.withOpacityPercent(0.6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
