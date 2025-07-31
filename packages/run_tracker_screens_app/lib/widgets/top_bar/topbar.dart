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
    this.title,
    this.shortHeading,
    this.address,
    this.isShowBack = false,
    this.isShowCancle = false,
    this.isShowDustbin = false,
    this.iconColor,
    this.textColor,
    this.isShowInfo = false,
    this.isShowSimpleTitle = false,
    this.isShowProfile = false,
    this.isShowSetting = false,
    this.simpleTitle,
    this.appbarColor,
    this.isShowSelected = false,
    this.isShowMore = false,
    this.height,
  });

  final String? title;
  final String? simpleTitle;
  final String? shortHeading;
  final String? address;
  final double? height;
  final bool isShowBack;
  final bool isShowCancle;
  final bool isShowDustbin;
  final bool isShowInfo;
  final bool isShowSelected;
  final Color? iconColor;
  final Color? appbarColor;
  final Color? textColor;
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
        height: height ?? 60.setHeight,
        alignment: Alignment.center,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isShowBack)
              IgnorePointer(
                ignoring: true,
                child: InkWell(
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
              ),
            if (isShowBack) SizedBox(width: 18.setWidth),
            if (isShowSimpleTitle)
              CommonText(
                text: simpleTitle ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 18.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            Spacer(),
            if (isShowDustbin)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strDustbin);
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerBgColor,
                    border: Border.all(
                      color: CustomAppColor.of(context).border,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    AppAssets.icDustbin,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ),
              ),
            if (isShowSelected) SizedBox(width: 15.setWidth),
            if (isShowSelected)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strSelected);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerBgColor,
                    border: Border.all(
                      color: CustomAppColor.of(context).border,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    AppAssets.icSelected,
                    height: 20.setHeight,
                    width: 20.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
