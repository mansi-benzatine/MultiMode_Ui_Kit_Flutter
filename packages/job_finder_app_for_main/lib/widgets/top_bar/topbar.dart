import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../utils/app_assets.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    this.title,
    this.isShowBack = true,
    this.iconColor,
    this.textColor,
    this.height,
    this.isShowNotification,
    this.isShowProfileDetails,
    this.isShowTitle,
    this.profilePath,
    this.userName,
    this.backgroundColor,
    this.isShowBookmarkAdd,
    this.isShowCancel,
    this.isShowReset,
    this.isShowMarkAllAsRead,
    this.isShowChatUserDetails,
    this.chatStatus,
    this.chatUserName,
    this.chatUserProfilePath,
    this.chatStatusColor,
    this.isShowCall,
    this.isShowVideoCall,
    this.isShowSetting,
    this.isShowChat,
  });

  final String? title;
  final double? height;
  final bool isShowBack;
  final bool? isShowTitle;
  final bool? isShowNotification;
  final bool? isShowBookmarkAdd;
  final bool? isShowChat;
  final bool? isShowProfileDetails;
  final Color? iconColor;
  final Color? textColor;
  final TopBarClickListener clickListener;
  final String? profilePath;
  final String? userName;
  final Color? backgroundColor;
  final bool? isShowCancel;
  final bool? isShowReset;
  final bool? isShowMarkAllAsRead;
  final bool? isShowChatUserDetails;
  final String? chatUserProfilePath;
  final String? chatUserName;
  final String? chatStatus;
  final Color? chatStatusColor;
  final bool? isShowCall;
  final bool? isShowVideoCall;
  final bool? isShowSetting;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: height ?? 54.setHeight,
        padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 12.setHeight),
        color: backgroundColor ?? CustomAppColor.of(context).transparent,
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowBack) ...{
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strBack);
                  },
                  child: Image.asset(
                    AppAssets.icBack,
                    height: 48.setHeight,
                    width: 48.setWidth,
                    color: iconColor,
                    gaplessPlayback: true,
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
            },
            if (isShowTitle ?? false) ...{
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                  child: CommonText(
                    text: title ?? '',
                    maxLines: 1,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.start,
                    fontSize: 20.setFontSize,
                    textColor: textColor ?? CustomAppColor.of(context).white,
                  ),
                ),
              ),
            },
            if (isShowChatUserDetails ?? false) ...{
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Image.asset(
                        chatUserProfilePath ?? '',
                        width: 44.setWidth,
                        height: 44.setHeight,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: chatUserName ?? '',
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                            fontSize: 14.setFontSize,
                            textColor: textColor ?? CustomAppColor.of(context).txtSecondaryWhite,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 5.setHeight,
                                width: 5.setWidth,
                                decoration: BoxDecoration(color: chatStatusColor, shape: BoxShape.circle),
                              ),
                              SizedBox(width: 5.setWidth),
                              CommonText(
                                text: chatStatus ?? '',
                                maxLines: 1,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                                fontSize: 12.setFontSize,
                                textColor: textColor ?? CustomAppColor.of(context).txtSecondaryWhite,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            },
            if (isShowProfileDetails ?? false) ...{
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 27,
                      child: Image.asset(profilePath ?? ''),
                    ),
                    SizedBox(width: 12.setWidth),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtWelcomeBack,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).white,
                        ),
                        CommonText(
                          text: userName ?? '',
                          fontWeight: FontWeight.w700,
                          fontSize: 22.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    )
                  ],
                ),
              )
            },
            if (isShowNotification ?? false) ...{
              GestureDetector(
                onTap: () => clickListener.onTopBarClick(Constant.strNotification),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.setWidth),
                  child: Container(
                    width: 55.setWidth,
                    height: 55.setHeight,
                    padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 16.setWidth),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).white),
                    child: Image.asset(
                      AppAssets.icNotification,
                      height: 28.setHeight,
                      width: 24.setWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            },
            if (isShowChat ?? false) ...{
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.setWidth),
                child: InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strChat);
                  },
                  child: Image.asset(
                    AppAssets.icChat,
                    height: 28.setHeight,
                    width: 28.setWidth,
                    color: iconColor,
                    gaplessPlayback: true,
                  ),
                ),
              )
            },
            if (isShowBookmarkAdd ?? false) ...{
              InkWell(
                onTap: () {},
                child: Image.asset(
                  AppAssets.icBookmarkAdd,
                  height: 30.setHeight,
                  width: 26.setWidth,
                  color: iconColor,
                  gaplessPlayback: true,
                ),
              ),
            },
            if (isShowCancel ?? false) ...{
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: CommonText(
                    text: Languages.of(context).txtCancel,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGreyWhite,
                  ),
                ),
              ),
            },
            if (isShowReset ?? false) ...{
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: CommonText(
                    text: Languages.of(context).txtReset,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGreyWhite,
                  ),
                ),
              ),
            },
            if (isShowMarkAllAsRead ?? false) ...{
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight),
                  child: CommonText(
                    text: Languages.of(context).txtMarkAllAsRead,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ),
              ),
            },
            if (isShowVideoCall ?? false) ...{
              InkWell(
                onTap: () => clickListener.onTopBarClick(Constant.strVideoCall),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 9.setWidth),
                  child: Image.asset(
                    AppAssets.icVideoCall,
                    width: 24.setWidth,
                    height: 24.setHeight,
                    color: CustomAppColor.of(context).icPrimaryWhite,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            },
            if (isShowCall ?? false) ...{
              InkWell(
                onTap: () => clickListener.onTopBarClick(Constant.strVoiceCall),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 9.setWidth),
                  child: Image.asset(
                    AppAssets.icFilledCall,
                    width: 24.setWidth,
                    height: 24.setHeight,
                    color: CustomAppColor.of(context).icPrimaryWhite,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            },
            if (isShowSetting ?? false) ...{
              GestureDetector(
                onTap: () => clickListener.onTopBarClick(Constant.strSetting),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 5.setHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 5.setHeight),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).white),
                    child: Icon(
                      Icons.settings,
                      color: CustomAppColor.of(context).bgSecondary,
                    ),
                  ),
                ),
              )
            },
          ],
        ),
      ),
    );
  }
}
