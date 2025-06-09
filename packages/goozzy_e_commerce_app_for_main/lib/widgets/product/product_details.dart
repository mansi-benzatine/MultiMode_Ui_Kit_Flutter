import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

class CommonDetailCard extends StatelessWidget {
  final String title;
  final List<DetailRowData> detailRows;
  final String? rating;
  final String? ratingText;
  final VoidCallback? onCopyPressed;
  final VoidCallback? onWishlistPressed;
  final bool? isCopyVisible;
  final Color? textColor;

  const CommonDetailCard({
    super.key,
    required this.title,
    required this.detailRows,
    this.rating,
    this.ratingText,
    this.onCopyPressed,
    this.onWishlistPressed,
    this.isCopyVisible,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.setHeight(20),
        horizontal: AppSizes.setWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: AppSizes.setFontSize(17),
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlackGrey,
                  maxLines: 3,
                ),
              ),
              Visibility(
                visible: isCopyVisible ?? false,
                child: CommonText(
                  text: Languages.of(context).copy.toUpperCase(),
                  fontSize: AppSizes.setFontSize(17),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.setHeight(18)),
          if (rating != null && ratingText != null)
            Row(
              children: [
                Container(
                  width: AppSizes.setWidth(41),
                  height: AppSizes.setHeight(20),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).green,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonText(
                        text: rating!,
                        fontSize: AppSizes.setFontSize(12),
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      Image.asset(
                        AppAssets.icStar,
                        height: AppSizes.setHeight(10),
                        width: AppSizes.setWidth(10),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.setWidth(8)),
                CommonText(
                  text: ratingText!,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(12),
                ),
              ],
            ),
          if (rating != null && ratingText != null) SizedBox(height: AppSizes.setHeight(18)),
          ...detailRows.asMap().entries.map((entry) {
            int index = entry.key;
            var row = entry.value;

            return Padding(
              padding: EdgeInsets.only(
                top: index == detailRows.length - 1 ? AppSizes.setHeight(25) : AppSizes.setHeight(5),
              ),
              child: Row(
                children: [
                  CommonText(
                    text: row.label,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(12),
                  ),
                  CommonText(
                    text: " : ${row.value}",
                    textColor: CustomAppColor.of(context).txtBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: AppSizes.setFontSize(12),
                  ),
                ],
              ),
            );
          }),
          if (onCopyPressed != null || onWishlistPressed != null)
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(14)),
              child: Row(
                children: [
                  if (onCopyPressed != null)
                    CommonButton(
                      width: AppSizes.setWidth(158),
                      height: AppSizes.setHeight(34),
                      radius: 4,
                      buttonColor: CustomAppColor.of(context).btnWhite,
                      borderColor: CustomAppColor.of(context).borderGrey,
                      onTap: onCopyPressed,
                      isButtonShadow: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icCopy,
                            width: AppSizes.setWidth(14),
                            height: AppSizes.setHeight(14),
                          ),
                          SizedBox(width: AppSizes.setWidth(12)),
                          CommonText(
                            text: Languages.of(context).copy,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  if (onCopyPressed != null) SizedBox(width: AppSizes.setWidth(16)),
                  if (onWishlistPressed != null)
                    CommonButton(
                      width: AppSizes.setWidth(158),
                      height: AppSizes.setHeight(34),
                      radius: 4,
                      buttonColor: CustomAppColor.of(context).btnWhite,
                      borderColor: CustomAppColor.of(context).borderGrey,
                      onTap: onWishlistPressed,
                      isButtonShadow: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icHeart,
                            width: AppSizes.setWidth(18),
                            height: AppSizes.setHeight(18),
                            color: CustomAppColor.of(context).txtGrey,
                          ),
                          SizedBox(width: AppSizes.setWidth(12)),
                          CommonText(
                            text: Languages.of(context).wishlist,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class DetailRowData {
  final String label;
  final String value;

  DetailRowData({required this.label, required this.value});
}
