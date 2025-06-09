import '../../../../../../../../../utils/app_assets.dart';
import '../../../../../../../../../utils/string_constant.dart';
import '../../followers/datamodel/followers_data.dart';

class SearchUser {
  final String? userName;
  final String? icon;
  final String? userDetails;
  final String? userAvatar;
  final String? post;
  final String? soundName;
  final String? time;
  final String? soundCount;
  final bool? isIconShown;
  bool? isSongSaved;

  SearchUser({
    this.userName,
    this.icon,
    this.userDetails,
    this.post,
    this.userAvatar,
    this.time,
    this.soundName,
    this.soundCount,
    this.isIconShown,
    this.isSongSaved,
  });
}

List<SearchUser> recentSearch = [
  SearchUser(userName: AppStrings.harmonyKeith),
  SearchUser(userName: AppStrings.lexiePennington),
  SearchUser(userName: AppStrings.esmeeEdwards),
  SearchUser(userName: AppStrings.ellieMaeHarding),
];

List<SearchUser> suggestedSearch = [
  SearchUser(userName: AppStrings.maryGarner),
  SearchUser(userName: AppStrings.maryCooper),
  SearchUser(userName: AppStrings.maryRussel),
];

List<SearchUser> users = [
  SearchUser(userName: AppStrings.maryGarner, userDetails: AppStrings.malihaLoganDetails),
  SearchUser(userName: AppStrings.maryCooper, userDetails: AppStrings.maryCooperDetails),
];
List<SearchUser> topVideos = [
  SearchUser(
    post: AppAssets.imgProfile10,
    userName: AppStrings.maryShane,
    userAvatar: AppAssets.imgProfile4,
    soundCount: "856.7K",
  ),
  SearchUser(
    post: AppAssets.imgAvatar6,
    userName: AppStrings.maryArthur,
    userAvatar: AppAssets.imgProfile10,
    soundCount: "556.2K",
  ),
  SearchUser(
    post: AppAssets.imgProfile3,
    userName: AppStrings.maryShane,
    userAvatar: AppAssets.imgAvatar8,
    soundCount: "987.4K",
  ),
];
List<SearchUser> videos = [
  SearchUser(
    post: AppAssets.imgProfile4,
    userName: AppStrings.maryShane,
    userAvatar: AppAssets.imgProfile4,
    soundCount: "837.5K",
  ),
  SearchUser(
    post: AppAssets.imgProfile2,
    userName: AppStrings.maryArthur,
    userAvatar: AppAssets.imgProfile2,
    soundCount: "987.4K",
  ),
  SearchUser(
    post: AppAssets.imgProfile86,
    userName: AppStrings.maryShane,
    userAvatar: AppAssets.imgAvatar6,
    soundCount: "556.2K",
  ),
  SearchUser(
    post: AppAssets.imgProfile10,
    userName: AppStrings.maryMiles,
    userAvatar: AppAssets.imgCreateContent,
    soundCount: "856.7K",
  ),
  SearchUser(
    post: AppAssets.imgProfile83,
    userName: AppStrings.maryMiles,
    userAvatar: AppAssets.imgAvatar8,
    soundCount: "856.7K",
  ),
  SearchUser(
    post: AppAssets.imgProfile3,
    userName: AppStrings.maryGarner,
    userAvatar: AppAssets.imgAvatar3,
    soundCount: "856.7K",
  ),
];
List<SearchUser> lives = [
  SearchUser(
    post: AppAssets.imgProfile2,
    userName: AppStrings.maryFlores,
    userAvatar: AppAssets.imgProfile2,
    soundCount: "9.3K",
  ),
  SearchUser(
    post: AppAssets.imgProfile40,
    userName: AppStrings.maryCooper,
    userAvatar: AppAssets.imgAvatar3,
    soundCount: "8.4K",
  ),
  SearchUser(
    post: AppAssets.imgProfile70,
    userName: AppStrings.maryMarvin,
    userAvatar: AppAssets.imgProfile7,
    soundCount: "8.2K",
  ),
  SearchUser(
    post: AppAssets.imgProfile3,
    userName: AppStrings.maryKristin,
    userAvatar: AppAssets.imgProfile85,
    soundCount: "7.4K",
  ),
  SearchUser(
    post: AppAssets.imgProfile2,
    userName: AppStrings.maryMiles,
    userAvatar: AppAssets.imgProfile85,
    soundCount: "6.9K",
  ),
  SearchUser(
    post: AppAssets.imgProfile10,
    userName: AppStrings.maryGarner,
    userAvatar: AppAssets.imgAvatar7,
    soundCount: "4.4K",
  ),
];

