import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class IconItem {
  final String iconAsset;
  final String? label;
  final Function? onPressed;
  final bool? isShown;
  late bool? isSelected;
  final bool? isVideo;

  IconItem({
    required this.iconAsset,
    this.label,
    this.onPressed,
    this.isShown = false,
    this.isSelected,
    this.isVideo = false,
  });
}

List<IconItem> iconItems({required BuildContext context, bool? isVideoSelected}) {
  return [
    IconItem(
      iconAsset: AppAssets.icCameraFlip,
      label: Languages.of(context).flip,
    ),
    IconItem(
      iconAsset: AppAssets.icSpeed,
      label: Languages.of(context).speed,
      isShown: isVideoSelected,
    ),
    IconItem(
      iconAsset: AppAssets.icFilter,
      label: Languages.of(context).filters,
    ),
    IconItem(
      iconAsset: AppAssets.icBeauty,
      label: Languages.of(context).beauty,
    ),
    IconItem(
      iconAsset: AppAssets.icTimer,
      label: Languages.of(context).timer,
      isShown: isVideoSelected,
    ),
    IconItem(
      iconAsset: AppAssets.icComment,
      label: Languages.of(context).reply,
    ),
    IconItem(
      iconAsset: AppAssets.icFlash,
      label: Languages.of(context).flash,
    ),
  ];
}

List<IconItem> goLiveItems({required BuildContext context, bool? isVideoSelected}) {
  return [
    IconItem(
      iconAsset: AppAssets.icCameraFlip,
      label: Languages.of(context).flip,
    ),
    IconItem(
      iconAsset: AppAssets.icFilter,
      label: Languages.of(context).filters,
    ),
    IconItem(
      iconAsset: AppAssets.icFace,
      label: Languages.of(context).effects,
    ),
    IconItem(
      iconAsset: AppAssets.icTimer,
      label: Languages.of(context).timer,
      isShown: isVideoSelected,
    ),
    IconItem(
      iconAsset: AppAssets.icComment,
      label: Languages.of(context).comments,
    ),
    IconItem(
      iconAsset: AppAssets.icShare,
      label: Languages.of(context).share,
    ),
  ];
}

List<IconItem> postItems({required BuildContext context, bool? isVideoSelected}) {
  return [
    IconItem(
      iconAsset: AppAssets.icFont,
      label: Languages.of(context).flip,
    ),
    IconItem(
      iconAsset: AppAssets.icEmoji,
      label: Languages.of(context).flip,
      isShown: isVideoSelected,
    ),
    IconItem(
      iconAsset: AppAssets.icFlip,
      label: Languages.of(context).flip,
    ),
    IconItem(
      iconAsset: AppAssets.icSubTitle,
      label: Languages.of(context).speed,
    ),
    IconItem(
      iconAsset: AppAssets.icLock,
      label: Languages.of(context).filters,
      isShown: isVideoSelected,
    ),
    IconItem(
      iconAsset: AppAssets.icComment,
      label: Languages.of(context).beauty,
    ),
    IconItem(
      iconAsset: AppAssets.icRecordVoice,
      label: Languages.of(context).timer,
    ),
    IconItem(
      iconAsset: AppAssets.icAddImage,
      label: Languages.of(context).reply,
    ),
    IconItem(
      iconAsset: AppAssets.icFlash,
      label: Languages.of(context).flash,
    ),
  ];
}

List<IconItem> effectItems() {
  return [
    IconItem(iconAsset: AppAssets.imgEffect1, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect5, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect2, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect1, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect4, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect2, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect5, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect4, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect2, isSelected: false),
    IconItem(iconAsset: AppAssets.imgEffect1, isSelected: false),
  ];
}

List<IconItem> mediaItems() {
  return [
    IconItem(iconAsset: AppAssets.imgMedia1, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia2, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia4, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia5, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia6, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia7, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia5, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia2, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia1, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia5, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia4, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia6, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia7, isSelected: false),
  ];
}

List<IconItem> videoItems() {
  return [
    IconItem(iconAsset: AppAssets.imgMedia2, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia4, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia6, isSelected: false, isVideo: true),
    IconItem(iconAsset: AppAssets.imgMedia5, isSelected: false, isVideo: true),
  ];
}

List<IconItem> imageItems() {
  return [
    IconItem(iconAsset: AppAssets.imgMedia1, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia3, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia5, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia7, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia2, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia4, isSelected: false),
    IconItem(iconAsset: AppAssets.imgMedia1, isSelected: false),
  ];
}

List<IconItem> liveIcon(BuildContext context) {
  return [
    IconItem(iconAsset: AppAssets.icLiveTo, label: Languages.of(context).liveTo),
    IconItem(iconAsset: AppAssets.icQNA, label: Languages.of(context).qna),
    IconItem(iconAsset: AppAssets.icRose, label: Languages.of(context).rose),
    IconItem(iconAsset: AppAssets.icGift, label: Languages.of(context).gift),
    IconItem(iconAsset: AppAssets.icShare, label: "5.7K"),
  ];
}
