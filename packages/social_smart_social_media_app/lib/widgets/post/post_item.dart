import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../../../../../../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class PostWidget extends StatelessWidget {
  final String postImage;
  final String playIcon;
  final String likeCountText;
  final String postTitle;
  final String userName;
  final String duration;
  final bool? isPlayIcon;

  const PostWidget({
    super.key,
    required this.postImage,
    required this.playIcon,
    required this.likeCountText,
    required this.postTitle,
    required this.userName,
    required this.duration,
    this.isPlayIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              postImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [CustomAppColor.of(context).black.withOpacityPercent(0.2), CustomAppColor.of(context).bgGradiant2.withOpacityPercent(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          left: 8,
          child: Row(
            children: [
              Image.asset(
                playIcon,
                scale: 4.2,
              ),
              SizedBox(width: AppSizes.setWidth(3)),
              CommonText(
                text: likeCountText,
                textColor: CustomAppColor.of(context).white,
                fontSize: AppSizes.setFontSize(11),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Visibility(
          visible: isPlayIcon ?? false,
          child: Positioned.fill(
              child: Image.asset(
            AppAssets.icPlay,
            scale: 2,
          )),
        )
      ],
    );
  }
}
