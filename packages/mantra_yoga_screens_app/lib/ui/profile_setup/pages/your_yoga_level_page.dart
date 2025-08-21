import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../model/your_yoga_level_data_model.dart';

class YourYogaLevelPage extends StatefulWidget {
  const YourYogaLevelPage({super.key});

  @override
  State<YourYogaLevelPage> createState() => _YourYogaLevelPageState();
}

class _YourYogaLevelPageState extends State<YourYogaLevelPage> {
  List<YourYogaLevelDataModel> goals = [];
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  _fillGoals() {
    goals = [
      YourYogaLevelDataModel(title: Languages.of(context).txtBeginner, image: AppAssets.imgBeginners),
      YourYogaLevelDataModel(title: Languages.of(context).txtIntermediate, image: AppAssets.imgIntemediate),
      YourYogaLevelDataModel(title: Languages.of(context).txtExpert, image: AppAssets.imgExpert),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillGoals();
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: goals.length,
          padding: EdgeInsets.only(
            left: 20.setWidth,
            right: 20.setWidth,
            top: 30.setHeight,
            bottom: 30.setHeight,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex.value = index;
              },
              child: Container(
                width: 0.screenWidth,
                decoration: BoxDecoration(
                  color: value == index ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                    width: value == index ? 2 : 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                margin: EdgeInsets.only(bottom: 10.setHeight),
                child: Row(
                  children: [
                    Image.asset(
                      value == index ? AppAssets.icRadioSelected : AppAssets.icRadioUnSelected,
                      width: 20.setHeight,
                      height: 20.setHeight,
                      fit: BoxFit.contain,
                      color: value == index ? null : CustomAppColor.of(context).txtDarkGray,
                    ),
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: CommonText(
                        text: goals[index].title,
                        fontSize: 16.setFontSize,
                        fontWeight: value == index ? FontWeight.w600 : FontWeight.w400,
                        fontFamily: value == index ? Constant.fontFamilySemiBold600 : Constant.fontFamilyRegular400,
                        textAlign: TextAlign.start,
                        textColor: value == index ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtDarkGray,
                      ),
                    ),
                    Image.asset(
                      goals[index].image,
                      width: 40.setHeight,
                      height: 40.setHeight,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
