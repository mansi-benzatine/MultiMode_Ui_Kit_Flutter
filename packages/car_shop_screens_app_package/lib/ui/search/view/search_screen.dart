import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class SearchScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SearchScreen());
  }

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  final TextEditingController _searchController = TextEditingController();
  List<String> _recentSearchList = [];

  @override
  void initState() {
    super.initState();
    _recentSearchList = [
      "Marcedes",
      "Toyota SUV",
      "Toyota RAV4",
      "Tesla",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtSearch, isShowBack: true),
            SizedBox(height: 10.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonTextFormFieldWithPrefixAndSuffix(
                controller: _searchController,
                prefixIcon: AppAssets.icSearch,
                hintText: Languages.of(context).txtSearch,
                suffixIcon: AppAssets.icClose,
                fillColor: CustomAppColor.of(context).bgSearchBar,
                hintTextColor: CustomAppColor.of(context).txtDarkGray,
                prefixIconColor: CustomAppColor.of(context).txtDarkGray,
                suffixIconColor: CustomAppColor.of(context).txtDarkGray,
                borderColor: CustomAppColor.of(context).transparent,
                contentPadding: EdgeInsets.only(
                  right: 15.setWidth,
                  left: 25.setWidth,
                ),
                radius: 1000,
                onSuffixClick: () {
                  setState(() {
                    _searchController.clear();
                  });
                },
              ),
            ),
            SizedBox(height: 10.setHeight),
            _recentSearch()
          ],
        ),
      ),
    );
  }

  Widget _recentSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              CommonText(
                text: Languages.of(context).txtRecentSearch,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              const Spacer(),
              CommonText(
                text: Languages.of(context).txtClearAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).primary,
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          ListView.builder(
            itemCount: _recentSearchList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 10.setHeight),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonText(
                        text: _recentSearchList[index],
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        letterSpacing: 0.2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Icon(
                      Icons.close,
                      size: 16.setFontSize,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
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
