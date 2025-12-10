import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/baby_names/datamodel/baby_name_data.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FavouriteScreen());
  }

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> implements TopBarClickListener {
  List<BabyNameData> babyNameList = [];

  void fillData() {
    babyNameList = [
      BabyNameData(
        name: "Aena",
        gender: "Female",
        meaning: "A beautiful, shining,pure mirror",
        isFavourite: true,
      ),
      BabyNameData(
        name: "Amara",
        gender: "Female",
        meaning: "A beautiful, eternal,unfading",
        isFavourite: true,
      ),
      BabyNameData(
        name: "Alaric",
        gender: "Male",
        meaning: "A beautiful, shining, pure mirror",
        isFavourite: true,
      ),
      BabyNameData(
        name: "Alina",
        gender: "Female",
        meaning: "A beautiful, eternal,unfading",
        isFavourite: true,
      ),
      BabyNameData(
        name: "Aurelia",
        gender: "Female",
        meaning: "A beautiful, eternal,unfading,pure mirror",
        isFavourite: true,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtFavoriteNames,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  babyNameListView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget babyNameListView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: babyNameList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = babyNameList[index];
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item.gender == "Female" ? AppAssets.icFemale : AppAssets.icMale,
                              height: 20.setHeight,
                              width: 20.setWidth,
                            ),
                            SizedBox(width: 5.setWidth),
                            CommonText(
                              text: item.name,
                              fontSize: 15.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.setHeight),
                        CommonText(
                          text: item.meaning,
                          fontSize: 12.setFontSize,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        item.isFavourite = !item.isFavourite;
                        babyNameList.removeWhere((e) => e.name == item.name);
                      });
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                      child: Image.asset(
                        item.isFavourite ? AppAssets.icFilledHeart : AppAssets.icHeart,
                        key: ValueKey(item.isFavourite),
                        height: 22.setHeight,
                        width: 22.setWidth,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: CustomAppColor.of(context).border,
                height: 25.setHeight,
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
  }
}
