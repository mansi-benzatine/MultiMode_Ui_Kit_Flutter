import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../../utils/app_assets.dart';
import '../../../utils/string_constant.dart';

class DashboardItems {
  final String userName;
  final String userDesignation;
  final String userProfile;
  final String postDescription;
  final String postImage;
  final VideoPlayerController? videoPlayerController;

  DashboardItems(
      {required this.userName,
      required this.userDesignation,
      required this.userProfile,
      required this.postDescription,
      required this.postImage,
      this.videoPlayerController});
}

class Comment {
  final String avatar;
  final String name;
  final String text;
  final int? likes;
  final String? timeAgo;
  final String? comment;
  bool? isLiked;

  Comment({
    required this.avatar,
    required this.name,
    required this.text,
    this.likes,
    this.timeAgo,
    this.comment,
    this.isLiked,
  });
}

List<Comment> comments(BuildContext context) {
  return [
    Comment(
      avatar: AppAssets.imgAvatar1,
      name: AppStrings.asaManning,
      text: AppStrings.commentFirst,
      likes: 614,
      timeAgo: AppStrings.sixDaysAgo,
      comment: AppStrings.liveComment1,
      isLiked: true,
    ),
    Comment(
      avatar: AppAssets.imgAvatar5,
      name: AppStrings.gabrielNolan,
      text: AppStrings.commentSecond,
      likes: 423,
      timeAgo: AppStrings.fourDaysAgo,
      comment: AppStrings.liveComment2,
      isLiked: false,
    ),
    Comment(
      name: AppStrings.oakleyHayden,
      text: AppStrings.commentThird,
      avatar: AppAssets.imgAvatar9,
      likes: 312,
      timeAgo: AppStrings.twoDaysAgo,
      comment: AppStrings.liveComment3,
      isLiked: true,
    ),
    Comment(
      avatar: AppAssets.imgProfile4,
      name: AppStrings.asaManning,
      text: AppStrings.commentFirst,
      likes: 614,
      timeAgo: AppStrings.fourDaysAgo,
      comment: AppStrings.liveComment1,
    ),
    Comment(
      avatar: AppAssets.imgProfile5,
      name: AppStrings.johnDoe,
      text: AppStrings.commentSecond,
      likes: 120,
      timeAgo: AppStrings.fourDaysAgo,
      comment: AppStrings.liveComment2,
    ),
    Comment(
      name: AppStrings.oakleyHayden,
      text: AppStrings.commentThird,
      avatar: AppAssets.imgProfile,
      likes: 98,
      timeAgo: AppStrings.fourDaysAgo,
      comment: AppStrings.liveComment3,
    ),
  ];
}

List<DashboardItems> dashboardItems(BuildContext context) {
  return [
    DashboardItems(
      userName: AppStrings.elizaWoods,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile3,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel1,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel1),
    ),
    DashboardItems(
      userName: AppStrings.maryNguyen,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile5,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel2,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel2),
    ),
    DashboardItems(
      userName: AppStrings.maryMarvin,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile3,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel1,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel1),
    ),
    DashboardItems(
      userName: AppStrings.johnDoe,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile5,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel2,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel2),
    ),
    DashboardItems(
      userName: AppStrings.maryGrande,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile3,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel1,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel1),
    ),
    DashboardItems(
      userName: AppStrings.maryCooper,
      userDesignation: AppStrings.fashionDesigner,
      userProfile: AppAssets.imgProfile5,
      postDescription: AppStrings.helloFriends,
      postImage: AppAssets.vdReel2,
      videoPlayerController: VideoPlayerController.asset(AppAssets.vdReel2),
    ),
  ];
}
