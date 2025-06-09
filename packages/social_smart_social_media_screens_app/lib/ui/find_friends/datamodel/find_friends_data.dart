import 'package:flutter/cupertino.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../../utils/string_constant.dart';
import '../../followers/datamodel/followers_data.dart';

class SocialData {
  final String? socialIcon;
  final String? socialPlatform;
  final String? description;
  final bool? isInvite;

  SocialData({
    this.description,
    this.isInvite,
    this.socialIcon,
    this.socialPlatform,
  });
}

List<SocialData> socialDataList(BuildContext context) {
  return [
    SocialData(
      socialIcon: AppAssets.icShare,
      socialPlatform: Languages.of(context).inviteFriends,
      description: Languages.of(context).stayConnectedWithFriends,
      isInvite: true,
    ),
    SocialData(
      socialIcon: AppAssets.icViewer,
      socialPlatform: Languages.of(context).contacts,
      description: Languages.of(context).findYourContacts,
      isInvite: false,
    ),
    SocialData(
      socialIcon: AppAssets.icFacebookFilled,
      socialPlatform: Languages.of(context).facebookFriends,
      description: Languages.of(context).findFriendsOfFacebook,
      isInvite: false,
    ),
    SocialData(
      socialIcon: AppAssets.icInstagramFilled,
      socialPlatform: Languages.of(context).instagramFriends,
      description: Languages.of(context).findFriendsOfInstagram,
      isInvite: false,
    )
  ];
}

List<FollowersData> getSuggestedAccounts = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.saharRodriguez,
    followerDetails: AppStrings.saharRodriguezDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.traciClark,
    followerDetails: AppStrings.traciClarkDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile85,
    followerName: AppStrings.karolCotton,
    followerDetails: AppStrings.karolCottonDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile84,
    followerName: AppStrings.aliyaParsons,
    followerDetails: AppStrings.aliyaParsonsDetails,
  ),
];
