import 'package:flutter/cupertino.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/string_constant.dart';
import '../../dashboard/datamodel/dashboard_datamodel.dart';
import '../../followers/datamodel/followers_data.dart';
import '../../profile/datamodel/profile_data.dart';

List<Comment> seeLiveUsers(BuildContext context) {
  return [
    Comment(
      avatar: AppAssets.imgAvatar1,
      name: AppStrings.ayshaMathis,
      text: AppStrings.yahItIsGoodNow,
    ),
    Comment(
      avatar: AppAssets.imgAvatar8,
      name: AppStrings.matildaJames,
      text: AppStrings.heyHowAreYou,
    ),
    Comment(
      name: AppStrings.francisGardner,
      text: AppStrings.wowItsGreatMoments,
      avatar: AppAssets.imgAvatar2,
    ),
    Comment(
      avatar: AppAssets.imgAvatar6,
      name: AppStrings.nettiePatterson,
      text: AppStrings.niceItsMusicSoCool,
    ),
    Comment(
      avatar: AppAssets.imgAvatar3,
      name: AppStrings.carysJacobs,
      text: AppStrings.niceToMeetYouFriends,
    ),
    Comment(
      name: AppStrings.elspethLowery,
      text: AppStrings.hahaThatsTerrifying,
      avatar: AppAssets.imgAvatar7,
    ),
  ];
}

List<ProfileData> seeLiveProfileData(BuildContext context) {
  return [
    ProfileData(
      count: "987",
      profileContent: Languages.of(context).posts,
    ),
    ProfileData(count: "6.8M", profileContent: Languages.of(context).followers),
    ProfileData(count: "856", profileContent: Languages.of(context).following),
    ProfileData(
      count: "93M",
      profileContent: Languages.of(context).likes,
    ),
  ];
}

List<FollowersData> getViewersList = [
  FollowersData(followerProfile: AppAssets.imgProfile84, followerName: AppStrings.jordanneHolland),
  FollowersData(followerProfile: AppAssets.imgProfile85, followerName: AppStrings.marjorieParks),
  FollowersData(followerProfile: AppAssets.imgAvatar6, followerName: AppStrings.aleeshaHuffman),
  FollowersData(followerProfile: AppAssets.imgAvatar8, followerName: AppStrings.isabellaCampos),
];

List<FollowersData> getWeeklyRankingList = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar10,
    followerName: AppStrings.sharonAtkins,
    followerDetails: "88.95M",
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar9,
    followerName: AppStrings.robbieLandry,
    followerDetails: "52.74M",
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.liviaBriggs,
    followerDetails: "39.48M",
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.coraMeyers,
    followerDetails: "40.55M",
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.ollieDickerson,
    followerDetails: "84.5M",
    isFollowing: false,
  ),
];

List<FollowersData> getRisingStarsList = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.minnieRussell,
    followerDetails: "44.72M",
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar10,
    followerName: AppStrings.patriciaStewart,
    followerDetails: "88.79M",
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.lauraMayer,
    followerDetails: "45.72M",
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.dillonMcgee,
    followerDetails: "84.5M",
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.aliyahMoody,
    followerDetails: "42.78M",
    isFollowing: false,
  ),
];

List<FollowersData> getGoLiveTogether = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.hafsahMata,
    followerDetails: "5",
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.louieSchroeder,
    followerDetails: "36",
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar5,
    followerName: AppStrings.tahilaFax,
    followerDetails: "28",
  ),
];
List<FollowersData> getQnAList = [
  FollowersData(
    followerProfile: AppAssets.imgProfile85,
    followerName: AppStrings.fayHutchinson,
    isLiked: true,
    message: AppStrings.question,
    likeCount: "789",
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile84,
    followerName: AppStrings.mercedesCline,
    likeCount: "879",
    isLiked: false,
    message: AppStrings.doYouHaveAnyPetPeeves,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.jennaBenjamin,
    likeCount: "452",
    isLiked: true,
    message: AppStrings.haveYouEverBurntYourHair,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.kirstenSalinas,
    likeCount: "459",
    isLiked: false,
    message: AppStrings.haveYouEverBeenToAsia,
  ),
];
