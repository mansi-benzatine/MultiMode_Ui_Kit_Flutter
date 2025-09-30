import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import '../../play_now/view/play_now_screen.dart';
import 'home_all_page.dart';

class HomeSongsPage extends StatefulWidget {
  const HomeSongsPage({super.key});

  @override
  State<HomeSongsPage> createState() => _HomeSongsPageState();
}

class _HomeSongsPageState extends State<HomeSongsPage> with TickerProviderStateMixin {
  int currentPageIndex = 0;
  late CarouselSliderController _carouselController;

  // Sample data for trending content
  final List<Map<String, String>> trendingData = [
    {
      'image': AppAssets.imgMusic1,
    },
    {
      'image': AppAssets.imgMusic2,
    },
    {
      'image': AppAssets.imgMusic3,
    },
    {
      'image': AppAssets.imgMusic1,
    },
  ];

  final List<MusicItemData> musicItemData = [
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Baby',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'The Monster',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Perfect',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Shape of You',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Sorry',
      singer: 'Justin Bieber',
    ),
  ];
  final List<MusicItemData> musicItemData1 = [
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'A Thousand Year',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Star Boy',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'On The Floor',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Love Again',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Sorry',
      singer: 'Justin Bieber',
    ),
  ];
  final List<MusicItemData> musicItemData2 = [
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Thinking Out Loud',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Let Her Go',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Faded',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Blank Space',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Shake It Off',
      singer: 'Justin Bieber',
    ),
  ];
  final List<MusicItemData> musicItemData3 = [
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Dark Horse',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'See You Again',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Sugar',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Counting Star  ',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Roar',
      singer: 'Justin Bieber',
    ),
  ];
  final List<MusicItemData> musicItemData4 = [
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Cheap Thrills',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Earned It',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Don\'t Let Me Down',
      singer: 'Rihanna',
    ),
  ];
  final List<MusicItemData> musicItemData5 = [
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'I Don’t Wanna Live Forever',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'City Of Stars',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'This One’s for You',
      singer: 'Ed Sheeran',
    ),
  ];
  late TabController _tabController;
  int selectedIndex = 0;
  final List<MusicItemData> trendingMusic = [
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Cheap Thrills',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Don\'t Let Me Down',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'I Don’t Wanna Live Forever',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'City Of Stars',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'This One’s for You',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Shake It Off',
      singer: 'Justin Bieber',
    ),
  ];
  List<String> tabList = [
    "New",
    "Songs",
    "Albums",
    "Podcasts",
    "Playlists",
  ];

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselSliderController();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MusicItemData?>(
        valueListenable: MusifyScreensApp.playingMusicNotifier,
        builder: (context, playingMusic, child) {
          final isMiniPlayerVisible = playingMusic != null;

          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: isMiniPlayerVisible ? 180.setHeight : 120.setHeight,
            ),
            child: Column(
              children: [
                SizedBox(height: 5.setHeight),
                _trendingView(),
                SizedBox(height: 5.setHeight),
                _top5SongView(),
                SizedBox(height: 10.setHeight),
                _recentlyPlayedView(),
                SizedBox(height: 24.setHeight),
                _musicList(
                  Languages.of(context).txtPopularMusic,
                  true,
                  musicList: musicItemData,
                  /*onViewAllClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PopularMusicScreen(title: Languages.of(context).txtPopularMusic)));
                  },*/
                  isShowTabbar: true,
                ),
                SizedBox(height: 20.setHeight),
                _musicList(
                  Languages.of(context).txtPopHits,
                  false,
                  musicList: musicItemData1,
                ),
                SizedBox(height: 20.setHeight),
                _musicList(
                  Languages.of(context).txtBollywoodHits,
                  false,
                  musicList: musicItemData2,
                ),
                SizedBox(height: 20.setHeight),
                _musicList(
                  Languages.of(context).txt90sHits,
                  false,
                  musicList: musicItemData3,
                ),
                SizedBox(height: 20.setHeight),
                _musicList(
                  Languages.of(context).txtAlbums,
                  false,
                  musicList: musicItemData4,
                ),
                SizedBox(height: 20.setHeight),
                _musicList(
                  Languages.of(context).txtPunjabiHits,
                  false,
                  musicList: musicItemData5,
                ),
              ],
            ),
          );
        });
  }

  Widget _trendingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonText(
            text: Languages.of(context).txtTrendingNow,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 20.setHeight),
        carousel.CarouselSlider(
          carouselController: _carouselController,
          options: carousel.CarouselOptions(
            height: 200.setHeight,
            aspectRatio: 1.2 / 1,
            viewportFraction: 0.6,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          items: trendingData.map((i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.setWidth),
              child: Container(
                width: 230.setWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      CustomAppColor.of(context).primary.withValues(alpha: 0.8),
                      CustomAppColor.of(context).primary.withValues(alpha: 0.4),
                    ],
                  ),
                ),
                child: Image.asset(
                  i['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 15.setHeight),
        // Page indicator dots

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            trendingData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
              width: index == currentPageIndex ? 8.setWidth : 5.setWidth,
              height: index == currentPageIndex ? 8.setHeight : 5.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == currentPageIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray.withOpacityPercent(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _top5SongView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          CommonText(
            text: Languages.of(context).txtTodaysTop5Song,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          Wrap(
            children: trendingMusic.map((music) {
              return Container(
                margin: EdgeInsets.only(bottom: 10.setHeight),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.setWidth),
                      child: Image.asset(
                        music.image,
                        width: 56.setWidth,
                        height: 56.setHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: music.name,
                            fontSize: 15.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CommonText(
                            text: music.singer,
                            fontSize: 13.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGray,
                            fontFamily: Constant.fontFamily,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < trendingMusic.length; i++) {
                              trendingMusic[i].isPlaying = false;
                            }
                            music.isPlaying = true;
                          });
                          if (music.isPlaying) {
                            MusifyScreensApp.playingMusicNotifier.value = music;
                          } else {
                            MusifyScreensApp.playingMusicNotifier.value = null;
                          }
                        },
                        child: music.isPlaying
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).primary,
                                ),
                                padding: EdgeInsets.all(7.setWidth),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.pause_rounded,
                                  color: CustomAppColor.of(context).black,
                                  size: 24.setWidth,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).primary,
                                ),
                                padding: EdgeInsets.all(12.setWidth),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppAssets.icPlay,
                                  height: 14.setHeight,
                                  width: 14.setWidth,
                                ),
                              ),
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
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _recentlyPlayedView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: Languages.of(context).txtRecentlyPlayed,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
        ),
        SizedBox(height: 15.setHeight),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Wrap(
              children: musicItemData4.map((item) {
                return IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayNowScreen(musicItem: item),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12.setWidth),
                      width: 168.setWidth,
                      height: 65.setHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: CustomAppColor.of(context).bgCard,
                        border: Border.all(
                          color: CustomAppColor.of(context).containerBorder,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item.image,
                              width: 65.setWidth,
                              height: 65.setHeight,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 80.setWidth,
                                  height: 80.setHeight,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
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
                          SizedBox(width: 5.setWidth),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.setHeight),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                                  child: CommonText(
                                    text: item.name,
                                    fontSize: 15.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                                  child: CommonText(
                                    text: item.singer,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    textColor: CustomAppColor.of(context).txtGray,
                                  ),
                                ),
                                SizedBox(height: 5.setHeight),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.setHeight),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.setHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(1000.setWidth),
                color: CustomAppColor.of(context).transparent,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 8.setWidth),
              padding: EdgeInsets.only(
                left: 16.setWidth,
              ),
              labelColor: CustomAppColor.of(context).txtWhite,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  _tabController.animateTo(index);
                });
              },
              tabs: List.generate(
                tabList.length,
                (index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000.setWidth),
                    color: selectedIndex == index ? CustomAppColor.of(context).primary : null,
                    border: selectedIndex != index
                        ? Border.all(
                            color: CustomAppColor.of(context).txtRoundTabUnselected,
                            width: 0.6,
                          )
                        : Border.all(
                            color: CustomAppColor.of(context).primary,
                            width: 1,
                          ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 6.setHeight),
                  child: CommonText(
                    text: tabList[index],
                    textColor: selectedIndex == index ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).txtRoundTabUnselected,
                    fontSize: 14.setFontSize,
                    fontWeight: index == selectedIndex ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _musicList(String title, bool needViewAll, {Function()? onViewAllClick, bool isShowTabbar = false, required List<MusicItemData> musicList}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: title,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              needViewAll
                  ? InkWell(
                      onTap: onViewAllClick ?? () {},
                      child: CommonText(
                        text: Languages.of(context).txtViewAll,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        if (!isShowTabbar) SizedBox(height: 10.setHeight),
        if (isShowTabbar) _topBar(),
        if (isShowTabbar) SizedBox(height: 8.setHeight),
        ValueListenableBuilder<MusicItemData?>(
          valueListenable: MusifyScreensApp.playingMusicNotifier,
          builder: (context, playingMusic, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Wrap(
                children: musicList.map((item) {
                  final isCurrentlyPlaying = playingMusic != null && playingMusic.name == item.name;

                  return IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayNowScreen(musicItem: item),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.setWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    item.image,
                                    width: 125.setWidth,
                                    height: 125.setHeight,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (isCurrentlyPlaying)
                                  Container(
                                    width: 125.setWidth,
                                    height: 125.setHeight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          const Color(0xff12413B).withOpacityPercent(0.4),
                                          const Color(0xff12413B).withOpacityPercent(0.6),
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.pause_circle_filled_rounded,
                                      color: CustomAppColor.of(context).primary,
                                      size: 40.setHeight,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 5.setHeight),
                            Container(
                              constraints: BoxConstraints(maxWidth: 110.setWidth),
                              child: CommonText(
                                text: item.name,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ),
                            CommonText(
                              text: item.singer,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textColor: CustomAppColor.of(context).txtGray,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
