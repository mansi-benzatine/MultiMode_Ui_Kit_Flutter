import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/ui/search/view/search_screen.dart';
import 'package:musify_screens_app_package/utils/app_color.dart';
import 'package:musify_screens_app_package/utils/constant.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/utils/utils.dart';
import 'package:musify_screens_app_package/widgets/text/common_text.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../app/my_app.dart';
import '../../home/view/home_all_page.dart';

class FavouriteScreen extends StatefulWidget {
  final int currentIndex;
  final int subCurrentIndex;

  const FavouriteScreen({super.key, this.currentIndex = 0, this.subCurrentIndex = 0});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  late TabController _subTabController;
  int selectedIndex = 0;
  int subSelectedIndex = 0;

  List<String> tabList = [
    "Songs",
    "Podcasts",
  ];

  List<String> subTabList = [
    "Music",
    "Album",
  ];

  @override
  initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: widget.currentIndex,
      length: 2,
      vsync: this,
    );
    _subTabController = TabController(
      initialIndex: widget.subCurrentIndex,
      length: 2,
      vsync: this,
    );
    selectedIndex =widget.currentIndex;
    subSelectedIndex = widget.subCurrentIndex;
    _tabController.addListener(() {
      setState(() {

      });
    },);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: ValueListenableBuilder<MusicItemData?>(
            valueListenable: MusifyScreensApp.playingMusicNotifier,
            builder: (context, playingMusic, child) {
              final isMiniPlayerVisible = playingMusic != null;

              return Padding(
                padding: EdgeInsets.only(
                  bottom: isMiniPlayerVisible ? 120.setHeight : 30.setHeight,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.setWidth),
                      child: TopBar(
                        this,
                        title: Languages.of(context).txtFavourite,
                        isShowBack: false,
                        textAlign: TextAlign.center,
                        alignment: Alignment.topLeft,
                        isShowSearch: true,
                      ),
                    ),
                    SizedBox(height: 10.setHeight),
                    IgnorePointer(
                      ignoring: true,
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
                              textColor: index == selectedIndex ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).txtRoundTabUnselected,
                              fontSize: 16.setFontSize,
                              fontWeight: index == selectedIndex ? FontWeight.w700 : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _songsView(),
                          _podcastView(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _songsView() {
    final List<MusicItemData> favoriteSongs = [
      MusicItemData(
        image: AppAssets.imgMusic1,
        name: "A Thousand Year",
        singer: "Rihanna",
      ),
      MusicItemData(
        image: AppAssets.imgMusic2,
        name: "Star Boy",
        singer: "Justin Bieber",
      ),
      MusicItemData(
        image: AppAssets.imgMusic3,
        name: "On The Floor",
        singer: "Ed Sheeran",
      ),
      MusicItemData(
        image: AppAssets.imgMusic1,
        name: "Thinking Out Loud",
        singer: "Rihanna",
      ),
      MusicItemData(
        image: AppAssets.imgMusic2,
        name: "Let Her Go",
        singer: "Justin Bieber",
      ),
      MusicItemData(
        image: AppAssets.imgMusic3,
        name: "Faded",
        singer: "Ed Sheeran",
      ),
      MusicItemData(
        image: AppAssets.imgMusic1,
        name: "Blank Space",
        singer: "Ed Sheeran",
      ),
    ];

    final List<MusicItemData> favoriteAlbums = [
      MusicItemData(
        image: AppAssets.imgMusic1,
        name: "Reputation",
        singer: "16 Songs",
      ),
      MusicItemData(
        image: AppAssets.imgMusic2,
        name: "Fearless",
        singer: "12 Songs",
      ),
      MusicItemData(
        image: AppAssets.imgMusic3,
        name: "Speak Now",
        singer: "8 Songs",
      ),
      MusicItemData(
        image: AppAssets.imgMusic1,
        name: "Evermore",
        singer: "12 Songs",
      ),
    ];

    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        IgnorePointer(
          ignoring: true,
          child: TabBar(
            controller: _subTabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(1000.setWidth),
              color: CustomAppColor.of(context).primary,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(top: 40.setWidth),
            labelColor: CustomAppColor.of(context).txtBlack,
            indicatorColor: CustomAppColor.of(context).txtGray,
            padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
            onTap: (index) {
              setState(() {
                subSelectedIndex = index;
                _subTabController.animateTo(index);
              });
            },
            tabs: List.generate(
              subTabList.length,
              (index) => Tab(
                child: CommonText(
                  text: subTabList[index],
                  textColor: index == subSelectedIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  fontSize: 17.setFontSize,
                  height: 0,
                  fontWeight: index == subSelectedIndex ? FontWeight.w600 : FontWeight.w400,
                  fontFamily: Constant.fontFamily,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _subTabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.setHeight, left: 20.setWidth, right: 20.setWidth),
                itemCount: favoriteSongs.length,
                itemBuilder: (context, index) {
                  final song = favoriteSongs[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.setHeight),
                    child: Row(
                      children: [
                        // Song Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.setWidth),
                          child: Image.asset(
                            song.image,
                            width: 58.setWidth,
                            height: 58.setHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 50.setWidth,
                                height: 50.setHeight,
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                                  borderRadius: BorderRadius.circular(8.setWidth),
                                ),
                                child: Icon(
                                  Icons.music_note,
                                  color: CustomAppColor.of(context).primary,
                                  size: 20.setWidth,
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(width: 12.setWidth),

                        // Song Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: song.name,
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamily,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2.setHeight),
                              CommonText(
                                text: song.singer,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGray,
                                fontFamily: Constant.fontFamily,
                                maxLines: 1,
                                height: 0,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        // Play Button
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).primary,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            AppAssets.icPlay,
                            height: 10.setHeight,
                            width: 10.setWidth,
                          ),
                        ),

                        SizedBox(width: 8.setWidth),

                        // More Options Button
                        IconButton(
                          onPressed: () {
                            // Handle more options
                          },
                          icon: Icon(
                            Icons.more_vert,
                            color: CustomAppColor.of(context).txtBlack,
                            size: 20.setWidth,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.setHeight, left: 16.setWidth, right: 16.setWidth),
                itemCount: favoriteAlbums.length,
                itemBuilder: (context, index) {
                  final album = favoriteAlbums[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.setHeight),
                    child: Row(
                      children: [
                        // Song Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.setWidth),
                          child: Image.asset(
                            album.image,
                            width: 65.setWidth,
                            height: 65.setHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 50.setWidth,
                                height: 50.setHeight,
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                                  borderRadius: BorderRadius.circular(8.setWidth),
                                ),
                                child: Icon(
                                  Icons.music_note,
                                  color: CustomAppColor.of(context).primary,
                                  size: 20.setWidth,
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(width: 12.setWidth),

                        // Song Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: album.name,
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamily,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2.setHeight),
                              CommonText(
                                text: album.singer,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGray,
                                fontFamily: Constant.fontFamily,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        // More Options Button
                        IconButton(
                          onPressed: () {
                            // Handle more options
                          },
                          icon: Icon(
                            Icons.more_vert,
                            color: CustomAppColor.of(context).txtBlack,
                            size: 20.setWidth,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _podcastView() {
    final List<MusicItemData> podcastItemData = [
      MusicItemData(
        image: AppAssets.imgPodcast1,
        name: 'The Joe Rogan Experience',
        singer: 'Joe Rogan',
      ),
      MusicItemData(
        image: AppAssets.imgPodcast2,
        name: 'The City Celebrity',
        singer: 'Alex Copper',
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

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16.setHeight, left: 20.setWidth, right: 20.setWidth),
      itemCount: podcastItemData.length,
      itemBuilder: (context, index) {
        final album = podcastItemData[index];
        return Container(
          margin: EdgeInsets.only(bottom: 14.setHeight),
          child: Row(
            children: [
              // Song Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.setWidth),
                child: Image.asset(
                  album.image,
                  width: 68.setWidth,
                  height: 68.setHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50.setWidth,
                      height: 50.setHeight,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                        borderRadius: BorderRadius.circular(12.setWidth),
                      ),
                      child: Icon(
                        Icons.music_note,
                        color: CustomAppColor.of(context).primary,
                        size: 20.setWidth,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(width: 12.setWidth),

              // Song Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: album.name,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      fontFamily: Constant.fontFamily,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.setHeight),
                    CommonText(
                      text: album.singer,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      fontFamily: Constant.fontFamily,
                      maxLines: 1,
                      height: 0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // More Options Button
              IconButton(
                onPressed: () {
                  // Handle more options
                },
                icon: Icon(
                  Icons.more_vert,
                  color: CustomAppColor.of(context).txtBlack,
                  size: 20.setWidth,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen()));
    }
  }
}
