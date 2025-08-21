import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/app_assets.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class YourGenderPage extends StatefulWidget {
  const YourGenderPage({super.key});

  @override
  State<YourGenderPage> createState() => _YourGenderPageState();
}

class _YourGenderPageState extends State<YourGenderPage> {
  final ValueNotifier<int> selectedGender = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 90.setHeight),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              splashColor: CustomAppColor.of(context).transparent,
              highlightColor: CustomAppColor.of(context).transparent,
              onTap: () {
                selectedGender.value = 0;
              },
              child: Column(
                children: [
                  Expanded(child: Image.asset(AppAssets.imgMan)),
                  SizedBox(height: 30.setHeight),
                  ValueListenableBuilder(
                    valueListenable: selectedGender,
                    builder: (context, value, child) {
                      return Container(
                        width: 100.setWidth,
                        height: 40.setHeight,
                        decoration: BoxDecoration(
                          color: value == 0 ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: value == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray),
                        ),
                        alignment: Alignment.center,
                        child: CommonText(
                          text: Languages.of(context).txtMale,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: value == 0 ? CustomAppColor.of(context).txtBlackAndPrimary : CustomAppColor.of(context).txtLightGray,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20.setWidth),
          Expanded(
            child: InkWell(
              splashColor: CustomAppColor.of(context).transparent,
              highlightColor: CustomAppColor.of(context).transparent,
              onTap: () {
                selectedGender.value = 1;
              },
              child: Column(
                children: [
                  Expanded(child: Image.asset(AppAssets.imgWoman)),
                  SizedBox(height: 30.setHeight),
                  ValueListenableBuilder(
                    valueListenable: selectedGender,
                    builder: (context, value, child) {
                      return Container(
                        width: 100.setWidth,
                        height: 40.setHeight,
                        decoration: BoxDecoration(
                          color: value == 1 ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: value == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray),
                        ),
                        alignment: Alignment.center,
                        child: CommonText(
                          text: Languages.of(context).txtFemale,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: value == 1 ? CustomAppColor.of(context).txtBlackAndPrimary : CustomAppColor.of(context).txtLightGray,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
