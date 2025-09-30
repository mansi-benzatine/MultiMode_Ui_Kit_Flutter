import 'dart:io';

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
    this.isShowBack = false,
    this.isShowShare = false,
    this.iconColor,
    this.textColor,
    this.isShowMore = false,
    this.isShowCheck = false,
    this.isShowDelete = false,
    this.isShowDone = false,
    this.isDeleteEnabled = false,
    this.isShowSearch = false,
    this.isShowFavorite = false,
    this.isShowCall = false,
    this.isShowAdd = false,
    this.textAlign = TextAlign.center,
    this.alignment = Alignment.center,
  });

  final String title;
  final bool isShowBack;
  final bool isShowShare;
  final bool isShowMore;
  final Color? iconColor;
  final Color? textColor;
  final bool isShowCheck;
  final bool isShowDelete;
  final bool isShowDone;
  final TextAlign textAlign;
  final AlignmentGeometry alignment;
  final bool isDeleteEnabled;
  final bool isShowSearch;
  final TopBarClickListener clickListener;
  final bool isShowFavorite;
  final bool isShowCall;
  final bool isShowAdd;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 10.setWidth, right: 12.setWidth, top: Platform.isIOS ? 10.setHeight : 20.setHeight, bottom: 10.setHeight),
        color: CustomAppColor.of(context).transparent,
        child: Stack(
          children: [
            if (isShowBack)
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strBack);
                  },
                  child: Image.asset(
                    AppAssets.icBack,
                    width: 35.setWidth,
                    height: 30.setHeight,
                    color: iconColor ?? CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),

            /// Title next to back button
            Align(
              alignment: alignment,
              child: CommonText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 22.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: textAlign,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  if (isShowCheck) ...{
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strCheck);
                      },
                      child: Icon(
                        Icons.check_rounded,
                        size: 24.setHeight,
                        color: iconColor ?? CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                  },
                  if (isShowDone) ...{
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strDone);
                      },
                      child: Icon(
                        Icons.done_all,
                        size: 24.setHeight,
                        color: iconColor ?? CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(width: 15.setWidth),
                  },
                  if (isShowFavorite) ...{
                    SizedBox(width: 5.setWidth),
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strFavorite);
                      },
                      child: Image.asset(
                        AppAssets.icFavouriteBottomBar,
                        width: 24.setWidth,
                        height: 24.setHeight,
                        color: iconColor ?? CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                  },
                  if (isShowSearch) ...{
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.setHeight, right: 15.setWidth),
                        child: InkWell(
                          onTap: () {
                            clickListener.onTopBarClick(Constant.strSearch);
                          },
                          child: Image.asset(
                            AppAssets.icSearch,
                            width: 20.setWidth,
                            height: 20.setHeight,
                            color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                    ),
                  },
                  if (isShowCall) ...{
                    SizedBox(width: 5.setWidth),
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strCall);
                      },
                      child: Icon(
                        Icons.call_rounded,
                        size: 24.setHeight,
                        color: iconColor ?? CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                  },
                  if (isShowAdd) ...{
                    SizedBox(width: 5.setWidth),
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strAdd);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                        child: Icon(
                          Icons.add_rounded,
                          size: 28.setHeight,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
