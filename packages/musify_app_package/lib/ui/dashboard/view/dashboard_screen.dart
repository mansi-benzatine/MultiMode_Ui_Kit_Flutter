import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/app/my_app.dart';
import 'package:musify_app_package/ui/home/view/home_screen.dart';
import 'package:musify_app_package/ui/my_music/view/my_music_screen.dart';
import 'package:musify_app_package/utils/debug.dart';
import 'package:musify_app_package/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../favourite/view/favourite_screen.dart';
import '../../home/view/home_all_page.dart';
import '../../play_music_full_screen/view/play_music_full_screen.dart';
import '../../profile/view/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _pages = [];

  ValueNotifier<bool> isMusicPlaying = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const MyMusicScreen(),
      const FavouriteScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 0.setHeight,
            left: 0,
            right: 0,
            child: _bottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Column(
      children: [
        ValueListenableBuilder<MusicItemData?>(
            valueListenable: MusifyApp.playingMusicNotifier,
            builder: (context, value, child) {
              Debug.printLog("${value?.name}");
              return (value != null)
                  ? InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PlayMusicFullScreen(musicItem: value)));
                      },
                      child: Container(
                        color: CustomAppColor.of(context).red,
                        padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
                        child: Row(
                          children: [
                            SizedBox(width: 5.setWidth),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                MusifyApp.playingMusicNotifier.value?.image ?? '',
                                height: 40.setHeight,
                                fit: BoxFit.contain,
                                gaplessPlayback: true,
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: MusifyApp.playingMusicNotifier.value?.name ?? '',
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                  CommonText(
                                    text: MusifyApp.playingMusicNotifier.value?.singer ?? '',
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                            Icon(
                              Icons.skip_previous_rounded,
                              color: CustomAppColor.of(context).white,
                              size: 30.setHeight,
                            ),
                            ValueListenableBuilder<bool>(
                              valueListenable: isMusicPlaying,
                              builder: (context, value, child) {
                                return InkWell(
                                  onTap: () {
                                    isMusicPlaying.value = !value;
                                  },
                                  child: Icon(
                                    value ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                    color: CustomAppColor.of(context).white,
                                    size: 30.setHeight,
                                  ),
                                );
                              },
                            ),
                            Icon(
                              Icons.skip_next_rounded,
                              color: CustomAppColor.of(context).white,
                              size: 30.setHeight,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container();
            }),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
            child: Container(
              margin: EdgeInsets.only(
                left: 0.screenWidth * 0.05,
                right: 0.screenWidth * 0.05,
                bottom: 50.setHeight,
              ),
              padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 8.setWidth),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: CustomAppColor.of(context).bgBottomBar,
                border: Border.all(
                  color: CustomAppColor.of(context).borderBottomBar,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(AppAssets.icHomeBottomBar, AppAssets.icHomeBottomBarSelected, Languages.of(context).txtHome, 0),
                  _buildNavItem(AppAssets.icMyMusicBottomBar, AppAssets.icMyMusicBottomBarSelected, Languages.of(context).txtMyMusic, 1),
                  _buildNavItem(AppAssets.icFavouriteBottomBar, AppAssets.icFavouriteBottomBarSelected, Languages.of(context).txtFavourite, 2),
                  _buildNavItem(AppAssets.icProfileBottomBar, AppAssets.icProfileBottomBarSelected, Languages.of(context).txtProfile, 3),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String icon, String selectedIcon, String text, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          _pageController.jumpToPage(index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 12.setWidth : 12.setWidth, vertical: 8.setHeight),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24.setWidth,
              height: 24.setHeight,
              child: Image.asset(
                isSelected ? selectedIcon : icon,
                height: 24.setHeight,
                fit: BoxFit.contain,
                gaplessPlayback: true,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 5.setWidth),
              CommonText(
                text: text,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBottomBar,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
