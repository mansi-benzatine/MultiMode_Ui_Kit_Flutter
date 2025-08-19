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
    this.isShowSearch = false,
    this.textColor,
    this.iconColor,
  });

  final String title;
  final bool isShowBack;
  final bool isShowSearch;
  final Color? textColor;
  final Color? iconColor;
  final TopBarClickListener clickListener;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 22.setWidth, right: 22.setWidth, top: 15.setHeight, bottom: 20.setHeight),
        decoration: BoxDecoration(color: CustomAppColor.of(context).bgScreen),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 15.setHeight,
                    width: 20.setWidth,
                    color: iconColor ?? CustomAppColor.of(context).txtBlack,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            if (isShowBack) SizedBox(width: 15.setWidth),
            Expanded(
              child: CommonText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 20.setFontSize,
                textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            if (isShowSearch)
              InkWell(
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
          ],
        ),
      ),
    );
  }
}
