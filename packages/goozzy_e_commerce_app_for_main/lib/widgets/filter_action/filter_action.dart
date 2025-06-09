import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class CommonActionWidget {
  static Widget icon(String asset) {
    return Image.asset(
      asset,
      height: AppSizes.setHeight(14),
      width: AppSizes.setWidth(21),
    );
  }

  static Widget actionRow({
    required String text,
    required String iconAsset,
    required BuildContext context,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CommonText(
            text: text,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(12),
          ),
          SizedBox(width: AppSizes.setWidth(4)),
          icon(iconAsset),
        ],
      ),
    );
  }

  static Widget divider(BuildContext context) {
    return Container(
      height: AppSizes.setHeight(16),
      width: AppSizes.setWidth(1),
      color: CustomAppColor.of(context).borderGrey,
    );
  }

  static Widget action(
    BuildContext context, {
    Function()? sortByTap,
    Function()? categoryTap,
    Function()? genderTap,
    Function()? filterTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.setWidth(20),
        vertical: AppSizes.setHeight(21),
      ),
      color: CustomAppColor.of(context).bgScaffold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          actionRow(
            text: Languages.of(context).sortBy,
            iconAsset: AppAssets.icArrowFilter,
            context: context,
            onTap: sortByTap,
          ),
          divider(context),
          actionRow(
            text: Languages.of(context).category,
            iconAsset: AppAssets.icDownArrow,
            context: context,
            onTap: categoryTap,
          ),
          divider(context),
          actionRow(
            text: Languages.of(context).gender,
            iconAsset: AppAssets.icDownArrow,
            context: context,
            onTap: genderTap,
          ),
          divider(context),
          actionRow(
            text: Languages.of(context).filter,
            iconAsset: AppAssets.icFilter,
            context: context,
            onTap: filterTap,
          ),
        ],
      ),
    );
  }
}
