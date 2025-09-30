import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/app_assets.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/widgets/text/common_text.dart';
import 'package:musify_app_package/widgets/text_field/text_form_field.dart';
import 'package:musify_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../app/my_app.dart';
import '../../home/view/home_all_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  String selectedCategory = "New";

  static List<String> categoryList = [
    "New",
    "Songs",
    "Albums",
    "Podcasts",
    "Playlist",
    "Pop",
    "Rock",
    "Hip Hop",
    "Folk",
    "Romantic",
    "Lo-Fi",
  ];

  final List<MusicItemData> musicItemData = [
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
      image: AppAssets.imgMusic1,
      name: 'Dark Horse',
      singer: 'Ed Sheeran',
    ),
    MusicItemData(
      image: AppAssets.imgMusic2,
      name: 'See You Again',
      singer: 'Justin Bieber',
    ),
    MusicItemData(
      image: AppAssets.imgMusic3,
      name: 'Sugar',
      singer: 'Rihanna',
    ),
    MusicItemData(
      image: AppAssets.imgMusic1,
      name: 'Counting Star  ',
      singer: 'Ed Sheeran',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSearch,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonTextFormField(
                      contentPadding: EdgeInsets.zero,
                      controller: TextEditingController(),
                      hintText: Languages.of(context).txtSearch,
                      fillColor: CustomAppColor.of(context).bgSearchBar,
                      radius: 1000.setHeight,
                      prefixIcon: AppAssets.icSearch,
                      borderColor: CustomAppColor.of(context).transparent,
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
                    child: Wrap(
                      spacing: 8.setWidth,
                      runSpacing: 9.setHeight,
                      children: categoryList
                          .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = e;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selectedCategory == e ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                                    borderRadius: BorderRadius.circular(1000),
                                    border: selectedCategory == e ? Border.all(color: CustomAppColor.of(context).primary) : Border.all(color: CustomAppColor.of(context).txtGray, width: 0.6),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.setWidth,
                                    vertical: 3.setHeight,
                                  ),
                                  child: CommonText(
                                    text: e,
                                    textColor: selectedCategory == e ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtGray,
                                    textAlign: TextAlign.center,
                                    fontSize: 13.setFontSize,
                                    fontWeight: (selectedCategory == e) ? FontWeight.w700 : FontWeight.w400,
                                    fontFamily: Constant.fontFamily,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  _musicList(Languages.of(context).txtPopularMusic, true, musicList: musicItemData1),
                  SizedBox(height: 20.setHeight),
                  _musicList(Languages.of(context).txtViralHits, true, musicList: musicItemData),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _musicList(String title, bool needSeeAll, {required List<MusicItemData> musicList}) {
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
              needSeeAll
                  ? CommonText(
                      text: Languages.of(context).txtViewAll,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Wrap(
              children: musicList.map((item) {
                return InkWell(
                  onTap: () {
                    MusifyApp.playingMusicNotifier.value = item;
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
                            item.image,
                            width: 140.setWidth,
                            height: 140.setHeight,
                            fit: BoxFit.cover,
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
                                    AppAssets.imgMusic1,
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
                        CommonText(
                          text: item.name,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        CommonText(
                          text: item.singer,
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
            )),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
