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
    this.isShowDelete = false,
    this.isShowShare = false,
    this.isShowReport = false,
    this.textColor,
    this.textAlign,
  });

  final String title;
  final bool isShowBack;
  final bool isShowDelete;
  final bool isShowShare;
  final bool isShowReport;
  final Color? textColor;
  final TopBarClickListener clickListener;
  final AlignmentGeometry? textAlign;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 15.setHeight, bottom: 20.setHeight),
        child: Stack(
          alignment: Alignment.center,
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
                    height: 20.setHeight,
                    width: 20.setHeight,
                    gaplessPlayback: true,
                    color: textColor ?? CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),
            if (title.isNotEmpty)
              Container(
                alignment: textAlign ?? Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: isShowBack ? 40.setWidth : 0),
                child: CommonText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.setFontSize,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  height: 1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            if (isShowDelete)
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strDelete);
                  },
                  child: Image.asset(
                    AppAssets.icDelete,
                    height: 25.setHeight,
                    width: 25.setHeight,
                    gaplessPlayback: true,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isShowShare)
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strShare);
                      },
                      child: Image.asset(
                        AppAssets.icShare,
                        height: 23.setHeight,
                        width: 23.setHeight,
                        gaplessPlayback: true,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                  if (isShowReport) ...[
                    SizedBox(width: 15.setWidth),
                    InkWell(
                      onTap: () {
                        clickListener.onTopBarClick(Constant.strReport);
                      },
                      child: Image.asset(
                        AppAssets.icReport,
                        height: 21.setHeight,
                        width: 21.setHeight,
                        gaplessPlayback: true,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
