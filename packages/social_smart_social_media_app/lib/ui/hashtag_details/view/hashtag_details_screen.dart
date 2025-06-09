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

class HashtagDetailsScreen extends StatefulWidget {
  const HashtagDetailsScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HashtagDetailsScreen(),
    );
  }

  @override
  State<HashtagDetailsScreen> createState() => _HashtagDetailsScreenState();
}

class _HashtagDetailsScreenState extends State<HashtagDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: CommonText(
            text: Languages.of(context).hashTags,
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
                    hashTagDetails(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14)),
                      child: const Divider(thickness: 0.3),
                    ),
                    gridPosts(context, healthyFruitsList),
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
                        AppAssets.icHashTagFilled,
                        color: AppColor.white,
                        height: AppSizes.setHeight(14),
                        width: AppSizes.setWidth(14),
                      ),
                      SizedBox(
                        width: AppSizes.setWidth(12),
                      ),
                      const CommonText(
                        text: AppStrings.joinThisHashtag,
                        textColor: AppColor.txtWhite,
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

  Widget hashTagDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15), vertical: AppSizes.setHeight(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.icHashTagAvatar,
                height: AppSizes.setWidth(100),
                width: AppSizes.setWidth(100),
                fit: BoxFit.fill,
              ),
              SizedBox(width: AppSizes.setWidth(14)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppStrings.healthyFood,
                      overflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.setFontSize(20),
                      maxLines: 3,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSizes.setHeight(5)),
                    CommonText(
                      text: "852.4M Videos",
                      fontSize: AppSizes.setFontSize(14),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: AppSizes.setHeight(15)),
                    CommonButton(
                      isOutLinedButton: true,
                      borderColor: AppColor.txtPurple,
                      height: AppSizes.setHeight(32),
                      width: AppSizes.setWidth(170),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icSaved,
                            color: AppColor.txtPurple,
                            height: AppSizes.setHeight(16),
                            width: AppSizes.setWidth(14),
                          ),
                          SizedBox(width: AppSizes.setWidth(8)),
                          const CommonText(
                            text: AppStrings.addToFavorite,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.txtPurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.setHeight(5)),
        ],
      ),
    );
  }

  Widget gridPosts(BuildContext context, List<DiscoverData> itemList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(16)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 7.0,
          childAspectRatio: 0.64,
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
        likeCountText: trendingSound.viewCount ?? '',
        postTitle: AppStrings.niceToMeetYou,
        userName: AppStrings.johnDoe,
        duration: "00:30",
        isPlayIcon: true);
  }
}
