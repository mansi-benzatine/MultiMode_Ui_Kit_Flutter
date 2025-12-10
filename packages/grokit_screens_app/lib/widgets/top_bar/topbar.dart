import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../utils/app_assets.dart';
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
                          child: const Icon(Icons.arrow_back_rounded)),
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: isShowBack ? 40.setWidth : 0),
              child: CommonText(
                text: title!,
                fontSize: 18.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                textAlign: textAlign,
                fontFamily: Constant.fontFamilyBold700,
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
                    if (isShowNotification)
                      InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strNotification);
                        },
                        child: Image.asset(
                          AppAssets.icNotification,
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
                        child: Image.asset(
                          AppAssets.icShare,
                          height: 22.setHeight,
                          width: 22.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
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
