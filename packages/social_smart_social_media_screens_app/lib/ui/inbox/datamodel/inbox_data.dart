import 'package:flutter/cupertino.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../../../../../../utils/string_constant.dart';

class InboxData {
  final String? icon;
  final String? avatar;
  final String? activityDetail;
  final String? iconDetail;
  final bool? isFollow;
  final String? image;

  InboxData({
    this.avatar,
    this.activityDetail,
    this.isFollow,
    this.icon,
    this.iconDetail,
    this.image,
  });
}

List<InboxData> allActivityList(BuildContext context) {
  return [
    InboxData(icon: AppAssets.icActivity, iconDetail: Languages.of(context).allActivity, isFollow: true),
    InboxData(icon: AppAssets.icHeartFilled, iconDetail: Languages.of(context).likes),
    InboxData(icon: AppAssets.icChat, iconDetail: Languages.of(context).comments),
    InboxData(icon: AppAssets.icPaper, iconDetail: Languages.of(context).qna),
    InboxData(icon: AppAssets.icProfileFilled, iconDetail: Languages.of(context).mentionAndTags),
    InboxData(icon: AppAssets.icViewerFilled, iconDetail: Languages.of(context).followers),
  ];
}

List<InboxData> todayList = [
  InboxData(
    avatar: AppAssets.imgAvatar2,
    iconDetail: AppStrings.pearlJordan,
    activityDetail: AppStrings.leaveACommentOnYourVideo,
    image: AppAssets.imgMedia1,
    isFollow: false,
  ),
  InboxData(
    avatar: AppAssets.imgAvatar6,
    iconDetail: AppStrings.lilliWalls,
    activityDetail: AppStrings.startedFollowing,
    isFollow: true,
  ),
  InboxData(
    avatar: AppAssets.imgAvatar8,
    iconDetail: AppStrings.nanaWhite,
    activityDetail: AppStrings.likedYourVideo,
    image: AppAssets.imgSound2,
    isFollow: false,
  )
];
List<InboxData> yesterdayList = [
  InboxData(
    avatar: AppAssets.imgAvatar1,
    iconDetail: AppStrings.mohamedSchaefer,
    activityDetail: AppStrings.startedFollowing,
    isFollow: true,
  ),
  InboxData(
    avatar: AppAssets.imgAvatar4,
    iconDetail: AppStrings.allenStein,
    activityDetail: AppStrings.leaveACommentOnYourVideo,
    isFollow: false,
    image: AppAssets.imgSound4,
  ),
];

List<InboxData> thisWeekList = [
  InboxData(
    avatar: AppAssets.imgAvatar6,
    iconDetail: AppStrings.aminaHerman,
    activityDetail: AppStrings.startedFollowing,
    isFollow: true,
  ),
  InboxData(
    avatar: AppAssets.imgAvatar7,
    iconDetail: AppStrings.lilliWalls,
    activityDetail: AppStrings.likedYourVideo,
    image: AppAssets.imgSound4,
    isFollow: false,
  ),
  InboxData(
      avatar: AppAssets.imgAvatar3,
      iconDetail: AppStrings.pearlJordan,
      activityDetail: AppStrings.likedYourVideo,
      image: AppAssets.imgSound4,
      isFollow: false)
];
