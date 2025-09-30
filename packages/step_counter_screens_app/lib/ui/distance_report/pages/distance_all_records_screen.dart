import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/distance_report/pages/distance_result_screen.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/constant.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class DistanceAllRecordsScreen extends StatefulWidget {
  const DistanceAllRecordsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const DistanceAllRecordsScreen());
  }

  @override
  State<DistanceAllRecordsScreen> createState() => _DistanceAllRecordsScreenState();
}

class _DistanceAllRecordsScreenState extends State<DistanceAllRecordsScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSeeAllRecords.toUpperCase(),
            textAlign: Alignment.centerLeft,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CustomAppColor.of(context).borderColor),
              ),
              margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.bottomPadding),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerColorDistance,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.icDistance,
                          width: 24.setWidth,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).colorDistance,
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonText(
                            text: "06-April-2022",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).colorDistance,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CommonText(
                          text: "11:35",
                          fontSize: 20.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).colorDistance,
                          textAlign: TextAlign.end,
                          height: 1,
                        ),
                        SizedBox(width: 5.setWidth),
                        Container(
                          margin: EdgeInsets.only(top: 3.setHeight),
                          child: CommonText(
                            text: Languages.of(context).txtKm.toUpperCase(),
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).colorDistance,
                            textAlign: TextAlign.end,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: CustomAppColor.of(context).borderColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 60,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, DistanceResultScreen.route());
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CommonText(
                                          text: "1569 Km",
                                          fontSize: 18.setFontSize,
                                          fontWeight: FontWeight.w600,
                                          textColor: CustomAppColor.of(context).txtBlack,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      CommonText(
                                        text: "11:35 PM",
                                        fontSize: 14.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        textColor: CustomAppColor.of(context).txtDarkGray,
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                                if (index != 59) ...[
                                  Divider(
                                    height: 10.setHeight,
                                    color: CustomAppColor.of(context).borderColor,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String title, {bool value = false}) {
    if (title == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
