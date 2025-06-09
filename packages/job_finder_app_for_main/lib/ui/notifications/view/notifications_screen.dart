import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text_field/text_form_field.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/notification_data.dart';

class NotificationsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationsScreen());
  }

  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> implements TopBarClickListener {
  List<NotificationData> notificationsList = [];

  void fillData() {
    notificationsList = [
      NotificationData(
        companyName: "Kickstarter",
        notificationDetail: "Congratulations, your application on Kickstarter has been accepted",
        time: "16 minutes ago",
        isSeen: false,
        companyImagePath: AppAssets.icAvatarKickstarter,
      ),
      NotificationData(
        companyName: "Academia Education",
        notificationDetail: "Academia Education want to contact with you in 24 hours with proper preparation",
        time: "47 minutes ago",
        isSeen: false,
        companyImagePath: AppAssets.icAvatarAcademia,
      ),
      NotificationData(
        companyName: "Twitch",
        notificationDetail: "Your application is submitted successfully to Twitch. You can check the status here.",
        date: "March 20 ",
        time: "10:30 AM",
        isSeen: true,
        companyImagePath: AppAssets.icAvatarTwitch,
      ),
      NotificationData(
        companyName: "Vkontakte",
        notificationDetail: "New Job available on Vkontakte. (Position for Product Designer)",
        date: "March 15",
        time: "05:17 PM",
        isSeen: true,
        companyImagePath: AppAssets.icAvatarVkontakte,
      ),
      NotificationData(
        companyName: "Meetup",
        notificationDetail: "Your application is submitted successfully to Meetup. You can check the status here.",
        date: "April 20",
        time: "09:44 AM",
        isSeen: true,
        companyImagePath: AppAssets.icAvatarMeetup,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtNotifications,
              isShowTitle: true,
              isShowMarkAllAsRead: true,
              isShowBack: true,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
              iconColor: CustomAppColor.of(context).bgDetailsCard,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _SearchInputView(),
                    _NotificationListView(notificationList: notificationsList),
                    // EmptyView()
                  ],
                ),
              ),
            ),
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

class _SearchInputView extends StatelessWidget {
  const _SearchInputView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: CommonTextFormFieldWithPrefix(
        controller: TextEditingController(),
        hintText: Languages.of(context).txtSearchNotification,
        prefixIcon: AppAssets.icSearch,
        prefixIconColor: CustomAppColor.of(context).icGrey,
        fillColor: CustomAppColor.of(context).bgTextFormFieldGreySecondary,
        borderColor: CustomAppColor.of(context).transparent,
      ),
    );
  }
}

class _NotificationListView extends StatelessWidget {
  final List<NotificationData> notificationList;

  const _NotificationListView({required this.notificationList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: notificationList.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      itemBuilder: (context, index) {
        final jobType = notificationList[index];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.setWidth),
          child: Container(
            width: 280.setWidth,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 12.setWidth),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.05),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: CustomAppColor.of(context).bgWhiteSecondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  jobType.companyImagePath,
                  height: 40.setHeight,
                  width: 40.setWidth,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: _buildHighlightedText(jobType.companyName, jobType.notificationDetail, context),
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: jobType.isSeen ? CustomAppColor(context).txtGrey : CustomAppColor.of(context).txtSecondaryWhite),
                      ),
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Row(
                            children: [
                              Visibility(
                                visible: jobType.date != null,
                                child: CommonText(
                                  text: "${jobType.date} at ",
                                  fontSize: 13.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: jobType.isSeen ? CustomAppColor.of(context).txtGrey : CustomAppColor.of(context).txtSecondary,
                                ),
                              ),
                              CommonText(
                                text: jobType.time ?? '',
                                fontSize: 13.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: jobType.isSeen ? CustomAppColor.of(context).txtGrey : CustomAppColor.of(context).txtSecondaryWhite,
                              ),
                              SizedBox(width: 15.setWidth),
                              Visibility(
                                visible: !jobType.isSeen,
                                child: Container(
                                  height: 8.setHeight,
                                  width: 8.setWidth,
                                  decoration: BoxDecoration(color: CustomAppColor.of(context).icPrimary, shape: BoxShape.circle),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 111.setHeight),
        Image.asset(
          AppAssets.imgBgEmptyNotification,
          width: 200.setWidth,
          height: 189.setHeight,
        ),
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtNoNotification,
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtSecondary,
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtNONotificationDesc,
          fontWeight: FontWeight.w400,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
        )
      ],
    );
  }
}

List<TextSpan> _buildHighlightedText(String companyName, String notificationDetail, BuildContext context) {
  if (companyName.isEmpty || notificationDetail.isEmpty || !notificationDetail.contains(companyName)) {
    return [TextSpan(text: notificationDetail, style: TextStyle(color: CustomAppColor.of(context).txtSecondary, fontSize: 13))];
  }

  List<String> parts = notificationDetail.split(companyName);

  return [
    if (parts[0].isNotEmpty)
      TextSpan(
        text: parts[0],
        style: TextStyle(
          fontFamily: Constant.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 13.setFontSize,
        ),
      ),
    TextSpan(
      text: companyName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
        fontSize: 13.setFontSize,
      ),
    ),
    if (parts.length > 1 && parts[1].isNotEmpty)
      TextSpan(
        text: parts[1],
        style: TextStyle(
          fontFamily: Constant.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 13.setFontSize,
        ),
      ),
  ];
}
