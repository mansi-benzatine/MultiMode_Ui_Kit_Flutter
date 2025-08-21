import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/constant.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../model/your_goals_data_model.dart';

class YourGoalsPage extends StatefulWidget {
  const YourGoalsPage({super.key});

  @override
  State<YourGoalsPage> createState() => _YourGoalsPageState();
}

class _YourGoalsPageState extends State<YourGoalsPage> {
  ValueNotifier<List<YourGoalsDataModel>> goals = ValueNotifier([]);

  _fillGoals() {
    goals.value = [
      YourGoalsDataModel(title: Languages.of(context).txtWeightLoss, image: AppAssets.imgWeightLoss),
      YourGoalsDataModel(title: Languages.of(context).txtImproveHealth, image: AppAssets.imgImproveHealth),
      YourGoalsDataModel(title: Languages.of(context).txtBetterSleep, image: AppAssets.imgBetterSleep),
      YourGoalsDataModel(title: Languages.of(context).txtRelieveStress, image: AppAssets.imgRelieveStress),
      YourGoalsDataModel(title: Languages.of(context).txtControlBloodPresure, image: AppAssets.imgControlBloodPresure),
      YourGoalsDataModel(title: Languages.of(context).txtBodyBuliding, image: AppAssets.imgBodyBuilding),
      YourGoalsDataModel(title: Languages.of(context).txtPostureCorrection, image: AppAssets.imgPostureCorrection),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillGoals();
    return ValueListenableBuilder(
      valueListenable: goals,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.length,
          padding: EdgeInsets.only(
            left: 20.setWidth,
            right: 20.setWidth,
            top: 30.setHeight,
            bottom: 30.setHeight,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                value[index].isSelected = !value[index].isSelected;
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                goals.notifyListeners();
              },
              child: Container(
                width: 0.screenWidth,
                decoration: BoxDecoration(
                  color: value[index].isSelected ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: value[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                    width: value[index].isSelected ? 2 : 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                margin: EdgeInsets.only(bottom: 10.setHeight),
                child: Row(
                  children: [
                    Image.asset(
                      value[index].isSelected ? AppAssets.icRadioSelected : AppAssets.icRadioUnSelected,
                      width: 20.setHeight,
                      height: 20.setHeight,
                      fit: BoxFit.contain,
                      color: value[index].isSelected ? null : CustomAppColor.of(context).txtDarkGray,
                    ),
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: CommonText(
                        text: value[index].title,
                        fontSize: 16.setFontSize,
                        fontWeight: value[index].isSelected ? FontWeight.w600 : FontWeight.w400,
                        fontFamily: value[index].isSelected ? Constant.fontFamilySemiBold600 : Constant.fontFamilyRegular400,
                        textAlign: TextAlign.start,
                        textColor: value[index].isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtDarkGray,
                      ),
                    ),
                    Image.asset(
                      value[index].image,
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
