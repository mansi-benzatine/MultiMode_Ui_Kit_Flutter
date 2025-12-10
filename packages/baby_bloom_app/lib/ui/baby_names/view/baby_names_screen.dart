import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/baby_names/datamodel/baby_name_data.dart';
import 'package:baby_bloom_app/ui/favourite/view/favourite_screen.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class BabyNamesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const BabyNamesScreen());
  }

  const BabyNamesScreen({super.key});

  @override
  State<BabyNamesScreen> createState() => _BabyNamesScreenState();
}

class _BabyNamesScreenState extends State<BabyNamesScreen> implements TopBarClickListener {
  int selectedIndex = -1;
  bool isSelectedIndex = false;
  final TextEditingController nameController = TextEditingController();
  List<BabyNameData> babyNameList = [];
  List<BabyNameData> filteredList = [];

  void fillData() {
    babyNameList = [
      BabyNameData(
        name: "Aena",
        gender: "Female",
        meaning: "A beautiful, shining,pure mirror",
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
      ),
      BabyNameData(
        name: "Aurelia",
        gender: "Female",
        meaning: "A beautiful, eternal,unfading,pure mirror",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
    filteredList = List.from(babyNameList);
    nameController.addListener(_filterNames);
  }

  void _filterNames() {
    final query = nameController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(babyNameList);
      } else {
        filteredList = babyNameList.where((e) => e.name.toLowerCase().contains(query)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtBabyNames,
            isShowBack: true,
            isShowFavourite: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  selectBabyOptionsView(),
                  SizedBox(height: 20.setHeight),
                  searchFieldView(),
                  SizedBox(height: 20.setHeight),
                  babyNameListView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOption({
    required int index,
    required String image,
    required String name,
    double? imageHeight,
    double? imageWidth,
  }) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              if (isSelected)
                Container(
                  height: 95.setHeight,
                  width: 95.setWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).secondary.withValues(alpha: 0.2),
                    border: Border.all(
                      color: CustomAppColor.of(context).secondary,
                      width: 2,
                    ),
                  ),
                ),
              Image.asset(
                image,
                height: imageHeight ?? 95.setHeight,
                width: imageWidth ?? 95.setWidth,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(height: imageHeight != null ? 0.setHeight : 12.setHeight),
          CommonText(
            text: name,
            fontFamily: Constant.fontFamilyMedium500,
            textColor: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
          )
        ],
      ),
    );
  }

  Widget selectBabyOptionsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOption(
            index: 0,
            image: AppAssets.icBoy,
            name: "Boy",
          ),
          _buildOption(
            index: 1,
            image: AppAssets.icGirl,
            name: "Girl",
          ),
          _buildOption(
            index: 2,
            image: AppAssets.icBoth,
            imageHeight: 107.setHeight,
            imageWidth: 107.setWidth,
            name: "Both",
          ),
        ],
      ),
    );
  }

  Widget searchFieldView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: [
          CommonTextFormField(
            controller: nameController,
            titleText: Languages.of(context).txtNameStartWith,
            radius: 50,
            hintText: Languages.of(context).txtTypeStartingLetterHere,
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(text: Languages.of(context).txtFindAName)
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
          CommonText(
            text: filteredList.isEmpty ? "No Result Found" : "Showing ${filteredList.length} results",
            fontFamily: Constant.fontFamilySemiBold600,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 15.setHeight),
            itemCount: filteredList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = filteredList[index];
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
    if (name == Constant.strFavourite) {
      Navigator.push(context, FavouriteScreen.route());
    }
  }
}
