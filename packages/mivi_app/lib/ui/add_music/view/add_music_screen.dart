import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/text_field/text_form_field.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

import '../datamodel/add_music_data.dart';

class AddMusicScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddMusicScreen());
  }

  const AddMusicScreen({super.key});

  @override
  State<AddMusicScreen> createState() => _AddMusicScreenState();
}

class _AddMusicScreenState extends State<AddMusicScreen> implements TopBarClickListener {
  List<MusicModel> musicList = [
    MusicModel(
      title: "Moment",
      artist: "Yael Naim",
      image: AppAssets.imgMusic1,
    ),
    MusicModel(
      title: "Dream",
      artist: "Zara Sky",
      image: AppAssets.imgMusic3,
    ),
    MusicModel(
      title: "Sunset",
      artist: "Ethan Gray",
      image: AppAssets.imgMusic2,
    ),
    MusicModel(
      title: "Ocean Eyes",
      artist: "Billie Ray",
      image: AppAssets.imgMusic4,
    ),
    MusicModel(
      title: "Breeze",
      artist: "Nina Cloud",
      image: AppAssets.imgMusic1,
    ),
    MusicModel(
      title: "Moment",
      artist: "Yael Naim",
      image: AppAssets.imgMusic2,
    ),
    MusicModel(
      title: "Dream",
      artist: "Zara Sky",
      image: AppAssets.imgMusic3,
    ),
    MusicModel(
      title: "Sunset",
      artist: "Ethan Gray",
      image: AppAssets.imgMusic4,
    ),
    MusicModel(
      title: "Ocean Eyes",
      artist: "Billie Ray",
      image: AppAssets.imgMusic2,
    ),
    MusicModel(
      title: "Breeze",
      artist: "Nina Cloud",
      image: AppAssets.imgMusic1,
    ),
  ];

  String selectedTab = "All";
  final List<String> tabs = ["All", "Trending", "Pop", "Mood", "R&B"];
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMusic,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextFormFieldWithPrefix(
                    controller: searchController,
                    hintText: "Search...",
                    prefixIcon: AppAssets.icSearch,
                  ),
                  SizedBox(height: 12.setHeight),
                  _categoryButtons(),
                  SizedBox(height: 16.setHeight),
                  _tabBar(),
                  Expanded(child: _musicListView()),
                  SizedBox(height: 45.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _categoryItem(AppAssets.icITune, "iTunes", Colors.purple.shade100),
        _categoryItem(AppAssets.icImport, "Import", Colors.orange.shade100),
        _categoryItem(AppAssets.icFavorite, "Favorites", Colors.teal.shade100),
      ],
    );
  }

  Widget _categoryItem(String icon, String label, Color color) {
    return Container(
      width: 0.screenWidth / 3.8,
      padding: EdgeInsets.symmetric(vertical: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).socialMediaCard,
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            offset: const Offset(1, 1),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(
            icon,
            height: 18.setHeight,
            width: 18.setWidth,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: label,
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMedium500,
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = tab == selectedTab;
          return GestureDetector(
            onTap: () => setState(() => selectedTab = tab),
            child: Padding(
              padding: EdgeInsets.only(right: 26.setWidth),
              child: Column(
                children: [
                  CommonText(
                    text: tab,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
                  ),
                  if (isSelected)
                    Container(
                      margin: EdgeInsets.only(top: 4.setHeight),
                      height: 2,
                      width: 20,
                      color: CustomAppColor.of(context).secondary,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _musicListView() {
    return ListView.builder(
      itemCount: musicList.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final song = musicList[index];
        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(song.image, width: 50, height: 50, fit: BoxFit.cover),
          ),
          title: CommonText(
            text: song.title,
            fontFamily: Constant.fontFamilySemiBold600,
            textAlign: TextAlign.start,
          ),
          subtitle: CommonText(
            text: song.artist,
            textColor: CustomAppColor.of(context).txtLightGrey,
            fontFamily: Constant.fontFamilyMedium500,
            fontSize: 12.setFontSize,
            textAlign: TextAlign.start,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  song.isFavorite ? Icons.favorite_outline_rounded : Icons.favorite_border,
                  color: song.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    song.isFavorite = !song.isFavorite;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (var s in musicList) {
                      s.isPlaying = false;
                    }
                    song.isPlaying = !song.isPlaying;
                  });
                },
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    song.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black87,
                  ),
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
  }
}
