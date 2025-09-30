import 'package:flutter/material.dart';
import 'package:musify_app_package/dialogs/bottom_sheet/music_more_option_bottom_sheet.dart';
import 'package:musify_app_package/interfaces/top_bar_click_listener.dart';
import 'package:musify_app_package/localization/language/languages.dart';
import 'package:musify_app_package/ui/app/my_app.dart';
import 'package:musify_app_package/utils/app_assets.dart';
import 'package:musify_app_package/utils/app_color.dart';
import 'package:musify_app_package/utils/constant.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/widgets/text/common_text.dart';

import '../../home/view/home_all_page.dart';

class PlayNowScreen extends StatefulWidget {
  final MusicItemData? musicItem;

  const PlayNowScreen({super.key, this.musicItem});

  @override
  State<PlayNowScreen> createState() => _PlayNowScreenState();
}

class _PlayNowScreenState extends State<PlayNowScreen> implements TopBarClickListener {
  bool isPlaying = false;
  bool isFavorite = false;
  bool isShuffleOn = false;
  double currentPosition = 0.3; // 30% progress

  final List<TrendingMusicItem> trendingMusic = [
    TrendingMusicItem(
      title: "I Don’t Wanna Live Forever",
      artist: "Justin Bieber",
      image: AppAssets.imgMusic1,
    ),
    TrendingMusicItem(
      image: AppAssets.imgMusic2,
      title: 'City Of Stars',
      artist: 'Rihanna',
    ),
    TrendingMusicItem(
      title: "This One's For You ",
      artist: "Ed Sheeran",
      image: AppAssets.imgMusic3,
    ),
    TrendingMusicItem(
      title: "Cheap Thrills",
      artist: "Justin Bieber",
      image: AppAssets.imgMusic1,
    ),
    TrendingMusicItem(
      title: "Earn It",
      artist: "Ed Sheeran",
      image: AppAssets.imgMusic2,
    ),
    TrendingMusicItem(
      title: "Don't Let Me Down",
      artist: "Rihanna",
      image: AppAssets.imgMusic3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentMusic = widget.musicItem ??
        MusicItemData(
          image: AppAssets.imgMusic1,
          name: "Missmatched Season 3",
          singer: "24,754 Saved",
        );

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackgroundPlain),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /* TopBar(
                this,
                title: "",
                isShowBack: true,
                isShowFavorite: true,
              ),*/
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.setHeight, right: 20.setWidth, left: 10.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  AppAssets.icBack,
                                  width: 35.setWidth,
                                  height: 30.setHeight,
                                  color: CustomAppColor.of(context).txtBlack,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.setWidth),
                                child: Image.asset(
                                  currentMusic.image,
                                  width: 200.setHeight,
                                  height: 200.setHeight,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: isFavorite
                                  ? const Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 24,
                                    )
                                  : Image.asset(
                                      AppAssets.icFavouriteBottomBar,
                                      width: 24.setWidth,
                                      height: 30.setHeight,
                                      color: CustomAppColor.of(context).txtBlack,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      // Song details
                      SizedBox(height: 5.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  text: "24,754 saved",
                                  fontSize: 16.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  fontFamily: Constant.fontFamily,
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                                  child: Container(
                                    height: 20.setHeight,
                                    color: CustomAppColor.of(context).black,
                                    width: 0.5.setWidth,
                                  ),
                                ),
                                CommonText(
                                  text: currentMusic.name,
                                  fontSize: 16.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  fontFamily: Constant.fontFamily,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 15.setHeight),

                            // Action buttons
                            Row(
                              children: [
                                _buildActionButton(AppAssets.icAddPlus, () {}), SizedBox(width: 14.setWidth),
                                _buildActionButton(AppAssets.icDownloadMusic, () {}),
                                SizedBox(width: 8.setWidth),
                                _buildActionButton(AppAssets.icMore, () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => MusicMoreOptionBottomSheet(
                                      musicItem: widget.musicItem,
                                    ),
                                  );
                                }),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isShuffleOn = !isShuffleOn;
                                    });
                                  },
                                  child: Container(
                                    width: 40.setWidth,
                                    height: 40.setHeight,
                                    padding: EdgeInsets.all(8.setWidth),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isShuffleOn ? CustomAppColor.of(context).primary : Colors.transparent,
                                    ),
                                    child: Image.asset(
                                      AppAssets.icShuffle,
                                      color: CustomAppColor.of(context).txtBlack,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.setWidth),
                                // Play button
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPlaying = !isPlaying;
                                      if (isPlaying) {
                                        MusifyApp.playingMusicNotifier.value = widget.musicItem;
                                      } else {
                                        MusifyApp.playingMusicNotifier.value = null;
                                      }
                                    });
                                  },
                                  child: isPlaying
                                      ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: CustomAppColor.of(context).primary,
                                          ),
                                          padding: EdgeInsets.all(8.setHeight),
                                          child: Icon(
                                            Icons.pause_rounded,
                                            color: CustomAppColor.of(context).txtBlack,
                                            size: 25.setWidth,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: CustomAppColor.of(context).primary,
                                          ),
                                          padding: EdgeInsets.all(12.setHeight),
                                          child: Image.asset(
                                            AppAssets.icPlay,
                                            width: 13.setWidth,
                                            height: 12.setHeight,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.setHeight),
                      Divider(
                        color: CustomAppColor.of(context).greyIndicator,
                        thickness: 1,
                      ),
                      // Trending Now section
                      SizedBox(height: 5.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtTrendingNow,
                              fontSize: 18.setFontSize,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColor.of(context).txtBlack,
                              fontFamily: Constant.fontFamily,
                            ),
                            SizedBox(height: 16.setHeight),

                            // Trending music list
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: trendingMusic.length,
                              itemBuilder: (context, index) {
                                final music = trendingMusic[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 14.setHeight),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15.setWidth),
                                        child: Image.asset(
                                          music.image,
                                          width: 55.setWidth,
                                          height: 55.setHeight,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(width: 12.setWidth),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text: music.title,
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                              textColor: CustomAppColor.of(context).txtBlack,
                                              fontFamily: Constant.fontFamily,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 2.setHeight),
                                            CommonText(
                                              text: music.artist,
                                              fontSize: 12.setFontSize,
                                              fontWeight: FontWeight.w400,
                                              textColor: CustomAppColor.of(context).txtGray,
                                              fontFamily: Constant.fontFamily,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomAppColor.of(context).primary,
                                        ),
                                        padding: EdgeInsets.all(10.setHeight),
                                        child: Image.asset(
                                          AppAssets.icPlay,
                                          width: 13.setWidth,
                                          height: 12.setHeight,
                                        ),
                                      ),
                                      SizedBox(width: 8.setWidth),
                                      Icon(
                                        Icons.more_vert,
                                        color: CustomAppColor.of(context).txtBlack,
                                        size: 20.setWidth,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.setHeight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        icon,
        height: 22.setHeight,
        width: 24.setWidth,
        color: CustomAppColor.of(context).txtBlack,
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class TrendingMusicItem {
  final String title;
  final String artist;
  final String image;

  TrendingMusicItem({
    required this.title,
    required this.artist,
    required this.image,
  });
}
