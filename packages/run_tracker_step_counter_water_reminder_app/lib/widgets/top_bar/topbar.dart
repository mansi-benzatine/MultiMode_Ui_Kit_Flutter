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
    this.shortHeading,
    this.address,
    this.isShowBack = false,
    this.isShowCancle = false,
    this.isShowDustbin = false,
    this.iconColor,
    this.textColor,
    this.isShowInfo = false,
    this.isShowProBudge = false,
    this.isShowTitle = false,
    this.isShowSimpleTitle = false,
    this.isShowProfile = false,
    this.isShowSetting = false,
    this.simpleTitle,
    this.appbarColor,
    this.isShowFilter = false,
    this.isShowMore = false,
  });

  final String? title;
  final String? simpleTitle;
  final String? shortHeading;
  final String? address;
  final bool isShowBack;
  final bool isShowCancle;
  final bool isShowDustbin;
  final bool isShowInfo;
  final bool isShowFilter;
  final bool isShowProBudge;
  final Color? iconColor;
  final Color? appbarColor;
  final Color? textColor;
  final bool isShowTitle;
  final bool isShowSetting;
  final bool isShowSimpleTitle;
  final bool isShowMore;
  final bool isShowProfile;
  final TopBarClickListener clickListener;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(
          left: 24.setWidth,
          right: 24.setWidth,
          top: 24.setHeight,
          bottom: 10.setHeight,
        ),
        decoration: BoxDecoration(
          color: appbarColor ?? CustomAppColor.of(context).bgScaffold,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            if (isShowCancle)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strCancle);
                },
                child: Icon(Icons.close_rounded),
              ),
            if (isShowBack) SizedBox(width: 18.setWidth),
            if (isShowSimpleTitle)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: simpleTitle ?? "",
                    fontWeight: FontWeight.w500,
                    fontSize: 22.setFontSize,
                    textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                    height: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (shortHeading != null && shortHeading!.isNotEmpty) ...[
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: shortHeading!,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.setFontSize,
                      textColor:
                          textColor ?? CustomAppColor.of(context).txtGrey,
                      height: 1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            if (isShowTitle)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CommonText(
                        text: title ?? "",
                        fontWeight: FontWeight.w900,
                        fontSize: 22.setFontSize,
                        textColor:
                            textColor ?? CustomAppColor.of(context).txtPurple,
                        height: 1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5.setWidth),
                      if (isShowProBudge)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.setHeight,
                            horizontal: 6.setWidth,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0A525),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: CommonText(
                            text: "PRO",
                            fontWeight: FontWeight.w700,
                            fontSize: 10.setFontSize,
                            textColor: CustomAppColor.of(context).black,
                            height: 1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: shortHeading ?? "",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.setFontSize,
                    textColor: textColor ?? CustomAppColor.of(context).txtGrey,
                    height: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            Spacer(),
            if (isShowInfo)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strInfo);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.icInfoBlack,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ),
              ),
            if (isShowFilter)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strFilter);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomAppColor.of(context).white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.icFilter,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).white,
                  ),
                ),
              ),
            if (isShowDustbin)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strDustbin);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.icDustbin,
                    height: 24.setHeight,
                    width: 24.setWidth,
                  ),
                ),
              ),
            if (isShowSetting)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strSetting);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).greyDivider,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.icSetting,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ),
              ),
            if (isShowMore)
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  final tapPosition = details.globalPosition.translate(
                    -115,
                    15,
                  );
                  showMenu(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: CustomAppColor.of(context).white,
                        width: 1.0,
                      ),
                    ),
                    elevation: 2,
                    color: CustomAppColor.of(context).white,
                    context: context,
                    menuPadding: EdgeInsets.symmetric(
                      horizontal: 16.setWidth,
                      vertical: 5.setHeight,
                    ),
                    position: RelativeRect.fromLTRB(
                      tapPosition.dx,
                      tapPosition.dy,
                      tapPosition.dx,
                      tapPosition.dy,
                    ),
                    constraints: BoxConstraints(maxWidth: 130.setWidth),
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        height: 40.setHeight,
                        value: Languages.of(context).txtReset,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icReset,
                              height: 18.setHeight,
                              width: 18.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtReset,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).black,
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
                        height: 40.setHeight,
                        value: Languages.of(context).txtEditTarget,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icEdit,
                              height: 18.setHeight,
                              width: 18.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtEditTarget,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).black,
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
                        height: 40.setHeight,
                        value: Languages.of(context).txtTurnOff,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAssets.icTurnOff,
                              height: 18.setHeight,
                              width: 18.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: Languages.of(context).txtTurnOff,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (context.mounted) {
                      if (value == Languages.of(context).txtReset) {
                        clickListener.onTopBarClick(Constant.strReset);
                      } else if (value == Languages.of(context).txtEditTarget) {
                        clickListener.onTopBarClick(Constant.strEditTarget);
                      } else if (value == Languages.of(context).txtTurnOff) {
                        clickListener.onTopBarClick(Constant.strTurnOff);
                      }
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).greyDivider,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.more_vert_rounded, size: 28),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
