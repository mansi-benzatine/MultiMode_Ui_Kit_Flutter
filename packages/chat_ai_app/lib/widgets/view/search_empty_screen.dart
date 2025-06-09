import 'package:flutter/material.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../utils/app_color.dart';
import '../text/common_text.dart';

class SearchEmptyScreen extends StatelessWidget {
  const SearchEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.imgSearchEmpty,
            height: 105.setHeight,
            width: 165.setWidth,
            gaplessPlayback: true,
          ),
          SizedBox(height: 20.setHeight),
          CommonText(
            text: "Search Not Found",
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: "You have search not found yet.Please come back later.",
            fontWeight: FontWeight.w500,
            fontSize: 16.setFontSize,
            textColor: CustomAppColor.of(context).txtGray,
            height: 1.2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
