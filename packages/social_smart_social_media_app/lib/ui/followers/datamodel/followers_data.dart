import '../../../../../../../utils/app_assets.dart';
import '../../../utils/string_constant.dart';

class FollowersData {
  final String followerName;
  final String? followerDetails;
  final String followerProfile;
  bool? isFollowing;
  final String? message;
  final bool? isLiked;
  final String? likeCount;
  final String? messageTime;

  FollowersData({
    this.likeCount,
    required this.followerName,
    this.followerDetails,
    required this.followerProfile,
    this.isFollowing,
    this.message,
    this.isLiked,
    this.messageTime,
  });
}

List<FollowersData> getSuggestedFollowers = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.karenSims,
    followerDetails: AppStrings.karenSimsDetails,
    message: AppStrings.msg1,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.anisaLarson,
    followerDetails: AppStrings.anisaLarsonDetails,
    isFollowing: true,
    message: AppStrings.msg2,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.aishaOsborne,
    followerDetails: AppStrings.aishaOsborneDetails,
    message: AppStrings.msg3,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.lanaLamb,
    followerDetails: AppStrings.lanaLambDetails,
    message: AppStrings.msg4,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar5,
    followerName: AppStrings.stellaSullivan,
    followerDetails: AppStrings.stellaSullivanDetails,
    isFollowing: true,
    message: AppStrings.msg5,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.gabrielNolan,
    followerDetails: AppStrings.gabrielNolanDetails,
    message: AppStrings.msg6,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.coreyOconnell,
    followerDetails: AppStrings.coreyOconnellDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar7,
    followerName: AppStrings.khadijaMoss,
    followerDetails: AppStrings.khadijaMossDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile92,
    followerName: AppStrings.marilynBuchanan,
    followerDetails: AppStrings.marilynBuchananDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.oakleyHayden,
    followerDetails: AppStrings.oakleyHaydenDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar5,
    followerName: AppStrings.imogenORyan,
    followerDetails: AppStrings.imogenORyanDetails,
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.malihaLogan,
    followerDetails: AppStrings.malihaLoganDetails,
  ),
];

List<FollowersData> getFollowers = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.ronnieMoses,
    followerDetails: AppStrings.ronnieMosesDetails,
    message: AppStrings.msg1,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.aineReid,
    followerDetails: AppStrings.aineReidDetails,
    message: AppStrings.msg2,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.savannahZamora,
    followerDetails: AppStrings.savannahZamoraDetails,
    message: AppStrings.msg3,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.oakleyHayden,
    followerDetails: AppStrings.oakleyHaydenDetails,
    message: AppStrings.msg4,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.imogenORyan,
    followerDetails: AppStrings.imogenORyanDetails,
    message: AppStrings.msg5,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.malihaLogan,
    followerDetails: AppStrings.malihaLoganDetails,
    message: AppStrings.msg6,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.kylieKnowles,
    followerDetails: AppStrings.kylieKnowlesDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.tamzinYork,
    followerDetails: AppStrings.tamzinYorkDetails,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.phyllisAndersen,
    followerDetails: AppStrings.phyllisAndersenDetails,
  ),
];
