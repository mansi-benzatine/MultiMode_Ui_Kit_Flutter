import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/home/view/home_all_page.dart';
import 'package:musify_app_package/ui/home/view/home_songs_page.dart';
import 'package:musify_app_package/ui/notification/view/notification_screen.dart';
import 'package:musify_app_package/ui/search/view/search_screen.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import 'home_podcast_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = [
    "All",
    "Songs",
    "Podcasts",
  ];

  @override
  initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackgroundPlain),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _topBar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    HomeAllPage(),
                    HomeSongsPage(),
                    HomePodcastPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.setWidth),
              child: Image.asset(
                AppAssets.icSearch,
                width: 22.setWidth,
                height: 22.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.setWidth),
              child: Image.asset(
                AppAssets.icNotification,
                width: 22.setWidth,
                height: 22.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
        ],
      ),
    );
  }
}
