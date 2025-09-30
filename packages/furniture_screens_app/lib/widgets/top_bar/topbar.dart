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
      this.isShowAppLogo = false,
      this.isShowNotification = false,
      this.isShowShare = false,
      this.isShowCart = false,
      this.isShowTrackingGps = false,
      this.isShowCall = false,
      this.isShowSelectAll = false,
      this.textAlign = TextAlign.center,
      this.alignment = Alignment.center,
      this.appBarColor});
  final String? title;
  final bool isShowAppLogo;
  final bool isShowShare;
  final bool isShowBack;
  final Color? appBarColor;
  final bool isShowSearch;
  final bool isShowNotification;
  final bool isShowTrackingGps;
  final bool isShowCall;
  final bool isShowSelectAll;
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
          top: 10.setHeight,
          bottom: 20.setHeight,
          left: 22.setWidth,
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
                          AppAssets.icArrowRight,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            if (isShowAppLogo)
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.imgAppLogo,
                      height: 55.setHeight,
                      width: 55.setWidth,
                    ),
                    SizedBox(width: 15.setWidth),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Welcome To",
                          fontSize: 18.setFontSize,
                          textColor: CustomAppColor.of(context).icBlackWhite,
                          height: 0,
                        ),
                        CommonText(
                          text: "Furnify.",
                          fontSize: 24.setFontSize,
                          fontFamily: Constant.fontFamilyBold700,
                          textColor: CustomAppColor.of(context).txtPrimary,
                          height: 0.8,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ((title ?? '').trim().isNotEmpty)
                ? Align(
                    alignment: alignment,
                    child: CommonText(
                      text: title!,
                      fontSize: 22.setFontSize,
                      textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                      height: 1,
                      maxLines: 1,
                      textAlign: textAlign,
                      fontFamily: Constant.fontFamilyBold700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isShowSelectAll)
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strSelectAll);
                      },
                      child: Image.asset(
                        AppAssets.icTick,
                        height: 26.setHeight,
                        width: 26.setWidth,
                        color: iconColor ?? CustomAppColor.of(context).txtBlack,
                        gaplessPlayback: true,
                      ),
                    ),
                  if (isShowSearch) SizedBox(width: 20.setWidth),
                  if (isShowSearch)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strSearch);
                        },
                        child: Image.asset(
                          AppAssets.icSearch,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  if (isShowNotification) SizedBox(width: 20.setWidth),
                  if (isShowNotification)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
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
                    ),
                  if (isShowShare)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
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
                    ),
                  if (isShowCart) SizedBox(width: 20.setWidth),
                  if (isShowCart)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strCart);
                        },
                        child: Image.asset(
                          AppAssets.icUnselectedCart,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  if (isShowTrackingGps) SizedBox(width: 20.setWidth),
                  if (isShowTrackingGps)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strTrackingGps);
                        },
                        child: Image.asset(
                          AppAssets.icGps,
                          height: 26.setHeight,
                          width: 26.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  if (isShowCall)
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strCall);
                        },
                        child: Image.asset(
                          AppAssets.icCall,
                          height: 26.setHeight,
                          width: 26.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
