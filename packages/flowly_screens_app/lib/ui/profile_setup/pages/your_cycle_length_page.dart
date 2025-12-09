import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class YourCycleLengthPage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourCycleLengthPage());
  }

  const YourCycleLengthPage({super.key});

  @override
  State<YourCycleLengthPage> createState() => _YourCycleLengthPageState();
}

class _YourCycleLengthPageState extends State<YourCycleLengthPage> {
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
            text: Languages.of(context).txtWhatsYourCycleLength,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourCycleLengthToEnhancePeriodForecastsAndWellnessSupport,
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
                      children: List<Widget>.generate(31, (index) {
                        return Center(
                          child: CommonText(
                            text: '${1 + index}',
                            fontSize: 34.setFontSize,
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
                fontSize: 26.setFontSize,
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
