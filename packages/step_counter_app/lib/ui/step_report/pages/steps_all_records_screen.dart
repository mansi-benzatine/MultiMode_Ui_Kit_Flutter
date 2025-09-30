import 'package:flutter/material.dart';
import 'package:step_counter_app_package/localization/language/languages.dart';
import 'package:step_counter_app_package/ui/step_report/pages/step_result_screen.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/constant.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class StepsAllRecordsScreen extends StatefulWidget {
  const StepsAllRecordsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const StepsAllRecordsScreen());
  }

  @override
  State<StepsAllRecordsScreen> createState() => _StepsAllRecordsScreenState();
}

class _StepsAllRecordsScreenState extends State<StepsAllRecordsScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSeeAllRecords,
            textAlign: Alignment.centerLeft,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: CustomAppColor.of(context).bgContainerColorSteps),
              ),
              margin: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.bottomPadding),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerColorSteps,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.icSteps,
                          width: 24.setWidth,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).colorSteps,
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonText(
                            text: "06-April-2022",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).colorSteps,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CommonText(
                          text: "2699",
                          fontSize: 20.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).colorSteps,
                          textAlign: TextAlign.end,
                          height: 1,
                        ),
                        SizedBox(width: 5.setWidth),
                        Container(
                          margin: EdgeInsets.only(top: 3.setHeight),
                          child: CommonText(
                            text: Languages.of(context).txtSteps.toUpperCase(),
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).colorSteps,
                            textAlign: TextAlign.end,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: CustomAppColor.of(context).bgContainerColorSteps,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 60,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, StepResultScreen.route());
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CommonText(
                                        text: "1569 Step",
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
                                  color: CustomAppColor.of(context).bgContainerColorSteps,
                                  thickness: 2,
                                ),
                              ],
                            ],
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
