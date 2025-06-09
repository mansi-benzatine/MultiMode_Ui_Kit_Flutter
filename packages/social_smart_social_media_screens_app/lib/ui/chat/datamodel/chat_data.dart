import '../../../utils/app_assets.dart';
import '../../../utils/string_constant.dart';
import '../../followers/datamodel/followers_data.dart';

List<FollowersData> getChatList = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.diane,
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.omar,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.eliot,
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile70,
    followerName: AppStrings.hussein,
    isFollowing: true,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile69,
    followerName: AppStrings.stellaSullivan,
    isFollowing: true,
  ),
];

List<FollowersData> getMessageList = [
  FollowersData(
    followerProfile: AppAssets.imgProfile5,
    followerName: AppStrings.tonyArmstrong,
    message: AppStrings.msg1,
    isFollowing: true,
    likeCount: "5",
    messageTime: "10:30",
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile85,
    followerName: AppStrings.sylviaTownsend,
    isFollowing: true,
    message: AppStrings.msg2,
    likeCount: "8",
    messageTime: "08:50",
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.belleBowen,
    message: AppStrings.msg3,
    messageTime: "11:26",
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.reggieMcmahon,
    message: AppStrings.msg4,
    isFollowing: true,
    likeCount: "7",
    messageTime: "Yesterday",
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.darcieMccormick,
    message: AppStrings.msg5,
    messageTime: "Sep 20,2023",
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile69,
    followerName: AppStrings.maiseyHunt,
    followerDetails: AppStrings.gabrielNolanDetails,
    message: AppStrings.msg6,
    messageTime: "Jan 14,2023",
  ),
];
