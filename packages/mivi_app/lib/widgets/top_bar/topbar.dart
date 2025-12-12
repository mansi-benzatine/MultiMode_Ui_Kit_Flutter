import 'package:flutter/material.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../interfaces/top_bar_click_listener.dart';

class TopBar extends StatelessWidget {
  const TopBar(
    this.clickListener, {
    super.key,
    this.title,
    this.isShowBack = false,
    this.isShowSearch = false,
    this.isShowAppLogo = false,
    this.isShowCamera = false,
    this.isShowUpload = false,
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
  final bool isShowCamera;
  final bool isShowUpload;
  final bool isShowAppLogo;
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
                        AppAssets.icAppIcon,
                        width: 24.setWidth,
                        height: 24.setHeight,
                      ),
                    ),
                  )
                : const SizedBox(),
            isShowBack
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).socialMediaCard,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.1,
                          color: const Color(0xFFE6E6E6),
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: InkWell(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strBack);
                        },
                        child: Image.asset(
                          AppAssets.icBack,
                          width: 20.setWidth,
                          height: 20.setHeight,
                          color: CustomAppColor.of(context).icBlackWhite,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: isShowAppLogo ? Alignment.center : Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: (isShowBack) ? 56.setWidth : 0, top: 5.setHeight),
                child: CommonText(
                  text: title!,
                  fontSize: 18.setFontSize,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                  height: 1,
                  maxLines: 1,
                  textAlign: textAlign,
                  fontFamily: Constant.fontFamilySemiBold600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isShowSearch) SizedBox(width: 20.setWidth),
                  if (isShowSearch)
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).socialMediaCard,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xFFE6E6E6).withValues(alpha: 0.2),
                        ),
                      ),
                      padding: const EdgeInsets.all(11),
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
                  if (isShowUpload) SizedBox(width: 20.setWidth),
                  if (isShowUpload)
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).socialMediaCard,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xFFE6E6E6),
                        ),
                      ),
                      padding: const EdgeInsets.all(11),
                      child: GestureDetector(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strUpload);
                        },
                        child: Image.asset(
                          AppAssets.icUpload,
                          height: 16.setHeight,
                          width: 16.setWidth,
                          color: iconColor ?? CustomAppColor.of(context).txtBlack,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  if (isShowCamera) SizedBox(width: 20.setWidth),
                  if (isShowCamera)
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).socialMediaCard,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.1,
                          color: const Color(0xFFE6E6E6),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          clickListener.onTopBarClick(Constant.strCamera);
                        },
                        child: Image.asset(
                          AppAssets.icCamera,
                          height: 16.setHeight,
                          width: 16.setWidth,
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
