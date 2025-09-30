import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/ui/app/my_app.dart';
import 'package:musify_screens_app_package/ui/home/view/home_all_page.dart';
import 'package:musify_screens_app_package/utils/debug.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/widgets/text/common_text.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';

class PlayMusicFullScreen extends StatefulWidget {
  final MusicItemData? musicItem;
  final bool isForLyrics;
  static Route<void> route({MusicItemData? musicItem, bool isForLyrics = false}) {
    return MaterialPageRoute(
        builder: (_) => PlayMusicFullScreen(
              musicItem: musicItem,
              isForLyrics: isForLyrics,
            ));
  }

  const PlayMusicFullScreen({super.key, this.musicItem, this.isForLyrics = false});

  @override
  State<PlayMusicFullScreen> createState() => _PlayMusicFullScreenState();
}

class _PlayMusicFullScreenState extends State<PlayMusicFullScreen> implements TopBarClickListener {
  bool isPlaying = true;
  bool isFavorite = false;
  double currentPosition = 0.25; // 25% progress (02:10 / 04:15)

  final List<String> lyrics = [
    "I found a love for me",
    "Oh, darling, just dive right \nin and follow my lead",
    "Well, I found a girl,\n beautiful and sweet",
    "Oh, I never knew you were\n the someone waitin' for me",
    "",
    "Cause we were just kids when\n we fell in love, not knowin' what it was",
    "I will not give you up this time",
    "Oh, darling, just kiss me slow,\n your heart is all I own",
    "And in your eyes,\n you're holding mine",
    "",
    "Baby, I'm dancin' in the dark\n with you between my arms",
    "Barefoot on the grass while\n listenin' to our favourite song",
    "When you said you looked a mess,\n I whispered underneath my breath",
    "But you heard it, \n \"Darling, you look perfect tonight\"",
    "",
    "Well, I found a woman,\n stronger than anyone I know",
    "She shares my dreams,\n I hope that someday,\n I'll share her home",
    "I found a love to carry\n more than just my secrets",
    "To carry love,\n to carry children of our own"
  ];

