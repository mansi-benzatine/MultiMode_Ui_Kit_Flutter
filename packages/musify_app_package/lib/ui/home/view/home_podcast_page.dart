import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import 'home_all_page.dart';

class HomePodcastPage extends StatefulWidget {
  const HomePodcastPage({super.key});

  @override
  State<HomePodcastPage> createState() => _HomePodcastPageState();
}

class _HomePodcastPageState extends State<HomePodcastPage> {
  List<MusicItemData> podcastItemData = [];
  bool isFavourite = false;

  final List<PodcastCategoryData> podcastCategory = [
    PodcastCategoryData(image: AppAssets.imgPodcastCat1, name: 'Comedy'),
    PodcastCategoryData(image: AppAssets.imgPodcastCat2, name: 'Business'),
    PodcastCategoryData(image: AppAssets.imgPodcastCat3, name: 'Storytelling'),
    PodcastCategoryData(image: AppAssets.imgPodcastCat4, name: 'Sports'),
  ];

  _fillData() {
    podcastItemData = [
      MusicItemData(
        image: AppAssets.imgPodcast1,
        name: 'The Joe Rogan Experience',
        singer: 'Joe Rogan',
      ),
      MusicItemData(
        image: AppAssets.imgPodcast2,
        name: 'TED Talks Daily',
        singer: 'TED-ED',
      ),
      MusicItemData(
        image: AppAssets.imgPodcast3,
        name: 'TED Talks Daily',
        singer: 'TED-ED',
      ),
      MusicItemData(
        image: AppAssets.imgPodcast4,
        name: 'The Daily',
        singer: 'The Daily',
      ),
      MusicItemData(
        image: AppAssets.imgPodcast5,
        name: 'Humberman Lab',
        singer: 'Andrew',
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 150.setHeight),
      child: Column(
        children: [
          SizedBox(height: 5.setHeight),
          _trendingPodcastView(),
          SizedBox(height: 15.setHeight),
          _categoryView(),
          SizedBox(height: 20.setHeight),
          _artistView(),
          SizedBox(height: 20.setHeight),
          _popularPodcastView(),
        ],
      ),
    );
  }

  Widget _trendingPodcastView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: Languages.of(context).txtTrendingPodcast,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Wrap(
            children: podcastItemData.map((podcastItem) {
              return InkWell(
                onTap: () {
                  MusifyApp.playingMusicNotifier.value = podcastItem;
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12.setWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          podcastItem.image,
                          width: 120.setWidth,
                          height: 120.setHeight,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 140.setWidth,
                              height: 140.setHeight,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  AppAssets.imgPodcast1,
                                  width: 140.setWidth,
                                  height: 140.setHeight,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      SizedBox(
                        width: 125.setWidth,
                        child: CommonText(
                          text: podcastItem.name,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      CommonText(
                        text: podcastItem.singer,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        height: 0,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _categoryView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
          child: CommonText(
            text: "Categories",
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight),
        Wrap(
          spacing: 15.setWidth,
          runSpacing: 15.setHeight,
          children: List.generate(
            podcastCategory.length,
            (index) {
              final category = podcastCategory[index];
              return GestureDetector(
                onTap: () => () {},
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width - (20.setWidth * 2) - 15.setWidth) / 2,
                  height: 90.setHeight,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          category.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  AppAssets.imgPodcast1,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: CustomAppColor.of(context).containerBorder,
                              width: 1,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Utils.isLightTheme() ? const Color(0xffAEEDE5).withOpacityPercent(0.96) : const Color(0xff030404).withOpacityPercent(0.96),
                                Utils.isLightTheme() ? const Color(0xff0B3F38).withOpacityPercent(0.96) : const Color(0xff12413B).withOpacityPercent(0.9),
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: category.name,
                            fontSize: 20.setFontSize,
                            fontWeight: FontWeight.w600,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _artistView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: Languages.of(context).txtArtist,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Wrap(
            children: Constant.podcastArtistList.map((singer) {
              return GestureDetector(
                onTap: () => () {},
                child: Container(
                  margin: EdgeInsets.only(right: 12.setWidth),
                  width: 80.setWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          singer['image']!,
                          width: 80.setWidth,
                          height: 80.setHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 80.setWidth,
                              height: 80.setHeight,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  AppAssets.imgMusic1,
                                  width: 80.setWidth,
                                  height: 80.setHeight,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: singer['name']!,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _popularPodcastView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonText(
            text: Languages.of(context).txtPopularPodcast,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            itemCount: podcastItemData.length,
            itemBuilder: (context, index) {
              final item = podcastItemData[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20.setHeight),
                height: 320.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.setWidth),
                  border: Border.all(
                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.setWidth),
                  child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AppAssets.imgPodcast1,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      // Gradient Overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacityPercent(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Top Left Audio Icon
                      Positioned(
                        top: 16.setHeight,
                        left: 16.setWidth,
                        child: Container(
                          padding: EdgeInsets.all(4.setWidth),
                          child: Image.asset(
                            AppAssets.icWaveSmall,
                            width: 30.setWidth,
                            height: 30.setHeight,
                            fit: BoxFit.contain,
                            color: CustomAppColor.of(context).primary,
                          ),
                        ),
                      ),
                      // Top Right Favorite Icon
                      Positioned(
                        top: 16.setHeight,
                        right: 16.setWidth,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              item.isFavorite = !item.isFavorite;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.setWidth),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Utils.isLightTheme() ? CustomAppColor.of(context).white.withOpacityPercent(0.2) : CustomAppColor.of(context).white,
                            ),
                            child: item.isFavorite
                                ? Icon(
                                    Icons.favorite_rounded,
                                    size: 25,
                                    color: CustomAppColor.of(context).red,
                                  )
                                : Image.asset(
                                    AppAssets.icFavouriteBottomBar,
                                    width: 20.setWidth,
                                    height: 20.setHeight,
                                    fit: BoxFit.contain,
                                    color: CustomAppColor.of(context).txtWhite,
                                  ),
                          ),
                        ),
                      ),
                      // Bottom Content
                      Positioned(
                        bottom: 16.setHeight,
                        left: 16.setWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: item.name,
                              fontSize: 18.setFontSize,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColor.of(context).white,
                              fontFamily: Constant.fontFamily,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            CommonText(
                              text: item.singer,
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).white,
                              fontFamily: Constant.fontFamily,
                              maxLines: 1,
                              height: 0,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      // Play Button
                      Positioned(
                        bottom: 16.setHeight,
                        right: 16.setWidth,
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomAppColor.of(context).primary,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icPlay,
                              height: 18.setHeight,
                              width: 18.setWidth,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}

class PodcastCategoryData {
  final String image;
  final String name;

  PodcastCategoryData({required this.image, required this.name});
}
