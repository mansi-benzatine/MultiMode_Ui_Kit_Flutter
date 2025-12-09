import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';
import '../../utils/constant.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    this.title,
    this.isShowBack = false,
    this.isShowSearch = false,
    this.isShowBookmark = false,
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
  final bool isShowBookmark;
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
            isShowBack
                ? IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.setHeight),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strBack);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 22,
                            color: iconColor ?? CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: (isShowBack) ? 40.setWidth : 0, top: 10.setHeight),
                child: CommonText(
                  text: title!,
                  fontSize: 18.setFontSize,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                  height: 1,
                  maxLines: 1,
                  textAlign: textAlign,
                  fontFamily: Constant.fontFamilyMulishBold700,
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
                      if (isShowSearch) SizedBox(width: 20.setWidth),
                      if (isShowSearch)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strSearch);
                          },
                          child: Image.asset(
                            AppAssets.icSearch,
                            height: 22.setHeight,
                            width: 22.setWidth,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                            gaplessPlayback: true,
                          ),
                        ),
                      if (isShowBookmark) SizedBox(width: 20.setWidth),
                      if (isShowBookmark)
                        GestureDetector(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strBookmark);
                          },
                          child: Image.asset(
                            AppAssets.icBookmark,
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
            ),
          ],
        ),
      ),
    );
  }
}
