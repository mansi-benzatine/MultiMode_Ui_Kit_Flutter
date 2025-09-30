import 'package:flutter/material.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/text/common_text.dart';

import '../../../utils/app_color.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  String? selectedCountry = "America";
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> countries = [
    {"name": "America", "flag": "🇺🇸"},
    {"name": "England", "flag": "🇬🇧"},
    {"name": "India", "flag": "🇮🇳"},
    {"name": "China", "flag": "🇨🇳"},
    {"name": "Japan", "flag": "🇯🇵"},
    {"name": "France", "flag": "🇫🇷"},
    {"name": "Canada", "flag": "🇨🇦"},
    {"name": "Italy", "flag": "🇮🇹"},
    {"name": "Indonesia", "flag": "🇮🇩"},
    {"name": "Germany", "flag": "🇩🇪"},
    {"name": "South Africa", "flag": "🇿🇦"},
    {"name": "Viet Nam", "flag": "🇻🇳"},
    {"name": "Peru", "flag": "🇵🇪"},
    {"name": "Sri Lanka", "flag": "🇱🇰"},
    {"name": "Iceland", "flag": "🇮🇸"},
    {"name": "Switzerland", "flag": "🇨🇭"},
  ];

  List<Map<String, String>> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          // Title
          CommonText(
            text: Languages.of(context).txtSelectYourCountry,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 10.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtLoremIpsumShort,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDescriptionGray,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 28.setHeight),

          // Search bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.setWidth,
              vertical: 12.setHeight,
            ),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgCard,
              borderRadius: BorderRadius.circular(25.setWidth),
              border: Border.all(
                color: CustomAppColor.of(context).primary,
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icSearch,
                  height: 18.setHeight,
                  width: 18.setWidth,
                  color: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: CustomAppColor.of(context).txtGray,
                        fontSize: 14.setFontSize,
                        package: "stoxy_app_package",
                        fontFamily: Constant.fontFamily,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchController.text = value;
                        filteredCountries = countries.where((country) => country['name']!.toLowerCase().contains(value.toLowerCase())).toList();
                      });
                    },
                    style: TextStyle(
                      color: CustomAppColor.of(context).txtBlack,
                      fontSize: 14.setFontSize,
                      package: "stoxy_app_package",
                      fontFamily: Constant.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.setHeight),

          // Countries list
          ListView.separated(
            itemCount: filteredCountries.length,
            separatorBuilder: (context, index) => SizedBox(height: 8.setHeight),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final country = filteredCountries[index];
              final isSelected = selectedCountry == country['name'];

              return buildCountryItem(
                context,
                country['name']!,
                country['flag']!,
                isSelected,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCountryItem(BuildContext context, String countryName, String flag, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCountry = countryName;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 2.setHeight),
        child: Row(
          children: [
            // Flag
            CommonText(
              text: flag,
              fontSize: 22.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),

            SizedBox(width: 16.setWidth),

            // Country name
            Expanded(
              child: CommonText(
                text: countryName,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w500,
                fontFamily: Constant.fontFamilyMedium,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),

            // Radio button
            Container(
              width: 20.setWidth,
              height: 20.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.setWidth,
                        height: 10.setHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).primary,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
