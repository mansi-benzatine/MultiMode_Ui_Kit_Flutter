import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class YourPeriodLengthPage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourPeriodLengthPage());
  }

  const YourPeriodLengthPage({super.key});

  @override
  State<YourPeriodLengthPage> createState() => _YourPeriodLengthPageState();
}

class _YourPeriodLengthPageState extends State<YourPeriodLengthPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 25.setWidth,
        right: 25.setWidth,
        top: 30.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtLengthOfYourPeriod,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourUsualPeriodLengthToImproveRemindersAndWellnessGuidance,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 0.screenWidth / 3),
              Expanded(
                child: SizedBox(
                    height: 400.setHeight,
                    width: 20.setWidth,
                    child: CupertinoPicker(
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: CustomAppColor.of(context).horizontalBorder),
                            bottom: BorderSide(color: CustomAppColor.of(context).horizontalBorder),
                          ),
                        ),
                      ),
                      magnification: 1,
                      onSelectedItemChanged: (value) {
                        setState(() {});
                      },
                      itemExtent: 70.0,
                      children: List<Widget>.generate(20, (index) {
                        return Center(
                          child: CommonText(
                            text: '${1 + index}',
                            fontSize: 36.setFontSize,
                            fontFamily: Constant.fontFamilyMulishBold700,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          ),
                        );
                      }),
                    )),
              ),
              Container(width: 0.screenWidth / 20),
              CommonText(
                text: Languages.of(context).txtDays,
                fontSize: 24.setFontSize,
                fontFamily: Constant.fontFamilyMulishBold700,
                textColor: CustomAppColor.of(context).txtPrimary,
              ),
              Container(width: 0.screenWidth / 8),
            ],
          )
        ],
      ),
    );
  }
}
