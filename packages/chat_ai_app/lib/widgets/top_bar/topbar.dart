import 'package:chat_ai_app_package/localization/language/languages.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../utils/app_assets.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    required this.title,
    this.isShowBack = true,
    this.isShowShare = false,
    this.iconColor,
    this.textColor,
    this.isShowMore = false,
    this.isShowPlus = false,
  });

  final String title;
  final bool isShowBack;
  final bool isShowShare;
  final bool isShowMore;
  final Color? iconColor;
  final Color? textColor;
  final bool isShowPlus;
  final TopBarClickListener clickListener;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 10.setHeight, bottom: 10.setHeight),
        color: CustomAppColor.of(context).transparent,
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
                  height: 24.setHeight,
                  width: 24.setWidth,
                  color: iconColor ?? CustomAppColor.of(context).txtBlack,
                  gaplessPlayback: true,
                ),
              ),
            if (isShowBack) SizedBox(width: 0.setWidth),

            /// Title next to back button
            Expanded(
              child: CommonText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 22.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            if (isShowShare)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strShare);
                },
                child: Icon(
                  Icons.share_rounded,
                  size: 24.setHeight,
                  color: iconColor ?? CustomAppColor.of(context).txtBlack,
                ),
              ),

            if (isShowMore)
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  final tapPosition = details.globalPosition.translate(-160, 16); // Move 50px right and 10px down

                  showMenu(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      side: BorderSide(
                        color: CustomAppColor.of(context).listTileColor,
                        width: 1.0, // Border width
                      ),
                    ),
                    elevation: 0,
                    color: CustomAppColor.of(context).listTileColor,
                    context: context,
                    menuPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                    position: RelativeRect.fromLTRB(
                      tapPosition.dx,
                      tapPosition.dy,
                      tapPosition.dx,
                      tapPosition.dy,
                    ),
                    items: <PopupMenuEntry<dynamic>>[
                      PopupMenuItem(
                        value: Languages.of(context).txtRename,
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.icEditChat,
                                height: 18.setHeight,
                                width: 18.setWidth,
                                color: CustomAppColor.of(context).progressColor,
                              ),
                              SizedBox(width: 8.setWidth),
                              CommonText(
                                text: Languages.of(context).txtRename,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const PopupMenuDivider(height: 0),
                      PopupMenuItem(
                        value: Languages.of(context).txtShareChat,
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.icShare,
                                height: 18.setHeight,
                                width: 18.setWidth,
                                color: CustomAppColor.of(context).progressColor,
                              ),
                              SizedBox(width: 8.setWidth),
                              CommonText(
                                text: Languages.of(context).txtShareChat,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const PopupMenuDivider(height: 0),
                      PopupMenuItem(
                        value: Languages.of(context).txtClearChat,
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.icClearChat,
                                height: 18.setHeight,
                                width: 18.setWidth,
                                color: CustomAppColor.of(context).progressColor,
                              ),
                              SizedBox(width: 8.setWidth),
                              CommonText(
                                text: Languages.of(context).txtClearChat,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (context.mounted) {
                      if (value == Languages.of(context).txtRename) {
                        clickListener.onTopBarClick(Constant.strRename);
                      } else if (value == Languages.of(context).txtShareChat) {
                        clickListener.onTopBarClick(Constant.strShareChat);
                      } else if (value == Languages.of(context).txtClearChat) {
                        clickListener.onTopBarClick(Constant.strClearChat);
                      } else {}
                    }
                  });
                },
                child: Image.asset(
                  AppAssets.icHorizontalMore,
                  width: 24.setWidth,
                  height: 24.setHeight,
                  fit: BoxFit.fill,
                ),
              ),
            if (isShowPlus)
              InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strAddNewCard);
                  },
                  child: Image.asset(
                    AppAssets.icPlus,
                    height: 24.setHeight,
                    width: 24.setWidth,
                  )),
          ],
        ),
      ),
    );
  }
}
