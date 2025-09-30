import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../app/my_app.dart';
import '../../home/view/home_all_page.dart';
import '../../search/view/search_screen.dart';

class PopularMusicScreen extends StatefulWidget {
  final String? title;
  const PopularMusicScreen({super.key, this.title});

  @override
  State<PopularMusicScreen> createState() => _PopularMusicScreenState();
}

class _PopularMusicScreenState extends State<PopularMusicScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = [
    "New",
    "Songs",
    "Albums",
    "Podcasts",
    "Playlists",
    "Artists",
  ];

  final List<MusicItemData> musicItemData = [
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'This One’s for You',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'Don\'t Let Me Down',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'City Of Stars',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Shape of You',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'I Don’t Wanna Live Forever',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Thinking Out Loud',
      singer: 'Ed Sheeran',
    ),
  ];

  @override
  initState() {
    super.initState();
    _tabController = TabController(
      length: tabList.length,
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
            TopBar(
              this,
              title: widget.title ?? Languages.of(context).txtPopularMusic,
              isShowBack: true,
              isShowSearch: true,
            ),
            SizedBox(height: 16.setHeight),
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
                  padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 6.setHeight),
                  child: CommonText(
                    text: tabList[index],
                    textColor: selectedIndex == index ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).txtRoundTabUnselected,
                    fontSize: 15.setFontSize,
                    fontWeight: index == selectedIndex ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: List.generate(
                  tabList.length,
                  (tabIndex) => SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.setWidth,
                      vertical: 16.setHeight,
                    ),
                    child: Wrap(
                      spacing: 18.setWidth,
                      runSpacing: 12.setHeight,
                      children: musicItemData.map((musicItem) {
                        return InkWell(
                          onTap: () {
                            MusifyApp.playingMusicNotifier.value = musicItem;
                          },
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width - 16.setWidth * 2 - 18.setWidth) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    musicItem.image,
                                    width: double.infinity,
                                    height: 165.setHeight,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: double.infinity,
                                        height: 140.setHeight,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: Image.asset(
                                            AppAssets.imgMusic1,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5.setHeight),
                                CommonText(
                                  text: musicItem.name,
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                CommonText(
                                  text: musicItem.singer,
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1,
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
                ),
              ),
            ),
          ],
        ),
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
