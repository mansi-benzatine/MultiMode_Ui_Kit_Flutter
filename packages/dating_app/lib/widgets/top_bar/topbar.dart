import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    this.title,
    this.address,
    this.isShowBack = false,
    this.isShowCancle = false,
    this.iconColor,
    this.appBarColor,
    this.textColor,
    this.isShowVideoCall = false,
    this.isShowPhoneCall = false,
    this.isShowSearch = false,
    this.isShowMore = false,
    this.userName,
    this.isShowMoreInChat = false,
    this.isShowUserDetails = false,
    this.isShowSetting = false,
    this.profileImage,
    this.status,
  });

  final String? title;
  final String? address;
  final bool isShowBack;
  final bool isShowCancle;
  final bool isShowVideoCall;
  final bool isShowPhoneCall;
  final Color? iconColor;
  final Color? textColor;
  final Color? appBarColor;
  final bool isShowSearch;
  final bool isShowMore;
  final bool isShowMoreInChat;
  final TopBarClickListener clickListener;
  final bool isShowUserDetails;
  final bool isShowSetting;
  final String? profileImage;
  final String? userName;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 22.setWidth, right: 22.setWidth, top: 10.setHeight, bottom: 15.setHeight),
        decoration: BoxDecoration(
          color: appBarColor ?? CustomAppColor.of(context).bgScaffold,
          border: Border(
            bottom: BorderSide(
              color: appBarColor ?? CustomAppColor.of(context).bgScaffold,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isShowBack)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strBack);
                },
                child: Image.asset(
                  AppAssets.icBack,
                  height: 26.setHeight,
                  width: 26.setWidth,
                  color: iconColor ?? CustomAppColor.of(context).txtBlack,
                  gaplessPlayback: true,
                ),
              ),

            if (isShowBack) SizedBox(width: 8.setWidth),

            /// Title next to back button
            CommonText(
              text: title ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 22.setFontSize,
              textColor: textColor ?? CustomAppColor.of(context).txtVelvet,
              height: 1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            if (isShowUserDetails)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImage ?? ''),
                    radius: 20,
                  ),
                  SizedBox(width: 10.setWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: userName ?? '',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.setFontSize,
                        textColor: CustomAppColor.of(context).txtVelvet,
                        maxLines: 1,
                        height: 0.8,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CommonText(
                        text: status ?? '',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtVelvet,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            const Spacer(),
            if (isShowSearch)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strSearch);
                },
                child: const Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            if (isShowVideoCall) SizedBox(width: 18.setWidth),
            if (isShowVideoCall)
              InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strVideoCall);
                  },
                  child: Image.asset(
                    AppAssets.icVideoCall,
                    width: 26.setWidth,
                    height: 26.setHeight,
                    color: CustomAppColor.of(context).icVelvetWhite,
                  )),
            if (isShowVideoCall) SizedBox(width: 18.setWidth),
            if (isShowVideoCall)
              InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strPhoneCall);
                  },
                  child: Image.asset(
                    AppAssets.icPhoneCall,
                    width: 20.setWidth,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).icVelvetWhite,
                  )),
            SizedBox(width: 10.setWidth),
            if (isShowMore)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strCancle);
                },
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: 28,
                ),
              ),
            if (isShowMoreInChat)
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  final tapPosition = details.globalPosition.translate(-115, 15);
                  showMenu(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      side: BorderSide(
                        color: CustomAppColor.of(context).txtWhite,
                        width: 1.0,
                      ),
                    ),
                    elevation: 2,
                    color: CustomAppColor.of(context).bgScaffold,
                    context: context,
                    menuPadding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                    position: RelativeRect.fromLTRB(
                      tapPosition.dx,
                      tapPosition.dy,
                      tapPosition.dx,
                      tapPosition.dy,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 124.setWidth,
                    ),
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        height: 36.setHeight,
                        value: Languages.of(context).txtClearChat,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icClear,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: CustomAppColor.of(context).icVelvetWhite,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtClearChat,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtVelvet,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuDivider(
                        height: 0,
                        color: CustomAppColor.of(context).greyDivider,
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        height: 36.setHeight,
                        value: Languages.of(context).txtBlock,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icTrash,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: CustomAppColor.of(context).txtVelvet,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtBlock,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtVelvet,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuDivider(
                        height: 0,
                        color: CustomAppColor.of(context).greyDivider,
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        height: 36.setHeight,
                        value: Languages.of(context).txtReport,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icReport,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: CustomAppColor.of(context).txtVelvet,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtReport,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtVelvet,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (context.mounted) {
                      if (value == Languages.of(context).txtClearChat) {
                        clickListener.onTopBarClick(Constant.strClearChat);
                      } else if (value == Languages.of(context).txtBlock) {
                        clickListener.onTopBarClick(Constant.strBlock);
                      } else if (value == Languages.of(context).txtReport) {
                        clickListener.onTopBarClick(Constant.strReport);
                      }
                    }
                  });
                },
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: 28,
                ),
              ),
            if (isShowSetting) SizedBox(width: 10.setWidth),
            if (isShowSetting)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strSettings);
                },
                child: Image.asset(
                  AppAssets.icSetting,
                  width: 26.setWidth,
                  height: 26.setHeight,
                  color: CustomAppColor.of(context).icVelvetWhite,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