  final ScrollController _scrollController = ScrollController();
  bool isCollapsed = false;
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
        // Consider collapsed when scrolled more than 300 pixels
        isCollapsed = scrollOffset > (0.screenHeight * 0.4);
        if (isCollapsed) {
          Debug.printLog("isCollapsed");
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentMusic = widget.musicItem ??
        MusicItemData(
          image: AppAssets.imgMusic1,
          name: "Ishq Hai",
          singer: "Anurag Saikia",
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
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    _sliverAppBar(currentMusic),
                    _sliverPersistentTabBar(currentMusic),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sliverAppBar(MusicItemData currentMusic) {
    return SliverAppBar(
      expandedHeight: widget.isForLyrics ? 0.setHeight : 0.screenHeight * 0.5,
      pinned: true,
      backgroundColor: CustomAppColor.of(context).transparent,
      forceMaterialTransparency: true,
      shadowColor: CustomAppColor.of(context).transparent,
      foregroundColor: CustomAppColor.of(context).transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
          child: Image.asset(
            AppAssets.icBack,
            width: 30.setWidth,
            height: 25.setHeight,
            color: CustomAppColor.of(context).txtBlack,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.only(left: 40.setWidth, right: 40.setWidth, top: 110.setHeight, bottom: 20.setHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.setWidth),
            child: Image.asset(
              currentMusic.image,
              width: 320.setWidth,
              height: 320.setHeight,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: isFavorite
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 26,
                  )
                : Image.asset(
                    AppAssets.icFavouriteBottomBar,
                    width: 24.setWidth,
                    height: 30.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
          ),
        ),
      ],
    );
  }

  _sliverPersistentTabBar(MusicItemData currentMusic) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverSongInfoDelegate(
        context: context,
        currentMusic: currentMusic,
        isPlaying: isPlaying,
        lyrics: lyrics,
        isCollapsed: isCollapsed,
        onPlayPauseClick: () {
          setState(() {
            isPlaying = !isPlaying;
          });
          if (isPlaying) {
            MusifyScreensApp.playingMusicNotifier.value = currentMusic;
          } else {
            MusifyScreensApp.playingMusicNotifier.value = null;
          }
        },
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

class _SliverSongInfoDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final double _headerHeight = 0.screenHeight * 0.9;
  final MusicItemData currentMusic;
  final bool isPlaying;
  final List<String> lyrics;
  final bool isCollapsed;
  final Function onPlayPauseClick;

  _SliverSongInfoDelegate({
    required this.context,
    required this.currentMusic,
    required this.isPlaying,
    required this.lyrics,
    required this.isCollapsed,
    required this.onPlayPauseClick,
  });

  @override
  double get minExtent => _headerHeight;

  @override
  double get maxExtent => _headerHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: _headerHeight,
      child: Container(
        padding: EdgeInsets.only(bottom: 0.setHeight, top: 10.setHeight),
        child: Column(
          children: [
            // Song Info and Action Icons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonText(
                          text: currentMusic.name,
                          fontSize: 28.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                          fontFamily: Constant.fontFamily,
                          maxLines: 1,
                          letterSpacing: 0,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.setHeight),
                        CommonText(
                          text: currentMusic.singer,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                          fontFamily: Constant.fontFamily,
                          maxLines: 1,
                          letterSpacing: 0,
                          height: 0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icAddPlus,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(width: 15.setWidth),
                      Image.asset(
                        AppAssets.icDownloadMusic,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(width: 10.setWidth),
                      Image.asset(
                        AppAssets.icMore,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.setHeight),

            // Progress Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: CustomAppColor.of(context).primary,
                      inactiveTrackColor: CustomAppColor.of(context).containerBorder,
                      thumbColor: CustomAppColor.of(context).primary,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.setWidth),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 12.setWidth),
                      trackHeight: 2.setHeight,
                    ),
                    child: Slider(
                      value: 0.5,
                      padding: EdgeInsets.zero,
                      onChanged: (value) {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "02:10",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontFamily: Constant.fontFamily,
                      ),
                      CommonText(
                        text: "04:15",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontFamily: Constant.fontFamily,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.setHeight),

            // Control Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppAssets.icRepeatMusic,
                    width: 22.setWidth,
                    height: 22.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  Icon(
                    Icons.skip_previous_rounded,
                    size: 50.setWidth,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  InkWell(
                    onTap: () {
                      onPlayPauseClick();
                    },
                    child: Container(
                      width: 55.setWidth,
                      height: 55.setHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Icon(
                        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: CustomAppColor.of(context).black,
                        size: 32.setWidth,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.skip_next_rounded,
                    size: 50.setWidth,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  Image.asset(
                    AppAssets.icShuffle,
                    width: 22.setWidth,
                    height: 22.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
            ),

            // Animated Lyrics Header with smooth transformation
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isCollapsed ? 80.setHeight : (0.screenHeight * 0.1 + 80.setHeight),
              child: Stack(
                children: [
                  // Expanded state (arrow + small text)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: isCollapsed ? -100.setHeight : 0.screenHeight * 0.100,
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isCollapsed ? 0.0 : 1.0,
                      child: Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 24.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                          SizedBox(height: 2.setHeight),
                          CommonText(
                            text: "Lyrics",
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Collapsed state (large title)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: isCollapsed ? 20.setHeight : 60.setHeight,
                    left: 20.setWidth,
                    right: 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isCollapsed ? 1.0 : 0.0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          style: TextStyle(
                            fontSize: isCollapsed ? 28.setFontSize : 14.setFontSize,
                            fontWeight: isCollapsed ? FontWeight.w600 : FontWeight.w500,
                            color: CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            package: "musify_screens_app_package",
                          ),
                          child: const Text("Lyrics"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isCollapsed ? 0 : 20.setHeight),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxScrolled) => [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 10.setHeight),
                  ),
                ],
                body: Stack(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 50.setHeight),
                      itemCount: lyrics.length,
                      itemBuilder: (context, index) {
                        final line = lyrics[index];
                        if (line.isEmpty) {
                          return SizedBox(height: 20.setHeight);
                        }

                        bool isHighlighted = line == "Cause we were just kids when\n we fell in love, not knowin' what it was";
                        return Container(
                          margin: EdgeInsets.only(bottom: 6.setHeight),
                          child: CommonText(
                            text: line,
                            height: 0,
                            fontSize: isHighlighted ? 18.setFontSize : 16.setFontSize,
                            fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w400,
                            textColor: isHighlighted ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                            fontFamily: Constant.fontFamily,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            CustomAppColor.of(context).txtWhite.withValues(alpha: 0.8),
                            CustomAppColor.of(context).txtWhite.withValues(alpha: 0.1),
                            CustomAppColor.of(context).txtWhite.withValues(alpha: 0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate is! _SliverSongInfoDelegate || oldDelegate.isPlaying != isPlaying;
  }
}
