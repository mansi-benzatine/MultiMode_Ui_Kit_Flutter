import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
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
  List<String> searchedString = ["Bitcoin", "Zcash", "ETH"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtSearch,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20.setWidth),
                child: Column(
                  children: [
                    CommonTextFormField(
                      controller: TextEditingController(),
                      hintText: Languages.of(context).txtSearchdot,
                      prefixIcon: AppAssets.icSearch,
                      fillColor: CustomAppColor.of(context).transparent,
                    ),
                    SizedBox(height: 25.setHeight),
                    _recentSearch(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentSearch() {
    return Column(
      children: [
        Row(
          children: [
            CommonText(
              text: Languages.of(context).txtRecent,
              fontSize: 18.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            const Spacer(),
            CommonText(
              text: Languages.of(context).txtClearAll,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtRed,
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        ...List.generate(
          searchedString.length,
          (index) {
            final string = searchedString[index];
            return _recentSearchItem(string);
          },
        ),
        // _emptySearch(),
      ],
    );
  }

  Widget _recentSearchItem(String name) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.setHeight),
      child: Row(
        children: [
          CommonText(
            text: name,
            fontSize: 15.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          const Spacer(),
          Icon(
            Icons.close,
            color: CustomAppColor.of(context).txtBlack,
          ),
        ],
      ),
    );
  }

  /* _emptySearch() {
    return SizedBox(
      height: 0.screenHeight * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgSearchEmpty,
              height: 216.setHeight,
              width: 216.setWidth,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFound,
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFoundSub,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGray,
            ),
          ],
        ),
      ),
    );
  }*/

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
