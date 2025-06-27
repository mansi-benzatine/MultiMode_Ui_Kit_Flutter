import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';

class ReportUserScreen extends StatefulWidget {
  const ReportUserScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReportUserScreen());
  }

  @override
  State<ReportUserScreen> createState() => _ReportUserScreenState();
}

class _ReportUserScreenState extends State<ReportUserScreen> implements TopBarClickListener {
  final List<String> reportOptions = [
    'Harassments',
    'Inappropriate Content',
    'Violation Of Terms',
    'Offensive Language',
    'Disrespectful Behavior',
    'Threats',
    'Catfishing',
    'Unwanted Advances',
    'Unsolicited Explicit Content',
    'Privacy Concerns',
    'Other',
  ];

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: "Report Rose",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 16.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtWhyDidYouReportThisUser,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                    ),
                    SizedBox(height: 5.setHeight),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reportOptions.length,
                        itemBuilder: (context, index) {
                          final option = reportOptions[index];
                          final isSelected = selectedOption == option;

                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedOption = option;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6.setHeight),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CommonText(
                                      text: option,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.setFontSize,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Container(
                                    width: 25.setWidth,
                                    height: 25.setHeight,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).textFormFieldBorder,
                                        width: 1,
                                      ),
                                      color: isSelected ? CustomAppColor.of(context).txtPink : Colors.transparent,
                                    ),
                                    child: isSelected ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
                                  )
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtCancel.toUpperCase(),
                      buttonColor: CustomAppColor.of(context).passionContainerBg,
                      onTap: () => Navigator.pop(context),
                      buttonTextColor: CustomAppColor.of(context).txtVelvet,
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtReport.toUpperCase(),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
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
