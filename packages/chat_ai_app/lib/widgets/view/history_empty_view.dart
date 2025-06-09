import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../utils/app_color.dart';
import '../text/common_text.dart';

class HistoryEmptyView extends StatelessWidget {
  const HistoryEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgEmptyHistory,
          height: 105.setHeight,
          width: 165.setWidth,
          gaplessPlayback: true,
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtEmptyChatHistory,
          fontWeight: FontWeight.w800,
          fontSize: 24.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtEmptyChatHistoryDesc,
          fontWeight: FontWeight.w500,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtGray,
          height: 1.2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
