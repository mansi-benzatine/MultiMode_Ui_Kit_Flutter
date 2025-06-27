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
    this.address,
    this.isShowBack = true,
    this.isShowCancle = false,
    this.iconColor,
    this.textColor,
    this.isShowWishlist = false,
    this.isShowSearch = false,
    this.isShowProfile = false,
  });

  final String title;
  final String? address;
  final bool isShowBack;
  final bool isShowCancle;
  final bool isShowWishlist;
  final Color? iconColor;
  final Color? textColor;
  final bool isShowSearch;
  final bool isShowProfile;
  final TopBarClickListener clickListener;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 10.setHeight, bottom: 24.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScaffold,
          border: Border(
            bottom: BorderSide(
              color: CustomAppColor.of(context).appBarBorder,
            ),
          ),
        ),
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
                    width: 18.setWidth,
                    color: iconColor ?? CustomAppColor.of(context).txtBlack,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            if (isShowCancle)
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () {
                    clickListener.onTopBarClick(Constant.strCancle);
                  },
                  child: Image.asset(
                    AppAssets.icClose,
                    height: 16.setHeight,
                    width: 16.setWidth,
                    color: CustomAppColor.of(context).txtBlack,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            if (isShowBack) SizedBox(width: 18.setWidth),

            /// Title next to back button
            CommonText(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 22.setFontSize,
              textColor: textColor ?? CustomAppColor.of(context).txtBlack,
              height: 1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              letterSpacing: -0.3,
            ),
            if (isShowProfile)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strWishList);
                },
                child: CircleAvatar(
                  child: Image.asset(
                    AppAssets.imgUserProfile,
                    height: 24.setHeight,
                    width: 24.setWidth,
                  ),
                ),
              ),
            if (isShowWishlist)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strWishList);
                },
                child: Image.asset(
                  AppAssets.icHeart,
                  height: 24.setHeight,
                  width: 24.setWidth,
                ),
              ),
            if (isShowSearch)
              InkWell(
                onTap: () {
                  clickListener.onTopBarClick(Constant.strCancle);
                },
                child: Image.asset(
                  AppAssets.icSearch,
                  height: 24.setHeight,
                  width: 24.setWidth,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
