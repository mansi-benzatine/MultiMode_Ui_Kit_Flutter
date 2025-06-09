import 'package:flutter/cupertino.dart';

import '../../../../../../../utils/app_assets.dart';
import '../../../../../../../utils/string_constant.dart';

class AddPostDetailItems {
  final String? detailIcon;
  final String? detail;
  final bool? actionIcon;

  AddPostDetailItems({
    required this.detailIcon,
    required this.detail,
    required this.actionIcon,
  });
}

List<AddPostDetailItems> addPostDetailsItemList(BuildContext context) {
  return [
    AddPostDetailItems(
      detailIcon: AppAssets.icProfileFilled,
      detail: AppStrings.tagPeople,
      actionIcon: true,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icLocation,
      detail: AppStrings.location,
      actionIcon: true,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icFilledLock,
      detail: AppStrings.visibleToEveryone,
      actionIcon: true,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icChat,
      detail: AppStrings.allowComment,
      actionIcon: false,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icTwoUser,
      detail: AppStrings.allowDuet,
      actionIcon: false,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icPaper,
      detail: AppStrings.allowStitch,
      actionIcon: false,
    ),
    AddPostDetailItems(
      detailIcon: AppAssets.icMoreOption,
      detail: AppStrings.moreOption,
      actionIcon: true,
    )
  ];
}

final List<String> iconAssets = [
  AppAssets.icWhatAppFilled,
  AppAssets.icInstagramFilled,
  AppAssets.icFacebookFilled,
  AppAssets.icTwitterFilled,
];
