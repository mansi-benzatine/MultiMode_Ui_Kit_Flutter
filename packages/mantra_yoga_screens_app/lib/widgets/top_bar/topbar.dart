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
    this.isShowVolume = false,
  });

  final String title;
  final bool isShowBack;
  final bool isShowVolume;
  final TopBarClickListener clickListener;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 15.setHeight, bottom: 20.setHeight),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isShowBack)
              IgnorePointer(
                ignoring: true,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      clickListener.onTopBarClick(Constant.strBack);
                    },
                    child: Image.asset(
                      AppAssets.icBack,
                      height: 35.setHeight,
                      width: 35.setHeight,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
              ),
            if (title.isNotEmpty)
              CommonText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 20.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamilyBold700,
                height: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            if (isShowVolume)
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppAssets.icVolume,
                  height: 35.setHeight,
                  width: 35.setHeight,
                  gaplessPlayback: true,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
