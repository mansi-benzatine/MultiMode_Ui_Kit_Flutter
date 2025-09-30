import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:musify_app_package/localization/language/languages.dart';
import 'package:musify_app_package/ui/app/my_app.dart';
import 'package:musify_app_package/ui/play_now/view/play_now_screen.dart';
import 'package:musify_app_package/utils/app_assets.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../popular_music/view/popular_music_screen.dart';

class HomeAllPage extends StatefulWidget {
  const HomeAllPage({super.key});

  @override
  State<HomeAllPage> createState() => _HomeAllPageState();
}

class _HomeAllPageState extends State<HomeAllPage> with TickerProviderStateMixin {
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

  final List<String> languages = [
    'English',
    'Arabic',
    'Chinese',
    'French',
    'German',
    'Italian',
    'Korean',
    'Russian',
    'Urdu',
  ];

  final List<MusicItemData> podcastItemData = [
    MusicItemData(
      image: AppAssets.imgPodcast1,
      name: 'The Joe Rogan Experiencejkkjn, dsdsfdsvxcvxcxcxcxc',
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
  late TabController _tabController;
  int selectedIndex = 0;
  bool isShowExtraSpaceInBottom = false;
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
      valueListenable: MusifyApp.playingMusicNotifier,
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
              SizedBox(height: 16.setHeight),
              _artistView(),
              SizedBox(height: 20.setHeight),
              _musicList("Hollywood Hits", false, musicList: musicItemData),
              SizedBox(height: 20.setHeight),
              _recentlyPlayedView(),
              SizedBox(height: 26.setHeight),
              _musicList(
                Languages.of(context).txtPopularMusic,
                true,
                isShowTabbar: true,
                musicList: musicItemData1,
                onViewAllClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PopularMusicScreen(
                        title: Languages.of(context).txtPopularMusic,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.setHeight),
              _musicList(Languages.of(context).txt90sHits, false, musicList: musicItemData2),
              SizedBox(height: 20.setHeight),
              _favouriteLanguageView(),
              SizedBox(height: 15.setHeight),
              _musicList(Languages.of(context).txtAlbums, false, musicList: musicItemData4),
              SizedBox(height: 20.setHeight),
              _podcastView(),
              SizedBox(height: 20.setHeight),
              _musicList("Rihana's Hits", false, musicList: musicItemData3),
              SizedBox(height: 20.setHeight),
              _musicList(Languages.of(context).txtPopHits, false, musicList: musicItemData5),
            ],
          ),
        );
      },
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
        SizedBox(height: 15.setHeight),
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
              margin: EdgeInsets.symmetric(horizontal: 1.5.setWidth),
              width: index == currentPageIndex ? 6.setWidth : 4.setWidth,
              height: index == currentPageIndex ? 6.setHeight : 4.setHeight,
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
            spacing: 16.setWidth,
            children: Constant.artistList.map((singer) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: singer['name']!,
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
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
          valueListenable: MusifyApp.playingMusicNotifier,
          builder: (context, playingMusic, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Wrap(
                children: musicList.map((item) {
                  final isCurrentlyPlaying = playingMusic != null && playingMusic.name == item.name;

                  return InkWell(
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
                            constraints: BoxConstraints(maxWidth: 120.setWidth),
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
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
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
              children: musicItemData.map((item) {
                return InkWell(
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
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _favouriteLanguageView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: Languages.of(context).txtFavouriteLanguages,
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
        SizedBox(height: 15.setHeight),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Wrap(
              children: languages.map((language) {
                return GestureDetector(
                  onTap: () => () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 10.setWidth),
                    child: ClipOval(
                      child: Stack(
                        children: [
                          Image.asset(
                            AppAssets.imgMusic2,
                            width: 100.setWidth,
                            height: 100.setHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100.setWidth,
                                height: 100.setHeight,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    AppAssets.imgMusic2,
                                    width: 100.setWidth,
                                    height: 100.setHeight,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xff12413B).withOpacityPercent(0.5),
                                    const Color(0xff12413B).withOpacityPercent(0.8),
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 100.setHeight,
                              width: 100.setWidth,
                              child: CommonText(
                                text: language,
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ),
                          ),
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

  Widget _podcastView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonText(
            text: Languages.of(context).txtPodcast,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Wrap(
              spacing: 16.setWidth,
              children: podcastItemData.map((item) {
                return GestureDetector(
                  onTap: () {
                    MusifyApp.playingMusicNotifier.value = item;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          item.image,
                          width: 150.setWidth,
                          height: 150.setHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 170.setWidth,
                              height: 170.setHeight,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  AppAssets.imgPodcast1,
                                  width: 170.setWidth,
                                  height: 170.setHeight,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      SizedBox(
                        width: 150.setWidth,
                        child: CommonText(
                          text: item.name,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      CommonText(
                        text: item.singer,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        height: 0,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }
}

class MusicItemData {
  final String image;
  final String name;
  final String singer;
  bool isPlaying;
  bool isFavorite;

  MusicItemData({
    required this.image,
    required this.name,
    required this.singer,
    this.isPlaying = false,
    this.isFavorite = false,
  });
}
