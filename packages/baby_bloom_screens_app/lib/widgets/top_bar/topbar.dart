import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(this.clickListener,
      {super.key,
      this.title,
      this.isShowBack = false,
      this.isShowSearch = false,
      this.textColor,
      this.iconColor,
      this.isShowNotification = false,
      this.isShowShare = false,
      this.isShowCart = false,
      this.isShowTrackingGps = false,
      this.isShowFavourite = false,
      this.isShowCall = false,
      this.textAlign = TextAlign.center,
      this.alignment = Alignment.center,
      this.appBarColor});
  final String? title;
  final bool isShowShare;
  final bool isShowBack;
  final Color? appBarColor;
  final bool isShowSearch;
  final bool isShowNotification;
  final bool isShowTrackingGps;
  final bool isShowFavourite;
  final bool isShowCall;
  final bool isShowCart;
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
          top: 20.setHeight,
          bottom: 20.setHeight,
          left: 20.setWidth,
        ),
        decoration: BoxDecoration(color: appBarColor ?? CustomAppColor.of(context).bgScreen),
        child: Stack(
          children: [
            isShowBack
                ? IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strBack);
                        },
                        child: Image.asset(
                          AppAssets.icBack,
                          width: 24.setWidth,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).icBlackWhite,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: isShowBack ? 40.setWidth : 0),
              child: CommonText(
                text: title!,
                fontSize: 20.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                textAlign: textAlign,
                fontFamily: Constant.fontFamilySemiBold600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IgnorePointer(
                ignoring: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isShowSearch) SizedBox(width: 20.setWidth),
                    if (isShowSearch)
                      InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strSearch);
                        },
                        child: Image.asset(
                          AppAssets.icSearch,
                          height: 20.setHeight,
                          width: 20.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    if (isShowNotification) SizedBox(width: 20.setWidth),
                    if (isShowFavourite)
                      InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strFavourite);
                        },
                        child: Image.asset(
                          AppAssets.icHeart,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    if (isShowShare) SizedBox(width: 10.setWidth),
                    if (isShowShare)
                      InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strShare);
                        },
                        child: const SizedBox(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
