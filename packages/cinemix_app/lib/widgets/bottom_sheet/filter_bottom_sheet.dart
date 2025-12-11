import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../ui/search/datamodel/search_data.dart';

class SortFilterBottomSheet extends StatefulWidget {
  const SortFilterBottomSheet({super.key});

  @override
  State<SortFilterBottomSheet> createState() => _SortFilterBottomSheetState();
}

class _SortFilterBottomSheetState extends State<SortFilterBottomSheet> {
  FilterOptions filter = FilterOptions();

  final types = ["Movie", "Tv", "Sport", "Series"];
  final genres = ["All", "Action", "Romance", "Horror", "Comedy"];
  final ratings = ["All", "9 & Up", "8 & Up", "7 & Up", "6 & Up"];
  final sortOptions = ["All", "Popular", "New Release"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgTextFormFieldShadow,
              CustomAppColor.of(context).bgShadowDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20.setWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20.setHeight),
              Center(
                child: CommonText(
                  text: "Sort & Filter",
                  fontSize: 20.setFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
              ),
              SizedBox(height: 10.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: types.map((t) {
                    final selected = filter.type == t;
                    return _chip(
                      title: t,
                      selected: selected,
                      onTap: () => setState(() => filter.type = t),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.setHeight),
              _dropdown(
                "Country",
                filter.country,
                ["India", "USA", "UK"],
                (v) => setState(() => filter.country = v),
              ),
              SizedBox(height: 16.setHeight),
              _dropdown(
                "Time Period",
                filter.year,
                ["2024", "2023", "2022", "2021"],
                (v) => setState(() => filter.year = v),
              ),
              SizedBox(height: 20.setHeight),
              CommonText(
                text: "Genre",
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyClashGroteskMedium500,
              ),
              SizedBox(height: 10.setHeight),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10,
                  children: genres.map((g) {
                    return _chip(
                      title: g,
                      selected: filter.genre == g,
                      onTap: () => setState(() => filter.genre = g),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.setHeight),
              CommonText(
                text: "Rating",
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyClashGroteskMedium500,
              ),
              SizedBox(height: 10.setHeight),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10,
                  children: ratings.map((r) {
                    return _chip(
                      title: r,
                      selected: filter.rating == r,
                      onTap: () => setState(() => filter.rating = r),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.setHeight),
              CommonText(
                text: "Sort",
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyClashGroteskMedium500,
              ),
              SizedBox(height: 10.setHeight),
              Wrap(
                spacing: 10,
                children: sortOptions.map((s) {
                  return _chip(
                    title: s,
                    selected: filter.sort == s,
                    onTap: () => setState(() => filter.sort = s),
                  );
                }).toList(),
              ),
              SizedBox(height: 30.setHeight),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "Skip",
                      height: 44.setHeight,
                      buttonTextColor: CustomAppColor.of(context).txtBlack,
                      buttonColor: CustomAppColor.of(context).btnGrey,
                      borderColor: CustomAppColor.of(context).btnGrey,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: CommonButton(
                      height: 44.setHeight,
                      text: "Continue",
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdown(String title, String value, List<String> items, Function(String) onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 16.setFontSize,
          fontFamily: Constant.fontFamilyClashGroteskMedium500,
        ),
        SizedBox(height: 6.setHeight),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                CustomAppColor.of(context).bgTextFormFieldShadow,
                CustomAppColor.of(context).bgTextFormFieldShadowLight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            items: items
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: CommonText(
                      text: c,
                      fontFamily: Constant.fontFamilyClashGroteskMedium500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                )
                .toList(),
            onChanged: (v) => onChange(v!),
          ),
        ),
      ],
    );
  }

  Widget _chip({required String title, required bool selected, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 9.setHeight),
        decoration: BoxDecoration(
          color: selected ? Colors.pinkAccent : null,
          borderRadius: BorderRadius.circular(20),
          gradient: selected
              ? null
              : LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgSelectedShadow,
                    CustomAppColor.of(context).bgSelectedShadowDark,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: CommonText(
          text: title,
          textColor: selected ? Colors.white : CustomAppColor.of(context).txtBlack,
          fontSize: 12.setFontSize,
          fontFamily: Constant.fontFamilyClashDisplayMedium500,
        ),
      ),
    );
  }
}
