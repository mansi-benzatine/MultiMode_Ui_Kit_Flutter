import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class SearchScreen extends StatefulWidget {
  final bool isForEmptyScreen;

  static Route<void> route({bool isForEmptyScreen = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(isForEmptyScreen: isForEmptyScreen),
    );
  }

  const SearchScreen({super.key, this.isForEmptyScreen = false});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  List<String> searchedString = ["Spotify", "Reliance", "TCS"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
              ? null
              : DecorationImage(
                  image: AssetImage(AppAssets.imgCommonBackground),
                  fit: BoxFit.fill,
                ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtSearch,
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 20.setWidth),
                  child: widget.isForEmptyScreen
                      ? _emptySearch()
                      : Column(
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
              fontFamily: Constant.fontFamilyMedium,
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
        )

        ///_emptySearch(),
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
            fontWeight: FontWeight.w400,
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

  _emptySearch() {
    return SizedBox(
      height: 0.screenHeight * 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgSearchEmpty,
              height: 120.setHeight,
              width: 120.setWidth,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFound,
              fontSize: 22.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: "You Have Search Not Found Yet.\nPlease Come Back Later.",
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtBlack,
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
  }
}
