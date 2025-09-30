import 'package:flutter/material.dart';
import 'package:musify_app_package/localization/language/languages.dart';
import 'package:musify_app_package/ui/home/view/home_all_page.dart';
import 'package:musify_app_package/utils/app_assets.dart';
import 'package:musify_app_package/utils/app_color.dart';
import 'package:musify_app_package/utils/constant.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';
import 'package:musify_app_package/widgets/text/common_text.dart';

class MusicMoreOptionBottomSheet extends StatelessWidget {
  final MusicItemData? musicItem;
  const MusicMoreOptionBottomSheet({super.key, this.musicItem});

  @override
  Widget build(BuildContext context) {
    final currentMusic = musicItem ??
        MusicItemData(
          image: AppAssets.imgMusic1,
          name: "Ishq Hai",
          singer: "Anurag Saikia",
        );

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgBottomSheet,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.setWidth),
            topRight: Radius.circular(20.setWidth),
          ),
        ),
        child: Wrap(
          children: [
            Center(
              child: Container(
                height: 4.setHeight,
                width: 40.setWidth,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.2),
                  borderRadius: BorderRadius.circular(20.setWidth),
                ),
              ),
            ),
            _buildHeader(context, currentMusic),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, MusicItemData musicItem) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.setWidth),
            child: Image.asset(
              musicItem.image,
              width: 60.setWidth,
              height: 60.setHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: musicItem.name,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.setHeight),
                CommonText(
                  text: musicItem.singer,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                  fontFamily: Constant.fontFamily,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final options = [
      BottomSheetOption(
        icon: AppAssets.icGoAdsFree,
        title: Languages.of(context).txtGoAdsFreeMusic,
        hasPremiumBadge: true,
        onTap: () {},
      ),
      BottomSheetOption(
        icon: AppAssets.icDownloadMusic,
        title: Languages.of(context).txtDownload,
        hasPremiumBadge: true,
        onTap: () {},
      ),
      BottomSheetOption(
        icon: AppAssets.icMyMusicBottomBar,
        title: Languages.of(context).txtAddToYourMusic,
        onTap: () {},
      ),
      BottomSheetOption(
        icon: AppAssets.icFavouriteBottomBar,
        title: Languages.of(context).txtLike,
        onTap: () {},
      ),
      BottomSheetOption(
        icon: AppAssets.icAddPlus,
        title: Languages.of(context).txtAddAnotherLibrary,
        onTap: () {},
      ),
      BottomSheetOption(
        icon: AppAssets.icShare,
        title: Languages.of(context).txtShare,
        isLast: true,
        onTap: () {},
      ),
    ];

    return Column(
      children: [
        ...options.map((option) => _buildOptionItem(context, option)),
        SizedBox(height: 20.setHeight),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context, BottomSheetOption option) {
    return InkWell(
      onTap: option.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.setHeight),
        margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
        decoration: BoxDecoration(
          border: option.isLast
              ? null
              : Border(
                  bottom: BorderSide(
                    color: CustomAppColor.of(context).containerBorder,
                  ),
                ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 22.setWidth,
              height: 21.setHeight,
              child: Image.asset(
                option.icon,
                width: 22.setWidth,
                height: 22.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
            SizedBox(width: 16.setWidth),
            Expanded(
              child: CommonText(
                text: option.title,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
                textAlign: TextAlign.start,
              ),
            ),
            if (option.hasPremiumBadge)
              SizedBox(
                width: 20.setWidth,
                height: 20.setHeight,
                child: Image.asset(
                  AppAssets.icPremium,
                  width: 22.setWidth,
                  height: 22.setHeight,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetOption {
  final String icon;
  final String title;
  final bool hasPremiumBadge;
  final bool isLast;
  final VoidCallback onTap;

  BottomSheetOption({
    required this.icon,
    required this.title,
    this.hasPremiumBadge = false,
    this.isLast = false,
    required this.onTap,
  });
}
