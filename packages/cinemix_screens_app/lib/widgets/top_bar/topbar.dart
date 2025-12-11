import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../text/common_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    this.title,
    this.isShowBack = false,
    this.isShowSearch = false,
    this.isShowAppLogo = false,
    this.isShowEdit = false,
    this.isShowProfile = false,
    this.isShowTelecast = false,
    this.isShowRating = false,
    this.isShowShare = false,
    this.isShowAdd = false,
    this.textColor,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.alignment = Alignment.center,
    this.appBarColor,
  });

  final String? title;
  final bool isShowBack;
  final Color? appBarColor;
  final bool isShowSearch;
  final bool isShowProfile;
  final bool isShowTelecast;
  final bool isShowAppLogo;
  final bool isShowEdit;
  final bool isShowShare;
  final bool isShowRating;
  final bool isShowAdd;
  final TextAlign textAlign;
  final Color? textColor;
  final Color? iconColor;
  final TopBarClickListener clickListener;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(
          right: 18.setWidth,
          bottom: 14.setHeight,
          left: 20.setWidth,
        ),
        decoration: BoxDecoration(color: appBarColor ?? CustomAppColor.of(context).bgScreen),
        child: Stack(
          children: [
            isShowAppLogo
                ? Padding(
                    padding: EdgeInsets.only(top: 10.setHeight),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppAssets.icAppLogo,
                        width: 35.setWidth,
                        height: 35.setHeight,
                      ),
                    ),
                  )
                : const SizedBox(),
            isShowBack
                ? Padding(
                    padding: EdgeInsets.only(top: 10.setHeight),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strBack);
                          },
                          child: Image.asset(
                            AppAssets.icArrowRight,
                            width: 20.setWidth,
                            height: 20.setHeight,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: isShowAppLogo ? Alignment.center : Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: (isShowBack) ? 40.setWidth : 0, top: 10.setHeight),
                child: CommonText(
                  text: title!,
                  fontSize: 20.setFontSize,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                  height: 1,
                  maxLines: 1,
                  textAlign: textAlign,
                  fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.setHeight),
              child: Align(
                alignment: Alignment.centerRight,
                child: IgnorePointer(
                  ignoring: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isShowTelecast) SizedBox(width: 20.setWidth),
                      if (isShowTelecast)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strTelecast);
                          },
                          child: Image.asset(
                            AppAssets.icTelecast,
                            height: 26.setHeight,
                            width: 26.setWidth,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                            gaplessPlayback: true,
                          ),
                        ),
                      if (isShowProfile) SizedBox(width: 20.setWidth),
                      if (isShowProfile)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strProfile);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            child: Image.asset(
                              AppAssets.imgDummyImage,
                              gaplessPlayback: true,
                            ),
                          ),
                        ),
                      if (isShowSearch) SizedBox(width: 20.setWidth),
                      if (isShowSearch)
                        Padding(
                          padding: EdgeInsets.only(top: 4.setHeight),
                          child: GestureDetector(
                            onTap: () {
                              clickListener.onTopBarClick(Constant.strSearch);
                            },
                            child: Image.asset(
                              AppAssets.icSearch,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: iconColor ?? CustomAppColor.of(context).txtBlack,
                              gaplessPlayback: true,
                            ),
                          ),
                        ),
                      if (isShowEdit) SizedBox(width: 20.setWidth),
                      if (isShowEdit)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strEdit);
                          },
                          child: Image.asset(
                            AppAssets.icEdit,
                            height: 18.setHeight,
                            width: 18.setWidth,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                            gaplessPlayback: true,
                          ),
                        ),
                      if (isShowShare) SizedBox(width: 20.setWidth),
                      if (isShowShare)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strShare);
                          },
                          child: Image.asset(
                            AppAssets.icShare,
                            height: 18.setHeight,
                            width: 18.setWidth,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                            gaplessPlayback: true,
                          ),
                        ),
                      if (isShowRating) SizedBox(width: 20.setWidth),
                      if (isShowRating)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strRating);
                          },
                          child: Image.asset(
                            AppAssets.icRating,
                            height: 18.setHeight,
                            width: 18.setWidth,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                            gaplessPlayback: true,
                          ),
                        ),
                      if (isShowAdd) SizedBox(width: 20.setWidth),
                      if (isShowAdd)
                        Padding(
                          padding: EdgeInsets.only(top: 4.setHeight),
                          child: GestureDetector(
                            onTap: () {
                              clickListener.onTopBarClick(Constant.strAdd);
                            },
                            child: Image.asset(
                              AppAssets.icAddList,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: iconColor ?? CustomAppColor.of(context).txtBlack,
                              gaplessPlayback: true,
                            ),
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
