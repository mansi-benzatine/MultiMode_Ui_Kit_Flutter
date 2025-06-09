import 'package:flutter/cupertino.dart';

import '../../../../../../../../../utils/app_assets.dart';

class ProfileData {
  final String count;
  final String profileContent;
  final Widget? screen;
  final bool? islike;

  ProfileData({
    required this.count,
    required this.profileContent,
    this.screen,
    this.islike,
  });
}

class ProfilePosts {
  final String postImage;
  final String playCount;
  final bool? isPost;

  ProfilePosts({
    required this.postImage,
    required this.playCount,
    this.isPost = false,
  });
}

List<ProfilePosts> profilePosts = [
  ProfilePosts(postImage: AppAssets.imgProfile4, playCount: "123.2K"),
  ProfilePosts(postImage: AppAssets.imgProfile3, playCount: "2K Likes", isPost: true),
  ProfilePosts(postImage: AppAssets.imgProfile2, playCount: "637.1K"),
  ProfilePosts(postImage: AppAssets.imgProfile5, playCount: "2K Likes", isPost: true),
  ProfilePosts(postImage: AppAssets.imgProfile4, playCount: "2K Likes", isPost: true),
  ProfilePosts(postImage: AppAssets.imgProfile7, playCount: "637.1K"),
];

List<ProfilePosts> savePosts = [
  ProfilePosts(postImage: AppAssets.imgProfile72, playCount: "367.5K"),
  ProfilePosts(postImage: AppAssets.imgProfile83, playCount: "837.9K"),
  ProfilePosts(postImage: AppAssets.imgProfile86, playCount: "736.2K"),
];

List<ProfilePosts> likesPosts = [
  ProfilePosts(postImage: AppAssets.imgProfile87, playCount: "367.5K"),
  ProfilePosts(postImage: AppAssets.imgTrendingSound1, playCount: "367.5K"),
  ProfilePosts(postImage: AppAssets.imgTrendingSound4, playCount: "367.5K"),
];

List<ProfilePosts> profileDetailPost = [
  ProfilePosts(postImage: AppAssets.imgTrendingSound5, playCount: "367.5K"),
  ProfilePosts(postImage: AppAssets.imgProfile83, playCount: "9K Likes", isPost: true),
  ProfilePosts(postImage: AppAssets.imgProfile86, playCount: "736.2K"),
  ProfilePosts(postImage: AppAssets.imgProfile87, playCount: "5K Likes", isPost: true),
  ProfilePosts(postImage: AppAssets.imgTrendingSound4, playCount: "367.5K"),
  ProfilePosts(postImage: AppAssets.imgTrendingSound1, playCount: "367.5K"),
];
