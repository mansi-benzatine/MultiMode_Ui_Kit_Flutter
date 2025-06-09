import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/post/post_item.dart';
import '../../../widgets/text/common_text.dart';
import '../../discover/datamodel/discover_data.dart';

class TrendingSoundScreen extends StatefulWidget {
  const TrendingSoundScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const TrendingSoundScreen(),
    );
  }

  @override
  State<TrendingSoundScreen> createState() => _TrendingSoundScreenState();
}

class _TrendingSoundScreenState extends State<TrendingSoundScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: CommonText(
            text: AppStrings.trendingSound,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets.icShare,
                  color: CustomAppColor.of(context).icBlack,
                  scale: 5.5,
                ))
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: AppSizes.setWidth(5), right: AppSizes.setWidth(5), bottom: AppSizes.setHeight(80)),
                child: Column(
                  children: [
                    soundDetails(),
                    creatorDetail(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
                      child: const Divider(thickness: 0.3),
                    ),
                    gridPosts(context, trendingSoundsList),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: AppSizes.setHeight(20),
              left: AppSizes.setWidth(0),
              right: AppSizes.setWidth(0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.setWidth(20),
                  vertical: AppSizes.setHeight(10),
                ),
                child: CommonButton(
                  borderColor: AppColor.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icMusic,
                        color: CustomAppColor.of(context).white,
                        scale: 3.5,
                      ),
                      SizedBox(width: AppSizes.setWidth(12)),
                      CommonText(
                        text: AppStrings.useThisSound,
                        textColor: CustomAppColor.of(context).white,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget soundDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15), vertical: AppSizes.setHeight(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgProfile3,
                      height: AppSizes.setWidth(120),
                      width: AppSizes.setHeight(120),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(child: Image.asset(AppAssets.icPlay, scale: 2)),
                ],
              ),
              SizedBox(width: AppSizes.setWidth(15)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSizes.setHeight(15)),
                    CommonText(
                      text: AppStrings.professionalGirl,
                      overflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.setFontSize(20),
                      maxLines: 3,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSizes.setHeight(15)),
                    CommonText(
                      text: AppStrings.videoCount,
                      fontSize: AppSizes.setFontSize(14),
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtDarkGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.setHeight(15)),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  isOutLinedButton: true,
                  borderColor: CustomAppColor.of(context).purple,
                  height: AppSizes.setHeight(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icPlay,
                        color: CustomAppColor.of(context).purple,
                        width: AppSizes.setWidth(16),
                        height: AppSizes.setHeight(16),
                      ),
                      SizedBox(width: AppSizes.setWidth(6)),
                      CommonText(
                        text: AppStrings.playSong,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).purple,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSizes.setWidth(15)),
              Expanded(
                child: CommonButton(
                  isOutLinedButton: true,
                  borderColor: CustomAppColor.of(context).purple,
                  height: AppSizes.setHeight(36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icSaved,
                        color: CustomAppColor.of(context).purple,
                        width: AppSizes.setWidth(16),
                        height: AppSizes.setHeight(16),
                      ),
                      SizedBox(width: AppSizes.setWidth(6)),
                      CommonText(
                        text: AppStrings.addToFavorite,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).purple,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget creatorDetail() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(8)),
      leading: const CircleAvatar(backgroundImage: AssetImage(AppAssets.imgSound5), radius: 26),
      title: CommonText(
        text: AppStrings.johnDoe,
        fontSize: AppSizes.setFontSize(15),
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
      ),
      subtitle: CommonText(
        text: AppStrings.fashionProfessionalSinger,
        fontSize: AppSizes.setFontSize(13),
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.start,
        textColor: CustomAppColor.of(context).txtDarkGrey,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonButton(
            width: AppSizes.setWidth(74),
            height: AppSizes.setHeight(32),
            child: CommonText(
              text: Languages.of(context).follow,
              fontSize: AppSizes.setFontSize(12),
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).white,
            ),
          ),
        ],
      ),
    );
  }

  Widget gridPosts(BuildContext context, List<DiscoverData> itemList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(8)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7.0,
          childAspectRatio: 0.60,
        ),
        itemCount: itemList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return post(itemList[index]);
        },
      ),
    );
  }

  Widget post(DiscoverData trendingSound) {
    return PostWidget(
      postImage: trendingSound.postImage,
      playIcon: AppAssets.icPlay,
      likeCountText: "160.5k",
      postTitle: AppStrings.niceToMeetYou,
      userName: AppStrings.johnDoe,
      duration: "00:30",
      isPlayIcon: true,
    );
  }
}
