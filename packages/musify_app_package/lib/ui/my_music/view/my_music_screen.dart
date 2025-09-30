import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/app_color.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';

import '../../../dialogs/bottom_sheet/create_new_play_list_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../search/view/search_screen.dart';

class MyMusicScreen extends StatefulWidget {
  const MyMusicScreen({super.key});

  @override
  State<MyMusicScreen> createState() => _MyMusicScreenState();
}

class _MyMusicScreenState extends State<MyMusicScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = [
    "Songs",
    "Podcasts",
  ];

  @override
  initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.setWidth),
              child: TopBar(
                this,
                title: Languages.of(context).txtMyMusic,
                isShowBack: false,
                textAlign: TextAlign.center,
                alignment: Alignment.topLeft,
                isShowSearch: true,
              ),
            ),
            SizedBox(height: 5.setHeight),
            TabBar(
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
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 6.setHeight),
                  child: CommonText(
                    text: tabList[index],
                    textColor: index == selectedIndex ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).txtRoundTabUnselected,
                    fontSize: 15.setFontSize,
                    fontWeight: index == selectedIndex ? FontWeight.w700 : FontWeight.w400,
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
      ),
    );
  }

  Widget _songsView() {
    final List<PlaylistData> playlists = [
      PlaylistData(
        image: AppAssets.imgMusic1,
        name: "My Favourites",
        songCount: "75 Songs",
      ),
      PlaylistData(
        image: AppAssets.imgMusic2,
        name: "Romantic Songs",
        songCount: "18 Songs",
      ),
      PlaylistData(
        image: AppAssets.imgMusic3,
        name: "90's Song",
        songCount: "28 Songs",
      ),
      PlaylistData(
        image: AppAssets.imgMusic1,
        name: "Pop Song",
        songCount: "5 Song",
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.setWidth),
      child: Column(
        children: [
          // Create New Playlist Button
          GestureDetector(
            onTap: () {
              // Handle create new playlist
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const CreateNewPlayListBottomSheet(),
              );
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomAppColor.of(context).primary.withOpacityPercent(0),
                        CustomAppColor.of(context).primary.withOpacityPercent(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14.setWidth),
                    border: Border.all(
                      color: CustomAppColor.of(context).primary.withOpacityPercent(30),
                      width: 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 17.setWidth),
                  child: Icon(
                    Icons.add_rounded,
                    color: CustomAppColor.of(context).txtBlack,
                    size: 30.setWidth,
                  ),
                ),
                SizedBox(width: 14.setWidth),
                CommonText(
                  text: Languages.of(context).txtCreateNewPlaylist,
                  fontSize: 17.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                ),
              ],
            ),
          ),

          SizedBox(height: 16.setHeight),

          // Playlists List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16.setHeight),
                child: Row(
                  children: [
                    // Playlist Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.setWidth),
                      child: Image.asset(
                        playlist.image,
                        width: 65.setWidth,
                        height: 65.setHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60.setWidth,
                            height: 60.setHeight,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                              borderRadius: BorderRadius.circular(8.setWidth),
                            ),
                            child: Icon(
                              Icons.music_note,
                              color: CustomAppColor.of(context).primary,
                              size: 24.setWidth,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(width: 16.setWidth),

                    // Playlist Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: playlist.name,
                            fontSize: 17.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CommonText(
                            text: playlist.songCount,
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
          ),
        ],
      ),
    );
  }

  Widget _podcastView() {
    final List<PlaylistData> playlists = [
      PlaylistData(
        image: AppAssets.imgPodcast1,
        name: "Call Her Daddy",
        songCount: "Alex copper",
      ),
      PlaylistData(
        image: AppAssets.imgPodcast2,
        name: "Crime Junkie",
        songCount: "Podcast",
      ),
      PlaylistData(
        image: AppAssets.imgPodcast3,
        name: "The Last of Us",
        songCount: "Podcast",
      ),
      PlaylistData(
        image: AppAssets.imgPodcast4,
        name: "The City Celebrity",
        songCount: "TRS - Podcast",
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.setWidth),
      child: Column(
        children: [
          // Create New Playlist Button
          InkWell(
            onTap: () {
              // Handle create new playlist
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const CreateNewPlayListBottomSheet(),
              );
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomAppColor.of(context).primary.withOpacityPercent(0),
                        CustomAppColor.of(context).primary.withOpacityPercent(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14.setWidth),
                    border: Border.all(
                      color: CustomAppColor.of(context).primary.withOpacityPercent(30),
                      width: 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 17.setWidth),
                  child: Icon(
                    Icons.add_rounded,
                    color: CustomAppColor.of(context).txtBlack,
                    size: 30.setWidth,
                  ),
                ),
                SizedBox(width: 14.setWidth),
                CommonText(
                  text: Languages.of(context).txtCreateNewPlaylist,
                  fontSize: 17.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                ),
              ],
            ),
          ),

          SizedBox(height: 16.setHeight),

          // Playlists List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16.setHeight),
                child: Row(
                  children: [
                    // Playlist Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.setWidth),
                      child: Image.asset(
                        playlist.image,
                        width: 65.setWidth,
                        height: 65.setHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60.setWidth,
                            height: 60.setHeight,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                              borderRadius: BorderRadius.circular(8.setWidth),
                            ),
                            child: Icon(
                              Icons.music_note,
                              color: CustomAppColor.of(context).primary,
                              size: 24.setWidth,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(width: 14.setWidth),

                    // Playlist Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: playlist.name,
                            fontSize: 17.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CommonText(
                            text: playlist.songCount,
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
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
    }
  }
}

class PlaylistData {
  final String image;
  final String name;
  final String songCount;

  PlaylistData({
    required this.image,
    required this.name,
    required this.songCount,
  });
}
