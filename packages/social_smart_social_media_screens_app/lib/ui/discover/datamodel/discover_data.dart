import '../../../../../../../utils/string_constant.dart';
import '../../../utils/app_assets.dart';

class DiscoverList {
  final String title;
  final String? username;
  final String? time;
  final String count;
  final List<DiscoverData> list;
  final String? profile;

  DiscoverList({
    required this.list,
    required this.title,
    this.time,
    required this.count,
    this.username,
    this.profile,
  });
}

class DiscoverData {
  final String postImage;
  final String? viewCount;

  DiscoverData({required this.postImage, this.viewCount});
}

List<DiscoverData> healthyFruitsList = [
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "456.3K"),
  DiscoverData(postImage: AppAssets.imgFruits2, viewCount: "789.2K"),
  DiscoverData(postImage: AppAssets.imgFruits3, viewCount: "123.1K"),
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "698.2K"),
  DiscoverData(postImage: AppAssets.imgFruits3, viewCount: "123.5K"),
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "951.1K"),
  DiscoverData(postImage: AppAssets.imgFruits2, viewCount: "961.1K"),
  DiscoverData(postImage: AppAssets.imgFruits3, viewCount: "987.2K"),
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "880.8K"),
  DiscoverData(postImage: AppAssets.imgFruits3, viewCount: "456.3K"),
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "789.2K"),
  DiscoverData(postImage: AppAssets.imgFruits2, viewCount: "123.1K"),
];
List<DiscoverData> trendingSoundsList = [
  DiscoverData(postImage: AppAssets.imgTrendingSound1, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound2, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgProfile4, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound4, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound5, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound1, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgProfile4, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgProfile3, viewCount: "837.5K"),
  DiscoverData(postImage: AppAssets.imgProfile2, viewCount: "837.5K"),
];

List<DiscoverData> foodList = [
  DiscoverData(postImage: AppAssets.imgFruits5, viewCount: "728.5K"),
  DiscoverData(postImage: AppAssets.imgFruits2, viewCount: "837.9K"),
  DiscoverData(postImage: AppAssets.imgFruits3, viewCount: "736.2K"),
];

List<DiscoverData> healthyFruitList = [
  DiscoverData(postImage: AppAssets.imgFood3, viewCount: "987.2K"),
  DiscoverData(postImage: AppAssets.imgFood4, viewCount: "952.1K"),
  DiscoverData(postImage: AppAssets.imgFood2, viewCount: "412.2K"),
];

List<DiscoverData> trendingSoundList = [
  DiscoverData(postImage: AppAssets.imgProfile3, viewCount: "827.7K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound5, viewCount: "773.4K"),
  DiscoverData(postImage: AppAssets.imgProfile4, viewCount: "459.1K")
];
List<DiscoverData> hashtagSoundList = [
  DiscoverData(postImage: AppAssets.imgTrendingSound4, viewCount: "728.5K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound2, viewCount: "837.9K"),
  DiscoverData(postImage: AppAssets.imgTrendingSound1, viewCount: "736.2K"),
];

List<DiscoverList> discoverList = [
  DiscoverList(
    list: trendingSoundList,
    title: AppStrings.professionalGirlHashTag,
    time: "03:00",
    count: "789.5M",
    username: AppStrings.johnDoe,
    profile: AppAssets.imgProfile2,
  ),
  DiscoverList(
    list: healthyFruitList,
    title: AppStrings.greatFoods,
    time: "10:00",
    count: "498.8M",
    username: AppStrings.johnDoe,
    profile: AppAssets.imgFood4,
  )
];

List<DiscoverList> hashTagsList = [
  DiscoverList(
    list: foodList,
    title: AppStrings.healthyFood,
    count: "852.4M",
    username: AppStrings.hashtag,
  ),
  DiscoverList(
    list: hashtagSoundList,
    title: AppStrings.fashiongirl,
    username: AppStrings.hashtag,
    count: "985.3M",
  ),
  DiscoverList(
    list: hashtagSoundList,
    title: AppStrings.mixSongsForYou,
    username: AppStrings.hashtag,
    count: "456.2M",
  ),
];
