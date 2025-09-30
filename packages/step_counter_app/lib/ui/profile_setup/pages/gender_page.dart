import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final ValueNotifier<String> gender = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    gender.value = Languages.of(context).txtMale;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 165.setHeight,
              width: 165.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerLightAndDark,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(30.setWidth),
              child: Image.asset(AppAssets.icSetupProfileGender),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourGender.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.setHeight),
            ValueListenableBuilder(
              valueListenable: gender,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    gender.value = Languages.of(context).txtMale;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: (value == Languages.of(context).txtMale)
                            ? CustomAppColor.of(context).primary
                            : CustomAppColor.of(context).borderColorDark,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 8.setHeight),
                    child: Row(
                      children: [
                        Container(
                          height: 38.setHeight,
                          width: 38.setHeight,
                          decoration: BoxDecoration(
                            color: (value == Languages.of(context).txtMale)
                                ? CustomAppColor.of(context).primary
                                : CustomAppColor.of(context).lightBlueColor,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(
                              color: (value == Languages.of(context).txtMale)
                                  ? CustomAppColor.of(context).primary
                                  : CustomAppColor.of(context).lightBlueColor,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(5.setWidth),
                          child: Image.asset(
                            AppAssets.icMan,
                            color: (value == Languages.of(context).txtMale) ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonText(
                            text: Languages.of(context).txtMale,
                            fontSize: 17.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        if (value == Languages.of(context).txtMale)
                          Image.asset(
                            AppAssets.icCheckRound,
                            height: 20.setHeight,
                            width: 20.setHeight,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.setHeight),
            ValueListenableBuilder(
              valueListenable: gender,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    gender.value = Languages.of(context).txtFemale;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: (value == Languages.of(context).txtFemale)
                            ? CustomAppColor.of(context).primary
                            : CustomAppColor.of(context).borderColorDark,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 8.setHeight),
                    child: Row(
                      children: [
                        Container(
                          height: 38.setHeight,
                          width: 38.setHeight,
                          decoration: BoxDecoration(
                            color: (value == Languages.of(context).txtFemale)
                                ? CustomAppColor.of(context).primary
                                : CustomAppColor.of(context).lightBlueColor,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(
                              color: (value == Languages.of(context).txtFemale)
                                  ? CustomAppColor.of(context).primary
                                  : CustomAppColor.of(context).lightBlueColor,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(5.setWidth),
                          child: Image.asset(
                            AppAssets.icWomen,
                            color: (value == Languages.of(context).txtFemale) ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonText(
                            text: Languages.of(context).txtFemale,
                            fontSize: 17.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        if (value == Languages.of(context).txtFemale)
                          Image.asset(
                            AppAssets.icCheckRound,
                            height: 20.setHeight,
                            width: 20.setHeight,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