List<SearchUser> sounds = [
  SearchUser(
    soundName: AppStrings.niceToMeetYou,
    post: AppAssets.imgSound3,
    soundCount: "776.8K",
    time: "01:00",
    userName: AppStrings.maryGrande,
    isSongSaved: true,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.saveTheWorld,
    post: AppAssets.imgSound1,
    soundCount: "785.8K",
    time: "00:30",
    userName: AppStrings.maryGrande,
    isSongSaved: false,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.tingTones,
    post: AppAssets.imgSound2,
    userName: AppStrings.maryGrande,
    soundCount: "931.8K",
    time: "00:50",
    isSongSaved: true,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.flowers,
    post: AppAssets.imgSound4,
    userName: AppStrings.maryGrande,
    soundCount: "996.8K",
    time: "01:00",
    isSongSaved: false,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.bestOfItemsMixMusic,
    post: AppAssets.imgSound3,
    userName: AppStrings.maryGrande,
    soundCount: "345.6K",
    time: "00:45",
    isSongSaved: false,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.mixLoveThemeMusic,
    post: AppAssets.imgSound5,
    userName: AppStrings.maryGrande,
    soundCount: "987.5K",
    time: "00:30",
    isSongSaved: false,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.magicMixMusic,
    post: AppAssets.imgSound4,
    userName: AppStrings.maryGrande,
    soundCount: "741.6K",
    time: "01:00",
    isSongSaved: false,
    isIconShown: true,
  ),
];

List<SearchUser> live = [
  SearchUser(post: AppAssets.imgProfile7),
  SearchUser(post: AppAssets.imgProfile2),
  SearchUser(post: AppAssets.imgProfile3),
  SearchUser(post: AppAssets.imgProfile4),
  SearchUser(post: AppAssets.imgProfile5),
];

List<SearchUser> hashTags = [
  SearchUser(userName: AppStrings.mary, soundCount: "44.72M"),
  SearchUser(userName: AppStrings.maryGrandeHashtag, soundCount: "42.48M"),
  SearchUser(userName: AppStrings.maryCooperHashtag, soundCount: "23.72M"),
  SearchUser(userName: AppStrings.maryGrandeHashtag2, soundCount: "92.41M"),
  SearchUser(userName: AppStrings.maryRusselHashtag, soundCount: "89.44M"),
  SearchUser(userName: AppStrings.maryMilesHashtag, soundCount: "66.55M"),
  SearchUser(userName: AppStrings.maryFloidHashtag, soundCount: "74.17M"),
  SearchUser(userName: AppStrings.maryTorHashtag, soundCount: "51.33M"),
  SearchUser(userName: AppStrings.maryMohrHashtag, soundCount: "59.59M"),
];

List<SearchUser> topSounds = [
  SearchUser(
    soundName: AppStrings.niceToMeetYou,
    post: AppAssets.imgSound5,
    soundCount: "776.8K",
    time: "01:00",
    userName: AppStrings.maryGrande,
    isSongSaved: true,
    isIconShown: true,
  ),
  SearchUser(
    soundName: AppStrings.saveTheWorld,
    post: AppAssets.imgSound1,
    soundCount: "785.8K",
    time: "00:30",
    userName: AppStrings.maryGrande,
    isSongSaved: false,
    isIconShown: true,
  )
];

List<FollowersData> getTopUsers = [
  FollowersData(
    followerProfile: AppAssets.imgProfile85,
    followerName: AppStrings.maryGarner,
    followerDetails: AppStrings.maryGarnerDetails,
    message: AppStrings.msg1,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgProfile84,
    followerName: AppStrings.malikKramer,
    followerDetails: AppStrings.malikKramerDetails,
    isFollowing: false,
  )
];

List<FollowersData> getUsers = [
  FollowersData(
    followerProfile: AppAssets.imgAvatar7,
    followerName: AppStrings.maryGrande,
    followerDetails: AppStrings.maryGrandeDetails,
    message: AppStrings.msg1,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar3,
    followerName: AppStrings.maryCooper,
    followerDetails: AppStrings.maryCooperDetails,
    message: AppStrings.msg2,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar8,
    followerName: AppStrings.maryEsther,
    followerDetails: AppStrings.maryEstherDetails,
    message: AppStrings.msg3,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar6,
    followerName: AppStrings.maryJuanita,
    followerDetails: AppStrings.maryJuanitaDetails,
    message: AppStrings.msg4,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.maryFlores,
    followerDetails: AppStrings.maryFloresDetails,
    message: AppStrings.msg5,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar1,
    followerName: AppStrings.maryMarvin,
    followerDetails: AppStrings.maryMarvinDetails,
    message: AppStrings.msg6,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar2,
    followerName: AppStrings.maryHenry,
    followerDetails: AppStrings.maryHenryDetails,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar4,
    followerName: AppStrings.maryNguyen,
    followerDetails: AppStrings.maryNguyenDetails,
    isFollowing: false,
  ),
  FollowersData(
    followerProfile: AppAssets.imgAvatar7,
    followerName: AppStrings.maryMiles,
    followerDetails: AppStrings.maryMilesDetails,
    isFollowing: false,
  ),
];
